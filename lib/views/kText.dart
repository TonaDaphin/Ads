import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextStyle? hintStyle;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;

  const KTextField({
    Key? key,
    this.title,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.minLines,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
          ),
        const SizedBox(height: 8),
        TextFormField(
          key: key,
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          cursorColor: borderColor ?? Theme.of(context).primaryColor,
          decoration: InputDecoration(
            iconColor: borderColor ?? Theme.of(context).primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 233, 233, 233),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            fillColor: const Color(0xFFEFF2F5),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: false,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
