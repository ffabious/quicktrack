import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add New Item'),
            content: content,
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
