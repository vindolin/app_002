import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '/models/app_data_provider.dart';
import 'widgets/checklist_list_widget.dart';

class ChecklistScreen extends ConsumerWidget {
  const ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklists = ref.watch(checklistsProvider.notifier);
    return Scaffold(
      body: const ChecklistListWidget(),
      floatingActionButton: IconButton(
        onPressed: () {
          checklists.add(faker.lorem.word());
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
