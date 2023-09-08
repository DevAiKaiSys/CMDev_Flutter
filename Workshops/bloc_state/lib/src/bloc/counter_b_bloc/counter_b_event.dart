part of 'counter_b_bloc.dart';

abstract class CounterBEvent extends Equatable {
  const CounterBEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterBEventAdd extends CounterBEvent {}

class CounterBEventReset extends CounterBEvent {}
