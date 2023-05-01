part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  final int transactionCount;
  const CounterState({
    this.counter = 5,
    this.transactionCount = 0,
  });

  CounterState copyWith({
    final int? counter,
    final int? transactionCount,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount,
      );

  @override
  List<Object> get props => [counter, transactionCount];
}

// class CounterInitial extends CounterState {}
