import 'package:flutter/material.dart';

enum AlertVariant { info, success, warning, error }

class CustomAlert extends StatelessWidget {
  final String message;
  final AlertVariant variant;
  final IconData? icon;
  final VoidCallback? onClose;

  const CustomAlert({
    super.key,
    required this.message,
    this.variant = AlertVariant.info,
    this.icon,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case AlertVariant.info:
        return _buildAlert(
          Colors.blue.shade50,
          Colors.blue.shade200,
          Colors.blue.shade700,
          icon ?? Icons.info_outline,
        );
      case AlertVariant.success:
        return _buildAlert(
          Colors.green.shade50,
          Colors.green.shade200,
          Colors.green.shade700,
          icon ?? Icons.check_circle_outline,
        );
      case AlertVariant.warning:
        return _buildAlert(
          Colors.orange.shade50,
          Colors.orange.shade200,
          Colors.orange.shade700,
          icon ?? Icons.warning_amber_outlined,
        );
      case AlertVariant.error:
        return _buildAlert(
          Colors.red.shade50,
          Colors.red.shade200,
          Colors.red.shade700,
          icon ?? Icons.error_outline,
        );
    }
  }

  Widget _buildAlert(
    Color backgroundColor,
    Color borderColor,
    Color textColor,
    IconData alertIcon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            alertIcon,
            color: textColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          if (onClose != null) ...[
            const SizedBox(width: 8),
            InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Icon(
                  Icons.close,
                  color: textColor.withOpacity(0.7),
                  size: 18,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}