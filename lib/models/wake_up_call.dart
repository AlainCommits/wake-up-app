class WakeUpCall {
  final String phoneNumber;
  final DateTime scheduledTime;
  final int maxRetries;
  final Duration retryInterval;
  bool isActive;

  WakeUpCall({
    required this.phoneNumber,
    required this.scheduledTime,
    required this.maxRetries,
    required this.retryInterval,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'scheduledTime': scheduledTime.toIso8601String(),
      'maxRetries': maxRetries,
      'retryInterval': retryInterval.inMinutes,
      'isActive': isActive,
    };
  }

  factory WakeUpCall.fromJson(Map<String, dynamic> json) {
    return WakeUpCall(
      phoneNumber: json['phoneNumber'],
      scheduledTime: DateTime.parse(json['scheduledTime']),
      maxRetries: json['maxRetries'],
      retryInterval: Duration(minutes: json['retryInterval']),
      isActive: json['isActive'],
    );
  }
}