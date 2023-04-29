import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/event_bloc.dart';
import 'package:learnbloc/bloc/main_bloc.dart';
import 'package:learnbloc/bloc/state_bloc.dart';

class CounterScreen extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          bloc: _counterBloc,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${state.count}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _counterBloc.add(IncrementEvent());
                      },
                      child: Text('Increment'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        _counterBloc.add(DecrementEvent());
                      },
                      child: Text('Decrement'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
