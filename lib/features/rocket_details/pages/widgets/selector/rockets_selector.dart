import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/colors/my_colors.dart';
import 'package:spacex/features/rocket_details/cubit/rocket_details_state.dart';
import 'package:spacex/features/rocket_details/pages/widgets/selector/rockets_list.dart';
import 'package:spacex/features/rocket_details/pages/widgets/selector/selector_title.dart';

class RocketsSelector extends StatelessWidget {
  const RocketsSelector({
    super.key,
    required this.state,
  });

  final RocketsLoaded state;

  static const double backgroundCornerRadius = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.sunglow,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(backgroundCornerRadius),
        ),
      ),
      child: Column(
        children: [
          const SelectorTitle(),
          RocketsList(
            rockets: state.rockets,
          ),
        ],
      ),
    );
  }
}
