part of 'mission_bloc.dart';

abstract class MissionEvent extends Equatable {
  const MissionEvent();

  @override
  List<Object> get props => [];
}

class FetchMission extends MissionEvent {
  final String missionId;

  const FetchMission(this.missionId);

  @override
  List<Object> get props => [missionId];
}
