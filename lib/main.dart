import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'club_page_bloc_with_plugin/club_page_bloc.dart';
import 'club_page_bloc_with_plugin/club_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     home: ClubPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClubPageBloc(),
      child: const MaterialApp(
        home: ClubPage(),
      ),
    );
  }
}
