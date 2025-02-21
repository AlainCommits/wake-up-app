import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/wake_up_call.dart';

class CallListItem extends StatelessWidget {
  final WakeUpCall call;
  final VoidCallback onDelete;

  const CallListItem({
    super.key,
    required this.call,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          call.phoneNumber.isEmpty ? 'Kein Kontakt ausgewählt' : call.phoneNumber,
        ),
        subtitle: Text(
          DateFormat('HH:mm').format(call.scheduledTime),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: call.isActive,
              onChanged: (value) {
                // Update call status
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}