import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/repository_list_item.dart';

/// Repository list view widget
class RepositoryListView extends StatelessWidget {
  final HomeUiState uiState;

  const RepositoryListView({super.key, required this.uiState});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding12,
      itemCount: uiState.filteredRepositories.length,
      itemBuilder: (context, index) {
        final repository = uiState.filteredRepositories[index];
        return RepositoryListItem(repository: repository);
      },
    );
  }
}
