import 'dart:async';
import 'package:shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'dart:convert';
import '../models/wake_up_call.dart';
import 'call_service.dart';

class SchedulerService {
  static final SchedulerService _instance = SchedulerService._internal();
  factory SchedulerService() => _instance;
  SchedulerService._internal();

  static const String _storageKey = 'scheduled_calls';
  final CallService _callService = CallService();
  late SharedPreferences _prefs;
  Timer? _schedulerTimer;

  Future<void> initialize() async {
    // Initialize WorkManager for background tasks
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    // Initialize SharedPreferences for persistence
    _prefs = await SharedPreferences.getInstance();
    
    // Start scheduling timer
    _startScheduler();
  }

  Future<void> scheduleCall(WakeUpCall call) async {
    // Save call to persistent storage
    final calls = await _loadCalls();
    calls.add(call);
    await _saveCalls(calls);

    // Schedule background task
    await Workmanager().registerOneOffTask(
      'wake_up_call_${call.scheduledTime.millisecondsSinceEpoch}',
      'makeCall',
      inputData: call.toJson(),
      initialDelay: call.scheduledTime.difference(DateTime.now()),
    );
  }

  Future<void> cancelCall(WakeUpCall call) async {
    final calls = await _loadCalls();
    calls.removeWhere((c) => 
      c.phoneNumber == call.phoneNumber && 
      c.scheduledTime == call.scheduledTime
    );
    await _saveCalls(calls);

    await Workmanager().cancelByUniqueName(
      'wake_up_call_${call.scheduledTime.millisecondsSinceEpoch}'
    );
  }

  Future<List<WakeUpCall>> getScheduledCalls() async {
    return _loadCalls();
  }

  Future<List<WakeUpCall>> _loadCalls() async {
    final String? jsonString = _prefs.getString(_storageKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((json) => WakeUpCall.fromJson(json))
        .where((call) => call.scheduledTime.isAfter(DateTime.now()))
        .toList();
  }

  Future<void> _saveCalls(List<WakeUpCall> calls) async {
    final jsonString = json.encode(
      calls.map((call) => call.toJson()).toList(),
    );
    await _prefs.setString(_storageKey, jsonString);
  }

  void _startScheduler() {
    _schedulerTimer?.cancel();
    _schedulerTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
      final calls = await _loadCalls();
      final now = DateTime.now();

      for (final call in calls) {
        if (call.isActive && 
            call.scheduledTime.isBefore(now) && 
            !CallService().isCallActive) {
          await _callService.makeCall(call);
        }
      }
    });
  }

  void dispose() {
    _schedulerTimer?.cancel();
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == 'makeCall' && inputData != null) {
      final call = WakeUpCall.fromJson(inputData);
      await CallService().makeCall(call);
    }
    return true;
  });
}