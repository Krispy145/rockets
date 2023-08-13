part of 'missions_bloc.dart';

abstract class MissionsEvent extends Equatable {
  const MissionsEvent();

  @override
  List<Object> get props => [];
}

class FetchMissions extends MissionsEvent {}

class FetchMission extends MissionsEvent {
  final String missionId;

  const FetchMission(this.missionId);

  @override
  List<Object> get props => [missionId];
}
