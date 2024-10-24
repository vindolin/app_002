import 'package:app_002/models/app_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import 'widgets/checklist_widget.dart';

class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklists = ref.watch(checklistsProvider.notifier);
    return Scaffold(
      body: const ChecklistWidget(),
      floatingActionButton: IconButton(
        onPressed: () {
          checklists.add(faker.lorem.word());
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}