part of 'rockets_bloc.dart';

abstract class RocketsState extends Equatable {
  const RocketsState();

  @override
  List<Object> get props => [];
}

///ROCKETS
class RocketsInitial extends RocketsState {}

class RocketsLoading extends RocketsState {}

class RocketsLoaded extends RocketsState {
  final List<RocketModel> rockets;

  const RocketsLoaded(this.rockets);

  @override
  List<Object> get props => [rockets];
}

class RocketsError extends RocketsState {
  final String message;

  const RocketsError(this.message);

  @override
  List<Object> get props => [message];
}

///ROCKET
class RocketInitial extends RocketsState {}

class RocketLoading extends RocketsState {}

class RocketLoaded extends RocketsState {
  final RocketModel rocket;

  const RocketLoaded(this.rocket);

  @override
  List<Object> get props => [rocket];
}

class RocketError extends RocketsState {
  final String message;

  const RocketError(this.message);

  @override
  List<Object> get props => [message];
}
