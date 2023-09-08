import 'dart:async';
import 'dart:developer';

import 'package:bloc_state/src/app_route.dart';
import 'package:bloc_state/src/bloc/app_bloc_observer.dart';
import 'package:bloc_state/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:bloc_state/src/bloc/counter_b_bloc/counter_b_bloc.dart';
import 'package:bloc_state/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(const MyApp());

  // BlocOverrides.runZoned(
  //   () {
  //     runApp(MyApp());
  //   },
  //   blocObserver: AppBlocObserver(),
  // );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterABloc =
        BlocProvider<CounterABloc>(create: (context) => CounterABloc());
    final counterBBloc =
        BlocProvider<CounterBBloc>(create: (context) => CounterBBloc());

    return MultiBlocProvider(
      providers: [counterABloc, counterBBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Home Page'),
      ),
    );
  }
}
