// Mocks generated by Mockito 5.4.5 from annotations
// in todo_list/test/todo_usecases_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_list/app/domain/entity/todo.dart' as _i2;
import 'package:todo_list/app/domain/repository/todo_repository.dart' as _i3;
import 'package:todo_list/app/domain/usecase/todo/find_todo_by_id_usecase.dart'
    as _i5;
import 'package:todo_list/app/domain/usecase/todo/update_todo_usecase.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTodo_0 extends _i1.SmartFake implements _i2.Todo {
  _FakeTodo_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [TodoRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoRepository extends _i1.Mock implements _i3.TodoRepository {
  MockTodoRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Todo> create(_i2.Todo? params) =>
      (super.noSuchMethod(
            Invocation.method(#create, [params]),
            returnValue: _i4.Future<_i2.Todo>.value(
              _FakeTodo_0(this, Invocation.method(#create, [params])),
            ),
          )
          as _i4.Future<_i2.Todo>);

  @override
  _i4.Future<void> createRandomTodos(String? params) =>
      (super.noSuchMethod(
            Invocation.method(#createRandomTodos, [params]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<_i2.Todo?> findById(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#findById, [id]),
            returnValue: _i4.Future<_i2.Todo?>.value(),
          )
          as _i4.Future<_i2.Todo?>);

  @override
  _i4.Future<List<_i2.Todo>> findAll() =>
      (super.noSuchMethod(
            Invocation.method(#findAll, []),
            returnValue: _i4.Future<List<_i2.Todo>>.value(<_i2.Todo>[]),
          )
          as _i4.Future<List<_i2.Todo>>);

  @override
  _i4.Future<_i2.Todo> update(_i2.Todo? params) =>
      (super.noSuchMethod(
            Invocation.method(#update, [params]),
            returnValue: _i4.Future<_i2.Todo>.value(
              _FakeTodo_0(this, Invocation.method(#update, [params])),
            ),
          )
          as _i4.Future<_i2.Todo>);

  @override
  _i4.Future<void> delete(_i2.Todo? todo) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [todo]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> deleteAll() =>
      (super.noSuchMethod(
            Invocation.method(#deleteAll, []),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}

/// A class which mocks [FindTodoByIdUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFindTodoByIdUsecase extends _i1.Mock
    implements _i5.FindTodoByIdUsecase {
  MockFindTodoByIdUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Todo?> call(int? params) =>
      (super.noSuchMethod(
            Invocation.method(#call, [params]),
            returnValue: _i4.Future<_i2.Todo?>.value(),
          )
          as _i4.Future<_i2.Todo?>);
}

/// A class which mocks [UpdateTodoUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateTodoUsecase extends _i1.Mock implements _i6.UpdateTodoUsecase {
  MockUpdateTodoUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Todo> call(_i2.Todo? params) =>
      (super.noSuchMethod(
            Invocation.method(#call, [params]),
            returnValue: _i4.Future<_i2.Todo>.value(
              _FakeTodo_0(this, Invocation.method(#call, [params])),
            ),
          )
          as _i4.Future<_i2.Todo>);
}
