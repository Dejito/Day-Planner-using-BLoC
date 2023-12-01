// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'bloc.dart';
// import 'event.dart';
// import 'state.dart';
//
// class TodoPage extends StatelessWidget {
//   const TodoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => TodoBloc()..add(InitEvent()),
//       child: Builder(builder: (context) => _buildPage(context)),
//     );
//   }
//
//   Widget _buildPage(BuildContext context) {
//     final bloc = BlocProvider.of<TodoBloc>(context);
//
//     return Container();
//   }
// }
//
