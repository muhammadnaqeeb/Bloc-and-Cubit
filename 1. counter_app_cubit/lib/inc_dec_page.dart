import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => counterCubit.increment(),
            tooltip: 'Increment',
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: () => counterCubit.decrement(),
            tooltip: 'Decrement',
            icon: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
