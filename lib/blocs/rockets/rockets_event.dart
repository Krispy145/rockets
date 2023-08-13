part of 'rockets_bloc.dart';

abstract class RocketsEvent extends Equatable {
  const RocketsEvent();

  @override
  List<Object> get props => [];
}

class FetchRockets extends RocketsEvent {}

class FetchRocket extends RocketsEvent {
  final String rocketId;

  const FetchRocket(this.rocketId);

  @override
  List<Object> get props => [rocketId];
}
