// import 'package:shared_preferences/shared_preferences.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_data_provider.g.dart';

// Students
//  $name1, <edit>, <remove>
//  $name2,
//  ...
//  <new>

// Checklists
//  $name1, <edit>
//    Checklist
//      $student1, <checked>
//      $student2, <checked>
//      ...
//  $name2
//  ...
//  <new>

class Checklist {
  // unique identifier
  final UniqueKey id = UniqueKey();
  final String name;
  final List<Student> students = [];
  Checklist(this.name);
}

class Student {
  final UniqueKey id = UniqueKey();
  final String name;
  Student(this.name);
}

@Riverpod(keepAlive: true)
class Checklists extends _$Checklists {
  @override
  List<Checklist> build() => List.generate(5, (_) => Checklist(faker.lorem.word()));

  void add(String name) {
    state = List.from(state)..add(Checklist(name));
  }

  void remove(UniqueKey id) {
    state = List.from(state)
      ..removeWhere(
        (checklist) {
          return checklist.id == id;
        },
      );
  }

  void assignStudent(UniqueKey checklistId, UniqueKey studentId) {
    final checklist = state.firstWhere((checklist) => checklist.id == checklistId);
    final student = ref.watch(studentsProvider).firstWhere((student) => student.id == studentId);
    checklist.students.add(student);
    // trigger build
    state = List.from(state);
  }

  void unassignStudent(UniqueKey checklistId, UniqueKey studentId) {
    final checklist = state.firstWhere((checklist) => checklist.id == checklistId);
    checklist.students.removeWhere(
      (student) => student.id == studentId,
    );
  }
}

@Riverpod(keepAlive: true)
class Students extends _$Students {
  @override
  List<Student> build() => List.generate(10, (_) => Student(faker.person.name()));

  void add(String name) {
    state = List.from(state)..add(Student(name));
  }

  void remove(UniqueKey id) {
    state = List.from(state)..removeWhere((student) => student.id == id);
  }
}
