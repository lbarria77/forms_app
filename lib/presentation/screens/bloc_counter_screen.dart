import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increasedCounter(BuildContext context, [int value = 1]) {
    //* Metodo fuera del bloc
    // context.read<CounterBloc>().add(
    //       CounterIncreased(value),
    //     );

    //* Metodo llamado desde el bloc
    context.read<CounterBloc>().increaseBy(value);
  }

  // void resetCounter(BuildContext context) {
  //   //* Metodo fuera del bloc
  //   // context.read<CounterBloc>().add(CounterReset());

  //   //* Metodo llamado desde el bloc
  //   context.read<CounterBloc>().resetCounter();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) =>
            Text('Bloc Counter: ${counterBloc.state.transactionCount}')),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().resetCounter(),
              icon: const Icon(
                Icons.refresh_outlined,
              ))
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Countervalue: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increasedCounter(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increasedCounter(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increasedCounter(context),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
