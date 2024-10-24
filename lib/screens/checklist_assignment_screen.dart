import 'package:app_002/models/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// assign students to checklist

class ChecklistAssignmentScreen extends ConsumerWidget {
  final UniqueKey id;
  const ChecklistAssignmentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider);
    final checklists = ref.watch(checklistsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Assignment'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: students.length,
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Row(
                children: [
                  Checkbox(
                    value: ref.watch(checklistsProvider).any(
                          (checklist) =>
                              checklist.id == id &&
                              checklist.students.contains(
                                students[index],
                              ),
                        ),
                    onChanged: (bool? value) {
                      // assign student to checklist
                      checklists.assignStudent(id, students[index].id);
                      // ref.watch(checklistsProvider.notifier).assignStudent(
                      //       id,
                      //       students[index].id,
                      //     );
                    },
                  ),
                  Text(
                    students[index].name,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
