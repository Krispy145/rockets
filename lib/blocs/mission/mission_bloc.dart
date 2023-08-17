import 'package:bloc/bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:rockets/models/mission/mission_model.dart';

part 'mission_event.dart';
part 'mission_state.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  MissionBloc() : super(MissionsInitial()) {
    on<FetchMission>(_fetchMission);
  }

  void _fetchMission(FetchMission event, Emitter<MissionState> emit) async {
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
