import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/constants/dimens.dart';
import 'package:flutter_podstawy_utilities/widgets/margins.dart';
import 'package:spacex/features/rocket_details/cubit/rocket_details_state.dart';
import 'package:spacex/features/rocket_details/domain/models/rocket.dart';
import 'package:spacex/features/rocket_details/pages/widgets/rocket_details/info_section.dart';
import 'package:spacex/features/rocket_details/pages/widgets/rocket_details/logo.dart';
import 'package:spacex/features/rocket_details/pages/widgets/rocket_details/rocket_name.dart';
import 'package:spacex/features/rocket_details/pages/widgets/rocket_details/rocket_secondary_details.dart';

class RocketDetails extends StatelessWidget {
  const RocketDetails({required this.state, super.key});

  final RocketsLoaded state;

  @override
  Widget build(BuildContext context) {
    var rocket = state.selectedRocket;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalBigMargin(),
          const Logo(),
          RocketName(name: rocket.name),
          _buildGeneralInfo(rocket),
          RocketSecondaryDetails(rocket: rocket),
        ],
      ),
    );
  }

  Widget _buildGeneralInfo(Rocket rocket) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.bigMargin,
        vertical: Dimens.normalMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoSection(title: tr("height"), subtitle: "${rocket.height} M"),
          InfoSection(title: tr("diameter"), subtitle: "${rocket.diameter} M"),
          InfoSection(title: tr("mass"), subtitle: "${rocket.mass} KG"),
        ],
      ),
    );
  }
}
