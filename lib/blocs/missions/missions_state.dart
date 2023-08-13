part of 'missions_bloc.dart';

abstract class MissionsState extends Equatable {
  const MissionsState();

  @override
  List<Object> get props => [];
}

class MissionsInitial extends MissionsState {}

class MissionsLoading extends MissionsState {}

class MissionsLoaded extends MissionsState {
  final List<MissionModel> missions;

  const MissionsLoaded(this.missions);

  @override
  List<Object> get props => [missions];
}

class MissionsError extends MissionsState {
  final String message;

  const MissionsError(this.message);

  @override
  List<Object> get props => [message];
}

class MissionInitial extends MissionsState {}

class MissionLoading extends MissionsState {}

class MissionLoaded extends MissionsState {
  final MissionModel mission;

  const MissionLoaded(this.mission);

  @override
  List<Object> get props => [mission];
}

class MissionError extends MissionsState {
  final String message;

  const MissionError(this.message);

  @override
  List<Object> get props => [message];
}
