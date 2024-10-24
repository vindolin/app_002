// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checklistsHash() => r'e2a2f475b7beaa26020702bfe899f4f3912639fb';

/// See also [Checklists].
@ProviderFor(Checklists)
final checklistsProvider =
    NotifierProvider<Checklists, List<Checklist>>.internal(
  Checklists.new,
  name: r'checklistsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$checklistsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Checklists = Notifier<List<Checklist>>;
String _$studentsHash() => r'6e90922602a7b95c12762f9b4047e0532caf2636';

/// See also [Students].
@ProviderFor(Students)
final studentsProvider = NotifierProvider<Students, List<Student>>.internal(
  Students.new,
  name: r'studentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$studentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Students = Notifier<List<Student>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
