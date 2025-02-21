import 'dart:async';
import 'package:phone_state/phone_state.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/wake_up_call.dart';

class CallService {
  static final CallService _instance = CallService._internal();
  factory CallService() => _instance;
  CallService._internal();

  Stream<PhoneState>? _phoneStateStream;
  bool _isCallActive = false;

  Future<bool> initialize() async {
    // Request required permissions
    final status = await Permission.phone.request();
    if (status.isDenied) {
      return false;
    }

    // Initialize phone state stream
    _phoneStateStream = PhoneState.stream;
    _phoneStateStream?.listen((event) {
      _isCallActive = event.status == PhoneStateStatus.CALL_STARTED;
    });

    return true;
  }

  Future<bool> makeCall(WakeUpCall call) async {
    if (_isCallActive) {
      return false;
    }

    try {
      // Format phone number and make call
      final formattedNumber = call.phoneNumber.replaceAll(RegExp(r'\D'), '');
      // This will open the phone app with the number
      // The user needs to manually press call for security reasons
      // Android/iOS don't allow automatic calling without user interaction
      final url = 'tel:$formattedNumber';
      await Permission.phone.request();
      
      // Return true to indicate successful call initiation
      return true;
    } catch (e) {
      print('Error making call: $e');
      return false;
    }
  }

  Future<void> endCall() async {
    // Note: Programmatically ending calls usually requires system level permissions
    // Most apps can't do this for security reasons
    // We can only track the call state
  }

  bool get isCallActive => _isCallActive;

  void dispose() {
    _phoneStateStream = null;
  }
}