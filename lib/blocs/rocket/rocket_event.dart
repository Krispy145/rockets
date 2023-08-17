part of 'rocket_bloc.dart';

abstract class RocketEvent extends Equatable {
  const RocketEvent();

  @override
  List<Object> get props => [];
}

class FetchRocket extends RocketEvent {
  final String rocketId;

  const FetchRocket(this.rocketId);

  @override
  List<Object> get props => [rocketId];
}
