import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_task/presentation/bloc/exhibit_bloc.dart';
import 'package:technical_task/presentation/pages/exhibits_page.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.locator<ExhibitBloc>()..add(OnGetExhibitList()),
      child: MaterialApp(
        title: 'Exhibits',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const ExhibitsPage(),
      ),
    );
  }
}