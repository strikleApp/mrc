import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget widget;

  const DecoratedContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).colorScheme.onPrimary)),
        child: Center(child: widget),
      ),
    );
  }
}
