part of 'counter_a_bloc.dart';

sealed class CounterAState extends Equatable {
  const CounterAState();
}

final class CounterAInitial extends CounterAState {
  @override
  List<Object> get props => [];
}
