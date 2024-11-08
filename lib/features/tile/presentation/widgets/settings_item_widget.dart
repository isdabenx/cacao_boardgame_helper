import 'package:cacao_boardgame_helper/features/tile/presentation/providers/tile_settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsItemWidget extends ConsumerWidget {
  const SettingsItemWidget({
    super.key,
    required this.title,
    required this.settingsName,
  });

  final String title;
  final String settingsName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tileSettings = ref.watch(tileSettingsNotifier);

    return ListTile(
      title: Text(title),
      trailing: Icon(
        tileSettings.settings(settingsName)
            ? Icons.check_box
            : Icons.check_box_outline_blank,
      ),
      onTap: () =>
          ref.read(tileSettingsNotifier.notifier).toggleSettings(settingsName),
    );
  }
}
