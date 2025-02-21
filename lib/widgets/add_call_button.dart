import 'package:flutter/material.dart';

class AddCallButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCallButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}