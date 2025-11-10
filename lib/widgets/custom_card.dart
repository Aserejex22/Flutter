import 'package:flutter/material.dart';

enum CardVariant { elevated, outlined, filled }

class CustomCard extends StatelessWidget {
  final Widget child;
  final CardVariant variant;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomCard({
    super.key,
    required this.child,
    this.variant = CardVariant.elevated,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case CardVariant.elevated:
        return _buildElevatedCard(context);
      case CardVariant.outlined:
        return _buildOutlinedCard(context);
      case CardVariant.filled:
        return _buildFilledCard(context);
    }
  }

  Widget _buildElevatedCard(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: child,
      ),
    );
  }

  Widget _buildOutlinedCard(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          width: 1.5,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.5),
        child: child,
      ),
    );
  }

  Widget _buildFilledCard(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: DefaultTextStyle(
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          child: child,
        ),
      ),
    );
  }
}