import 'package:flutter/material.dart';

enum ProgressVariant { linear, circular, custom }

class CustomProgress extends StatelessWidget {
  final double? value; // 0.0 - 1.0, null para indeterminado
  final ProgressVariant variant;
  final Color? color;
  final Color? backgroundColor;

  const CustomProgress({
    super.key,
    this.value,
    this.variant = ProgressVariant.linear,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ProgressVariant.linear:
        return _buildLinearProgress(context);
      case ProgressVariant.circular:
        return _buildCircularProgress(context);
      case ProgressVariant.custom:
        return _buildCustomProgress(context);
    }
  }

  Widget _buildLinearProgress(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor ?? 
            Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: value,
          color: color ?? Theme.of(context).colorScheme.primary,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  Widget _buildCircularProgress(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        value: value,
        color: color ?? Theme.of(context).colorScheme.primary,
        backgroundColor: backgroundColor ?? 
            Theme.of(context).colorScheme.surfaceVariant,
        strokeWidth: 4,
      ),
    );
  }

  Widget _buildCustomProgress(BuildContext context) {
    final progressColor = color ?? Theme.of(context).colorScheme.primary;
    final bgColor = backgroundColor ?? 
        Theme.of(context).colorScheme.surfaceVariant;

    return Container(
      width: double.infinity,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
        border: Border.all(
          color: progressColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          if (value != null)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: (MediaQuery.of(context).size.width - 32) * value!,
              height: 18,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                gradient: LinearGradient(
                  colors: [
                    progressColor,
                    progressColor.withOpacity(0.8),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: progressColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          if (value != null)
            Positioned.fill(
              child: Center(
                child: Text(
                  '${(value! * 100).toInt()}%',
                  style: TextStyle(
                    color: value! > 0.5 ? Colors.white : progressColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (value == null)
            Container(
              height: 18,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                gradient: LinearGradient(
                  colors: [
                    progressColor.withOpacity(0.3),
                    progressColor,
                    progressColor.withOpacity(0.3),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
              ),
            ),
        ],
      ),
    );
  }
}