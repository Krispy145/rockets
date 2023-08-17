part of 'mission_bloc.dart';

abstract class MissionState extends Equatable {
  const MissionState();

  @override
  List<Object> get props => [];
}

///MISSIONS
class MissionsInitial extends MissionState {}

class MissionsLoading extends MissionState {}

class MissionsLoaded extends MissionState {
  final List<MissionModel> missions;

  const MissionsLoaded(this.missions);

  @override
  List<Object> get props => [missions];
}

class MissionsError extends MissionState {
  final String message;

  const MissionsError(this.message);

  @override
  List<Object> get props => [message];
}

///MISSION
class MissionInitial extends MissionState {}

class MissionLoading extends MissionState {}

class MissionLoaded extends MissionState {
  final MissionModel mission;

  const MissionLoaded(this.mission);

  @override
  List<Object> get props => [mission];
}

class MissionError extends MissionState {
  final String message;

  const MissionError(this.message);

  @override
  List<Object> get props => [message];
}
