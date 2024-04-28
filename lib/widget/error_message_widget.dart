import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        errorMessage, textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),
      ),
    );
  }
}
