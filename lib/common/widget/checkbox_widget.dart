import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final ValueChanged<bool?> onChanged;
  final bool value;
  final String title;

  const CheckBoxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Colors.lightBlue,
          value: value,
          onChanged: onChanged,
        ),
        Text(
          title,
          //  style: theme.labelSmall,
        ),
      ],
    );
  }
}
