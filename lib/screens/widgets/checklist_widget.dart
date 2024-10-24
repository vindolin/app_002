import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/app_data_provider.dart';
import '/screens/checklist_assignment_screen.dart';

class ChecklistWidget extends ConsumerWidget {
  const ChecklistWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checklists = ref.watch(checklistsProvider);

    return ListView.builder(
      itemCount: checklists.length,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
          ),
          key: ValueKey<UniqueKey>(checklists[index].id),
          onDismissed: (DismissDirection direction) {
            ref.watch(checklistsProvider.notifier).remove(checklists[index].id);
          },
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  checklists[index].name,
                ),
                IconButton(
                    onPressed: () {
                      // go to checklist assignment screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChecklistAssignmentScreen(
                            id: checklists[index].id,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_note_outlined))
              ],
            ),
          ),
        );
      },
    );
  }
}
