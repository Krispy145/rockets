import 'package:bloc/bloc.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:rockets/models/rocket/rocket_model.dart';

part 'rocket_event.dart';
part 'rocket_state.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  RocketBloc() : super(RocketInitial()) {
    on<FetchRocket>(_fetchRocket);
  }

  void _fetchRocket(FetchRocket event, Emitter<RocketState> emit) async {
    Logger.print("Fetching rocket...", [LoggerFeature.rockets]);
    emit(RocketLoading());

    try {
      final rocket = await Managers.rocketsApi.fetchRocket(rocketId: event.rocketId);
      Logger.print("rocket fetched: $rocket", [LoggerFeature.rockets]);
      emit(RocketLoaded(rocket));
    } catch (e) {
      Logger.print("Failed to fetch rocket: $e", [LoggerFeature.rockets]);
      emit(RocketError('Failed to fetch rocket: $e'));
    }
  }
}
