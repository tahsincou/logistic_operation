import 'package:flutter/material.dart';
import 'package:logistic_operation/core/config/app_config.dart';

Future<bool?> showEnvironmentBottomSheet(BuildContext context) async {
  String selected = AppConfig.environment;

  return await showModalBottomSheet(
    context: context,
    builder: (_) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Environment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                RadioListTile<String>(
                  value: 'demo',
                  groupValue: selected,
                  title: const Text('Demo (JSON Server)'),
                  onChanged: (value) {
                    setState(() => selected = value!);
                  },
                ),

                RadioListTile<String>(
                  value: 'live',
                  groupValue: selected,
                  title: const Text('Live (Production API)'),
                  onChanged: (value) {
                    setState(() => selected = value!);
                  },
                ),

                FilledButton(
                  onPressed: () async {
                    if (selected != AppConfig.environment) {
                      await AppConfig.changeEnvironment(selected);

                      if (context.mounted) {
                        Navigator.pop(context, true);
                      }
                    } else {
                      Navigator.pop(context, false);
                    }
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
