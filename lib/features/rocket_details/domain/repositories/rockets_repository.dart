import 'package:spacex/features/rocket_details/data/data_sources/rockets_api.dart';
import 'package:spacex/features/rocket_details/data/models/rocket_dto.dart';
import 'package:spacex/features/rocket_details/domain/models/rocket.dart';
import 'package:spacex/features/rocket_details/mappers/rocket_mappers.dart';

class RocketsRepository {
  RocketsRepository(this.rocketsAPI, this.rocketMapper);

  final RocketsAPI rocketsAPI;
  final RocketMapper rocketMapper;

  final Map<String, RocketDto> _rockets = {};

  Future<List<Rocket>> getRockets() async {
    if (_rockets.isNotEmpty) {
      return _mapRockets(_rockets.values.toList());
    }

    var rocketsDto = await rocketsAPI.getRockets();
    for (var rocket in rocketsDto) {
      _rockets[rocket.id!] = rocket;
    }

    return _mapRockets(_rockets.values.toList());
  }

  Rocket? getRocket(String id) {
    if (!_rockets.containsKey(id)) {
      return null;
    }

    return _mapRocket(_rockets[id]!);
  }

  List<Rocket> _mapRockets(List<RocketDto> rockets) {
    return rockets.map((rocket) => _mapRocket(rocket)).toList();
  }

  Rocket _mapRocket(RocketDto rocket) {
    return rocketMapper.fromModel(rocket);
  }
}
