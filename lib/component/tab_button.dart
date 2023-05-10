import 'package:flutter/material.dart';

enum TabButtonAction { left, right }

class TabButton extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final ValueChanged<TabButtonAction> onPressed;

  const TabButton(
      {Key? key,
      required this.leftLabel,
      required this.rightLabel,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => onPressed(TabButtonAction.left),
              child: Text(leftLabel),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: OutlinedButton(
            onPressed: () => onPressed(TabButtonAction.right),
            child: Text(rightLabel),
          ))
        ],
      ),
    );
  }
}
