import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/wake_up_call.dart';
import '../widgets/call_list_item.dart';
import '../widgets/add_call_button.dart';
import '../services/scheduler_service.dart';
import '../services/call_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WakeUpCall> _scheduledCalls = [];
  final _schedulerService = SchedulerService();
  final _callService = CallService();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    // Request permissions
    await Permission.phone.request();
    await Permission.contacts.request();

    // Initialize services
    await _callService.initialize();
    await _schedulerService.initialize();

    // Load existing calls
    final calls = await _schedulerService.getScheduledCalls();
    setState(() {
      _scheduledCalls.clear();
      _scheduledCalls.addAll(calls);
      _isInitialized = true;
    });
  }

  Future<void> _addNewCall() async {
    // Show time picker
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    // Show phone number input dialog
    final phoneNumber = await showDialog<String>(
      context: context,
      builder: (context) => _PhoneNumberDialog(),
    );

    if (phoneNumber == null || phoneNumber.isEmpty) return;

    // Create and schedule new wake up call
    final newCall = WakeUpCall(
      phoneNumber: phoneNumber,
      scheduledTime: DateTime.now().copyWith(
        hour: time.hour,
        minute: time.minute,
        second: 0,
        millisecond: 0,
      ),
      maxRetries: 3,
      retryInterval: const Duration(minutes: 5),
    );

    await _schedulerService.scheduleCall(newCall);

    setState(() {
      _scheduledCalls.add(newCall);
    });
  }

  Future<void> _deleteCall(WakeUpCall call) async {
    await _schedulerService.cancelCall(call);
    setState(() {
      _scheduledCalls.remove(call);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wake Up Calls'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen (to be implemented)
            },
          ),
        ],
      ),
      body: _scheduledCalls.isEmpty
          ? Center(
              child: Text(
                'Keine Weckrufe geplant',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: _scheduledCalls.length,
              itemBuilder: (context, index) {
                return CallListItem(
                  call: _scheduledCalls[index],
                  onDelete: () => _deleteCall(_scheduledCalls[index]),
                );
              },
            ),
      floatingActionButton: AddCallButton(onPressed: _addNewCall),
    );
  }

  @override
  void dispose() {
    _schedulerService.dispose();
    _callService.dispose();
    super.dispose();
  }
}

class _PhoneNumberDialog extends StatefulWidget {
  @override
  _PhoneNumberDialogState createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<_PhoneNumberDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Telefonnummer eingeben'),
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: 'z.B. +49123456789',
          labelText: 'Telefonnummer',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Abbrechen'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}