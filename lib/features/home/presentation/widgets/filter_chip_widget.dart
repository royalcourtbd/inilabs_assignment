import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/utility/extensions.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_presenter.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';

/// Individual filter chip widget
class FilterChipWidget extends StatelessWidget {
  final String label;
  final FilterType type;
  final HomeUiState uiState;
  final HomePresenter homePresenter;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.type,
    required this.uiState,
    required this.homePresenter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = uiState.filterType == type;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          homePresenter.changeFilterType(type);
        }
      },
      selectedColor: theme.primaryColor.withOpacityPercent(20),
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: isSelected
            ? theme.primaryColor
            : theme.textTheme.bodyMedium?.color,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      checkmarkColor: theme.primaryColor,
    );
  }
}
