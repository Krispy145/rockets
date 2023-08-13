import 'package:dio/dio.dart';
import 'package:rockets/app/dependency_injection/injection_container.dart';
import 'package:rockets/app/utils/logger/logger.dart';
import 'package:rockets/models/rocket/rocket_model.dart';

abstract class RocketsRepository {
  Future<List<RocketModel>> fetchRockets();
  Future<RocketModel> fetchRocket({required String rocketId});
}

class ApiRocketsRepository implements RocketsRepository {
  final Dio _dio;

  ApiRocketsRepository(this._dio);

  //Rockets path prefix
  String get pathPrefix => "${Managers.flavor.apiPrefix}/rockets";

  // Fetch all rockets
  @override
  Future<List<RocketModel>> fetchRockets() async {
    Logger.print("Fetching Rockets", [LoggerFeature.rockets]);
    final response = await _dio.get(pathPrefix);
    Logger.print("Response: $response", [LoggerFeature.rockets]);

    if (response.data is List) {
      final List<dynamic> dataList = response.data;
      final List<RocketModel> rockets = dataList.map((json) => RocketModel.fromJson(json as Map<String, dynamic>)).toList();
      return rockets;
    } else {
      // Handle the case where the response data is not in the expected format
      throw Exception("Unexpected response data format");
    }
  }

  //Fetch mission by rocketId
  @override
  Future<RocketModel> fetchRocket({required String rocketId}) async {
    final response = await _dio.get("$pathPrefix/$rocketId");
    return RocketModel.fromJson(response.data);
  }
}
