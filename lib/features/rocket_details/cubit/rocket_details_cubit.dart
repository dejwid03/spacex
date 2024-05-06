import 'package:spacex/features/base/cubit_base.dart';
import 'package:spacex/features/rocket_details/cubit/rocket_details_state.dart';
import 'package:spacex/features/rocket_details/domain/repositories/rockets_repository.dart';
import 'package:spacex/features/rocket_details/mappers/rocket_mappers.dart';
import 'package:spacex/features/rocket_details/models/rocket_item.dart';

class RocketDetailsCubit extends CubitBase<RocketDetailsState> {
  RocketDetailsCubit(this._rocketsRepository, this._rocketItemMapper)
      : super(RocketsInitialState());

  List<RocketItem> _rockets = [];

  final RocketsRepository _rocketsRepository;
  final RocketItemMapper _rocketItemMapper;

  Future<void> initialize() async {
    var rockets = await _rocketsRepository.getRockets();
    final selectedRocket = rockets.first;

    _rockets = rockets
        .map((rocketToMap) => _rocketItemMapper.fromModel(
            rocketToMap, rocketToMap.id == selectedRocket.id))
        .toList();

    emit(RocketsLoaded(selectedRocket, [..._rockets]));
  }

  void changeRocket(String selectedRocketId) {
    for (int i = 0; i < _rockets.length; i++) {
      var rocket = _rockets[i];
      _rockets[i] = rocket.copyWith(isSelected: rocket.id == selectedRocketId);
    }

    var selectedRocket = _rocketsRepository.getRocket(selectedRocketId);
    emit(RocketsLoaded(selectedRocket!, [..._rockets]));
  }
}
