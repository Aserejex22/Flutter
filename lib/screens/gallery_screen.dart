import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_avatar.dart';
import '../widgets/custom_badge.dart';
import '../widgets/custom_chip.dart';
import '../widgets/custom_alert.dart';
import '../widgets/custom_input.dart';
import '../widgets/custom_progress.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Galería de Componentes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botones
            _buildComponentSection(
              context,
              '🔘 Botones Personalizados',
              'Botones con diferentes variantes visuales',
              [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'Primary',
                      variant: ButtonVariant.primary,
                    ),
                    CustomButton(
                      text: 'Secondary', 
                      variant: ButtonVariant.secondary,
                    ),
                    CustomButton(
                      text: 'Outlined',
                      variant: ButtonVariant.outlined,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Tarjetas
            _buildComponentSection(
              context,
              '📇 Tarjetas Personalizadas',
              'Contenedores con diferentes estilos',
              [
                const Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        variant: CardVariant.elevated,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Elevated Card\nCon sombra'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomCard(
                        variant: CardVariant.outlined,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Outlined Card\nCon borde'),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomCard(
                        variant: CardVariant.filled,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Filled Card\nCon fondo'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Avatares
            _buildComponentSection(
              context,
              '👤 Avatares Personalizados',
              'Avatares con diferentes formas',
              [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CustomAvatar(
                          initials: 'JD',
                          variant: AvatarVariant.circular,
                          size: 60,
                        ),
                        SizedBox(height: 8),
                        Text('Circular'),
                      ],
                    ),
                    Column(
                      children: [
                        CustomAvatar(
                          initials: 'MR',
                          variant: AvatarVariant.rounded,
                          size: 60,
                        ),
                        SizedBox(height: 8),
                        Text('Rounded'),
                      ],
                    ),
                    Column(
                      children: [
                        CustomAvatar(
                          initials: 'AB',
                          variant: AvatarVariant.square,
                          size: 60,
                        ),
                        SizedBox(height: 8),
                        Text('Square'),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Badges
            _buildComponentSection(
              context,
              '🏷️ Badges de Estado',
              'Etiquetas de estado e información',
              [
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    CustomBadge(text: 'Info', variant: BadgeVariant.info),
                    CustomBadge(text: 'Success', variant: BadgeVariant.success),
                    CustomBadge(text: 'Warning', variant: BadgeVariant.warning),
                    CustomBadge(text: 'Error', variant: BadgeVariant.error),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Chips
            _buildComponentSection(
              context,
              '🔖 Chips Personalizados',
              'Chips para selección y filtrado',
              [
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    CustomChip(
                      label: 'Default Chip',
                      variant: ChipVariant.standard,
                    ),
                    CustomChip(
                      label: 'Outlined Chip',
                      variant: ChipVariant.outlined,
                    ),
                    CustomChip(
                      label: 'Colored Chip',
                      variant: ChipVariant.colored,
                      selected: true,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Alertas
            _buildComponentSection(
              context,
              '⚠️ Alertas Personalizadas',
              'Mensajes informativos y de estado',
              [
                Column(
                  children: const [
                    CustomAlert(
                      message: 'Esta es una alerta informativa',
                      variant: AlertVariant.info,
                      icon: Icons.info,
                    ),
                    SizedBox(height: 8),
                    CustomAlert(
                      message: 'Operación completada exitosamente',
                      variant: AlertVariant.success,
                      icon: Icons.check_circle,
                    ),
                    SizedBox(height: 8),
                    CustomAlert(
                      message: 'Advertencia: Revisa los datos',
                      variant: AlertVariant.warning,
                      icon: Icons.warning,
                    ),
                    SizedBox(height: 8),
                    CustomAlert(
                      message: 'Error: No se pudo completar la acción',
                      variant: AlertVariant.error,
                      icon: Icons.error,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Inputs
            _buildComponentSection(
              context,
              '✏️ Campos de Entrada',
              'Campos de texto personalizados',
              [
                const Column(
                  children: [
                    CustomInput(
                      hintText: 'Standard Input',
                      variant: InputVariant.standard,
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: 16),
                    CustomInput(
                      hintText: 'Outlined Input',
                      variant: InputVariant.outlined,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(height: 16),
                    CustomInput(
                      hintText: 'Filled Input',
                      variant: InputVariant.filled,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Progress Indicators
            _buildComponentSection(
              context,
              '⏳ Indicadores de Progreso',
              'Indicadores de carga y progreso',
              [
                Column(
                  children: const [
                    Text('Linear Progress'),
                    SizedBox(height: 8),
                    CustomProgress(
                      value: 0.7,
                      variant: ProgressVariant.linear,
                    ),
                    SizedBox(height: 16),
                    Text('Circular Progress'),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomProgress(
                          value: 0.6,
                          variant: ProgressVariant.circular,
                        ),
                        CustomProgress(
                          variant: ProgressVariant.circular,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text('Custom Progress'),
                    SizedBox(height: 8),
                    CustomProgress(
                      value: 0.8,
                      variant: ProgressVariant.custom,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Footer
            const Center(
              child: Text(
                '🚀 Galería de Componentes Flutter\nCreada para la práctica de desarrollo móvil',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildComponentSection(
    BuildContext context,
    String title,
    String description,
    List<Widget> widgets,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 20),
          ...widgets,
        ],
      ),
    );
  }
}