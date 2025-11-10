import 'package:flutter/material.dart';

enum BadgeVariant { info, success, warning, error }

class CustomBadge extends StatelessWidget {
  final String text;
  final BadgeVariant variant;

  const CustomBadge({
    super.key,
    required this.text,
    this.variant = BadgeVariant.info,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case BadgeVariant.info:
        return _buildBadge(Colors.blue, Colors.blue.shade50, Colors.white);
      case BadgeVariant.success:
        return _buildBadge(Colors.green, Colors.green.shade50, Colors.white);
      case BadgeVariant.warning:
        return _buildBadge(Colors.orange, Colors.orange.shade50, Colors.white);
      case BadgeVariant.error:
        return _buildBadge(Colors.red, Colors.red.shade50, Colors.white);
    }
  }

  Widget _buildBadge(Color backgroundColor, Color lightBackground, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}