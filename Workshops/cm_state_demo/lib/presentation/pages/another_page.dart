import 'package:cm_state_demo/presentation/blocs/counter_a_bloc/counter_a_bloc.dart';
import 'package:cm_state_demo/presentation/blocs/counter_b_bloc/counter_b_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key, required this.title});

  final String title;

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterA:',
                ),
                BlocBuilder<CounterABloc, CounterAState>(
                  builder: (context, state) {
                    return Text(
                      '${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterA:',
                ),
                BlocBuilder<CounterBBloc, CounterBState>(
                  builder: (context, state) {
                    return Text(
                      '${state.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'a1',
                onPressed: () =>
                    context.read<CounterABloc>().add(CounterAEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'a2',
                onPressed: () =>
                    context.read<CounterABloc>().add(CounterAEventAdd()),
                tooltip: 'Add',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'b1',
                onPressed: () =>
                    context.read<CounterBBloc>().add(CounterBEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                heroTag: 'b2',
                onPressed: () =>
                    context.read<CounterBBloc>().add(CounterBEventAdd()),
                tooltip: 'Add',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
