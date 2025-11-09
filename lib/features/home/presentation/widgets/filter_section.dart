import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_presenter.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/filter_chip_widget.dart';

/// Filter section widget with filter chips and sort options
class FilterSection extends StatelessWidget {
  final HomeUiState uiState;
  final HomePresenter homePresenter;

  const FilterSection({
    super.key,
    required this.uiState,
    required this.homePresenter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding16,
      decoration: BoxDecoration(color: theme.cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Filter by:',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW16,
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChipWidget(
                        label: 'Name',
                        type: FilterType.name,
                        uiState: uiState,
                        homePresenter: homePresenter,
                      ),
                      gapW8,
                      FilterChipWidget(
                        label: 'Date',
                        type: FilterType.date,
                        uiState: uiState,
                        homePresenter: homePresenter,
                      ),
                      gapW8,
                      FilterChipWidget(
                        label: 'Stars',
                        type: FilterType.stars,
                        uiState: uiState,
                        homePresenter: homePresenter,
                      ),
                      gapW8,
                      FilterChipWidget(
                        label: 'Forks',
                        type: FilterType.forks,
                        uiState: uiState,
                        homePresenter: homePresenter,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Text(
                'Sort:',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              gapW16,
              InkWell(
                onTap: () => homePresenter.toggleSortOrder(),
                child: Row(
                  children: [
                    Icon(
                      uiState.sortOrder == SortOrder.ascending
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      size: 20,
                    ),
                    gapW4,
                    Text(
                      uiState.sortOrder == SortOrder.ascending
                          ? 'Ascending'
                          : 'Descending',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
