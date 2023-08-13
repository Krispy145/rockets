import 'package:bloc/bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:rockets/models/mission/mission_model.dart';

part 'missions_event.dart';
part 'missions_state.dart';

class MissionsBloc extends Bloc<MissionsEvent, MissionsState> {
  MissionsBloc() : super(MissionsInitial()) {
    on<FetchMissions>(_fetchMissions);
    on<FetchMission>(_fetchMission);
  }

  void _fetchMissions(FetchMissions event, Emitter<MissionsState> emit) async {
    Logger.print("Fetching missions...", [LoggerFeature.missions]);
    emit(MissionsLoading());

    try {
      final missions = await Managers.missionsApi.fetchMissions();
      Logger.print("Missions fetched: $missions", [LoggerFeature.missions]);
      emit(MissionsLoaded(missions));
    } catch (e) {
      Logger.print("Failed to fetch missions: $e", [LoggerFeature.missions]);
      emit(MissionsError('Failed to fetch missions: $e'));
    }
  }

  void _fetchMission(FetchMission event, Emitter<MissionsState> emit) async {
    Logger.print("Fetching mission...", [LoggerFeature.missions]);
    emit(MissionsLoading());

    try {
      final mission = await Managers.missionsApi.fetchMission(missionId: event.missionId);
      Logger.print("Mission fetched: $mission", [LoggerFeature.missions]);
      emit(MissionLoaded(mission));
    } catch (e) {
      Logger.print("Failed to fetch mission: $e", [LoggerFeature.missions]);
      emit(MissionsError('Failed to fetch mission: $e'));
    }
  }
}
