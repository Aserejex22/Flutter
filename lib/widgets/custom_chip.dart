import 'package:flutter/material.dart';

enum ChipVariant { standard, outlined, colored }

class CustomChip extends StatelessWidget {
  final String label;
  final ChipVariant variant;
  final VoidCallback? onDeleted;
  final bool selected;

  const CustomChip({
    super.key,
    required this.label,
    this.variant = ChipVariant.standard,
    this.onDeleted,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ChipVariant.standard:
        return _buildStandardChip(context);
      case ChipVariant.outlined:
        return _buildOutlinedChip(context);
      case ChipVariant.colored:
        return _buildColoredChip(context);
    }
  }

  Widget _buildStandardChip(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: selected 
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: selected 
          ? Theme.of(context).colorScheme.primary.withOpacity(0.8)
          : Theme.of(context).colorScheme.surfaceVariant,
      deleteIcon: onDeleted != null ? const Icon(Icons.close, size: 18) : null,
      onDeleted: onDeleted,
      elevation: selected ? 2 : 0,
      shadowColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  Widget _buildOutlinedChip(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: selected 
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: selected 
          ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
          : Colors.transparent,
      deleteIcon: onDeleted != null ? const Icon(Icons.close, size: 18) : null,
      onDeleted: onDeleted,
      side: BorderSide(
        color: selected 
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  Widget _buildColoredChip(BuildContext context) {
    final chipColor = selected ? Colors.purple : Colors.teal;
    
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: chipColor,
      deleteIcon: onDeleted != null 
          ? const Icon(Icons.close, size: 18, color: Colors.white) 
          : null,
      onDeleted: onDeleted,
      elevation: 3,
      shadowColor: chipColor.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}