import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/core/widgets/presentable_widget_builder.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_presenter.dart';
import 'package:inilabs_assignment/features/home/presentation/presenter/home_ui_state.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/empty_state_widget.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/filter_section.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/repository_grid_view.dart';
import 'package:inilabs_assignment/features/home/presentation/widgets/repository_list_view.dart';
import 'package:inilabs_assignment/shared/components/loading_indicator.dart';

class HomePage extends StatelessWidget {
  final String userName;

  HomePage({super.key, required this.userName});

  final HomePresenter homePresenter = locate<HomePresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: homePresenter,
      onInit: () {
        homePresenter.initialize(userName);
      },
      dispose: () => dislocate<HomePresenter>(),
      builder: () {
        final uiState = homePresenter.currentUiState;

        return Scaffold(
          appBar: AppBar(
            title: Text('$userName\'s Repositories'),
            actions: [
              // View mode toggle
              IconButton(
                icon: Icon(
                  uiState.viewMode == ViewMode.list
                      ? Icons.grid_view
                      : Icons.list,
                ),
                onPressed: () => homePresenter.toggleViewMode(),
                tooltip: uiState.viewMode == ViewMode.list
                    ? 'Switch to Grid View'
                    : 'Switch to List View',
              ),
              gapW8,
            ],
          ),
          body: Column(
            children: [
              // Filter section
              FilterSection(uiState: uiState, homePresenter: homePresenter),

              // Repository list/grid
              Expanded(
                child: uiState.isLoading
                    ? const Center(child: LoadingIndicator())
                    : uiState.filteredRepositories.isEmpty
                    ? const EmptyStateWidget()
                    : uiState.viewMode == ViewMode.list
                    ? RepositoryListView(uiState: uiState)
                    : RepositoryGridView(uiState: uiState),
              ),
            ],
          ),
        );
      },
    );
  }
}
