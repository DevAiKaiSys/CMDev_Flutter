part of 'counter_a_bloc.dart';

abstract class CounterAState extends Equatable {
  const CounterAState();
}

class CounterAInitial extends CounterAState {
  @override
  List<Object> get props => [];
}
