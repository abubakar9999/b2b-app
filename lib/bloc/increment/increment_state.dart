part of 'increment_bloc.dart';

@immutable
sealed class IncrementState {}

final class IncrementInitial extends IncrementState {}
  class IncremintDecrementState extends IncrementState {
  int val;
 IncremintDecrementState({required this.val});
  

}