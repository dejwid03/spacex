import 'package:equatable/equatable.dart';
import 'package:spacex/features/rocket_details/domain/models/rocket.dart';
import 'package:spacex/features/rocket_details/models/rocket_item.dart';

abstract class RocketDetailsState extends Equatable {
  const RocketDetailsState();
}

class RocketsInitialState extends RocketDetailsState {
  @override
  List<Object?> get props => [];
}

class RocketsLoaded extends RocketDetailsState {
  const RocketsLoaded(this.selectedRocket, this.rockets) : super();

  final Rocket selectedRocket;
  final List<RocketItem> rockets;
  
  @override
  List<Object?> get props => [rockets, selectedRocket];
}
