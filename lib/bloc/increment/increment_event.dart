part of 'increment_bloc.dart';

@immutable
sealed class IncrementEvent {}
class IncsrementEvent extends IncrementEvent {
  int value;
  IncsrementEvent({
    required this.value,
  });
  
}
class DecrementEvent extends IncrementEvent {
  int value;
  DecrementEvent({
    required this.value,
  });
  
}
