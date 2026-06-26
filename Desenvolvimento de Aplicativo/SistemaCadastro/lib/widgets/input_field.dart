import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String? value;
  final ValueChanged<String>? onChanged;
  final String? placeholder;
  final bool obscureText;
  final String? error;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final bool enabled;

  const InputField({
    Key? key,
    required this.label,
    this.value,
    this.onChanged,
    this.placeholder,
    this.obscureText = false,
    this.error,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: value != null ? TextEditingController(text: value) : null,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFDDDDDD)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: error != null && error!.isNotEmpty
                    ? Colors.red
                    : const Color(0xFFDDDDDD),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: error != null && error!.isNotEmpty
                    ? Colors.red
                    : const Color(0xFF3498DB),
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            filled: true,
            fillColor: error != null && error!.isNotEmpty
                ? const Color(0xFFFFF5F5)
                : const Color(0xFFF9F9F9),
            errorText: error != null && error!.isNotEmpty ? error : null,
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          enabled: enabled,
        ),
      ],
    );
  }
}