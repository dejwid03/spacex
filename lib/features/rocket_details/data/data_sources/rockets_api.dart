import 'package:dio/dio.dart';
import 'package:spacex/features/rocket_details/data/models/rocket_dto.dart';

class RocketsAPI {
  RocketsAPI(this.httpClient);

  final Dio httpClient;

  Future<List<RocketDto>> getRockets() async {
    var response = await httpClient.get<String>("/rockets");
    var toParse = response.data!;
    return rocketDtoFromJson(toParse);
  }
}
