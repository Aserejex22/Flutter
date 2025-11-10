import 'package:flutter/material.dart';

enum AvatarVariant { circular, rounded, square }

class CustomAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final AvatarVariant variant;
  final double size;
  final Color? backgroundColor;

  const CustomAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.variant = AvatarVariant.circular,
    this.size = 50.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case AvatarVariant.circular:
        return _buildCircularAvatar(context);
      case AvatarVariant.rounded:
        return _buildRoundedAvatar(context);
      case AvatarVariant.square:
        return _buildSquareAvatar(context);
    }
  }

  Widget _buildCircularAvatar(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null && initials != null
          ? Text(
              initials!,
              style: TextStyle(
                color: Colors.white,
                fontSize: size * 0.35,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }

  Widget _buildRoundedAvatar(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(size * 0.25), // 25% del tamaño para esquinas redondeadas
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildSquareAvatar(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(4), // Esquinas ligeramente redondeadas
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}