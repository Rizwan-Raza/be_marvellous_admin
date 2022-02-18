import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextInputType? keyboardType;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const CustomTextFormField(
      {Key? key,
      required this.label,
      required this.icon,
      this.initialValue,
      this.validator,
      this.onSaved,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          style: TextStyle(color: Colors.red),
          decoration: InputDecoration(
              labelText: label, hintText: label, icon: Icon(icon)),
          validator: validator,
          onSaved: onSaved,
        ));
  }
}
