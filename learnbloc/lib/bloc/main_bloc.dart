import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/event_bloc.dart';
import 'package:learnbloc/bloc/state_bloc.dart';

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitial());

//   @override
//   Stream<CounterState> mapEventToState(CounterEvent event) async* {
//     if (event is IncrementEvent) {
//       yield CounterState(count: state.count + 1);
//     } else if (event is DecrementEvent) {
//       yield CounterState(count: state.count - 1);
//     }
//   }
// }

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(count: state.count + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(count: state.count - 1);
    }
  }
}