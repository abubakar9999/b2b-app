import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementInitial()) {
    on<IncsrementEvent>((event, emit) {
      print('+++++++++++++++++++++++');
      // print(event.value+1);
      event.value=event.value+1;
      print(event.value);


      emit(IncremintDecrementState(val:event.value));

    });
    on<DecrementEvent>((event, emit) {
      


      emit(IncremintDecrementState(val:event.value--));

    });
  }
}
