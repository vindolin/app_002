import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '/models/app_data_provider.dart';

class StudentListWidget extends ConsumerWidget {
  const StudentListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider);
    students.sort((a, b) => a.name.compareTo(b.name));

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
