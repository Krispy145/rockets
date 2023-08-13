import 'package:dio/dio.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';

import 'package:rockets/models/mission/mission_model.dart';

abstract class MissionsRepository {
  Future<List<MissionModel>> fetchMissions();
  Future<MissionModel> fetchMission({required String missionId});
}

class ApiMissionsRepository implements MissionsRepository {
  final Dio _dio;

  ApiMissionsRepository(this._dio);

  //Missions path prefix
  String get pathPrefix => "${Managers.flavor.apiPrefix}/missions";

  // Fetch all missions
  @override
  Future<List<MissionModel>> fetchMissions() async {
    Logger.print("Fetching Missions", [LoggerFeature.missions]);
    final response = await _dio.get(pathPrefix);
    Logger.print("Response: $response", [LoggerFeature.missions]);

    if (response.data is List) {
      final List<dynamic> dataList = response.data;
      final List<MissionModel> missions = dataList.map((json) => MissionModel.fromJson(json as Map<String, dynamic>)).toList();
      return missions;
    } else {
      // Handle the case where the response data is not in the expected format
      throw Exception("Unexpected response data format");
    }
  }

  //Fetch mission by missionId
  @override
  Future<MissionModel> fetchMission({required String missionId}) async {
    final response = await _dio.get("$pathPrefix/$missionId");
    return MissionModel.fromJson(response.data);
  }
}
