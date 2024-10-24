import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '/models/app_data_provider.dart';
import 'widgets/student_widget.dart';

class StudentScreen extends ConsumerWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider.notifier);
    return Scaffold(
      body: const StudentWidget(),
      floatingActionButton: IconButton(
        onPressed: () {
          students.add(faker.person.name());
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
