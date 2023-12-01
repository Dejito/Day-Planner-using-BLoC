import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../data/todo.dart';
import 'event.dart';
import 'state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStarted>(_onStarted);
    on<AddTodo>(_onAddTodo);
    on<RemoveTodo>(_onRemoveTodo);
    on<AlterTodo>(_loc onAlterTodo);
  }

  void _onStarted(TodoStarted event, Emitter<TodoState> emit) {
    if (state.status == TodoStatus.success) return;
    emit(state.copyWith(todos: state.todos, status: TodoStatus.success));
  }

  void _onAddTodo(AddTodo event, Emitter<TodoState> emit) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      List<Todo> temp = [];
      temp.addAll(state.todos);
      temp.insert(0, event.todo);
      emit(state.copyWith(todos: temp, status: TodoStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: TodoStatus.error),
      );
    }
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
