import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/repository_grid_item.dart';

/// Repository grid view widget
class RepositoryGridView extends StatelessWidget {
  final HomeUiState uiState;

  const RepositoryGridView({super.key, required this.uiState});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: uiState.filteredRepositories.length,
      itemBuilder: (context, index) {
        final repository = uiState.filteredRepositories[index];
        return RepositoryGridItem(repository: repository);
      },
    );
  }
}
