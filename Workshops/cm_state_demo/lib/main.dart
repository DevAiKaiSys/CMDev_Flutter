import 'package:cm_state_demo/presentation/blocs/app_bloc_observer.dart';
import 'package:cm_state_demo/presentation/blocs/counter_a_bloc/counter_a_bloc.dart';
import 'package:cm_state_demo/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterABloc =
        BlocProvider<CounterABloc>(create: (context) => CounterABloc());
    /*final counterBBloc =
        BlocProvider<CounterBBloc>(create: (context) => CounterBBloc());*/

    return MultiBlocProvider(
      providers: [counterABloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'HomePage'),
      ),
    );
  }
}
