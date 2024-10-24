import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/student_screen.dart';
import 'screens/checklist_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: ChecklistenApp()),
  );
}

final tabData = {
  'Schüler': const StudentScreen(),
  'Checklisten': const ChecklistScreen(),
};

class ChecklistenApp extends StatelessWidget {
  const ChecklistenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                tabs: tabData.keys
                    .map(
                      (title) => Tab(
                        text: title,
                      ),
                    )
                    .toList()),
            title: const Text('Checklisten'),
          ),
          body: TabBarView(
            children: tabData.values.toList(),
          ),
        ),
      ),
    );
  }
}
