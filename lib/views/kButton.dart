import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final bool showArrow;
  final bool isOutlined;
  final Color? backgroundColor;

  const KButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.showArrow = false,
    this.backgroundColor,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor != null
                  ? isOutlined
                      ? Colors.white
                      : backgroundColor
                  : Theme.of(context).primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: isOutlined
                    ? BorderSide(color: backgroundColor!)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 16,
              ),
            ),
            child: Row(
              mainAxisAlignment: showArrow
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                if (showArrow) const SizedBox(width: 32),
                SizedBox(
                  height: 24,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: isOutlined ? backgroundColor : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
