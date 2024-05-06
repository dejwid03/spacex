import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'rocket_item.g.dart';

@CopyWith()
class RocketItem extends Equatable {
  const RocketItem({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  final String id;
  final String name;
  final bool isSelected;

  @override
  List<Object?> get props => [id, name, isSelected];
}
