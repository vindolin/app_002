import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/student_screen.dart';
import 'screens/checklist_screen.dart';

void main() {
  runApp(
    const ProviderScope(child: TestApp()),
  );
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

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
            title: const Text('Demo App'),
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
