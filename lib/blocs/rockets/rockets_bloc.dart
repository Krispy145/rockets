import 'package:bloc/bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:rockets/models/rocket/rocket_model.dart';

part 'rockets_event.dart';
part 'rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  RocketsBloc() : super(RocketsInitial()) {
    on<FetchRockets>(_fetchRockets);
  }

  void _fetchRockets(FetchRockets event, Emitter<RocketsState> emit) async {
    Logger.print("Fetching rockets...", [LoggerFeature.rockets]);
    emit(RocketsLoading());

    try {
      final rockets = await Managers.rocketsApi.fetchRockets();
      Logger.print("rockets fetched: $rockets", [LoggerFeature.rockets]);
      emit(RocketsLoaded(rockets));
    } catch (e) {
      Logger.print("Failed to fetch rockets: $e", [LoggerFeature.rockets]);
      emit(RocketsError('Failed to fetch rockets: $e'));
    }
  }
}
