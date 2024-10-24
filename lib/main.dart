import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/student_screen.dart';
import 'screens/checklist_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: ChecklistenApp()),
  );
}

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
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Schüler',
                ),
                Tab(
                  text: 'Checklisten',
                ),
              ],
            ),
            title: const Text('Checklisten'),
          ),
          body: const TabBarView(
            children: [
              StudentScreen(),
              ChecklistScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
