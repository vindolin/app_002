import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '/models/app_data_provider.dart';

class StudentWidget extends ConsumerWidget {
  const StudentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider);

    return ListView.builder(
      itemCount: students.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: ValueKey<UniqueKey>(students[index].id),
          onDismissed: (DismissDirection direction) {
            ref.watch(studentsProvider.notifier).remove(students[index].id);
          },
          child: ListTile(
            title: Text(
              students[index].name,
            ),
          ),
        );
      },
    );
  }
}
