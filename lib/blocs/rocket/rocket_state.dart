part of 'rocket_bloc.dart';

abstract class RocketState extends Equatable {
  const RocketState();

  @override
  List<Object> get props => [];
}

///ROCKET
class RocketInitial extends RocketState {}

class RocketLoading extends RocketState {}

class RocketLoaded extends RocketState {
  final RocketModel rocket;

  const RocketLoaded(this.rocket);

  @override
  List<Object> get props => [rocket];
}

class RocketError extends RocketState {
  final String message;

  const RocketError(this.message);

  @override
  List<Object> get props => [message];
}
