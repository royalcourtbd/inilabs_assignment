import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/di/service_locator.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/core/utility/color_utility.dart';
import 'package:inilabs_assignment/core/widgets/presentable_widget_builder.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';
import 'package:inilabs_assignment/features/repository_details/presentation/presenter/repository_details_presenter.dart';
import 'package:inilabs_assignment/shared/components/loading_indicator.dart';
import 'package:intl/intl.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final RepositoryEntity repository;

  RepositoryDetailsPage({super.key, required this.repository});

  final RepositoryDetailsPresenter presenter =
      locate<RepositoryDetailsPresenter>();

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: presenter,
      onInit: () {
        presenter.initialize(repository);
      },
      dispose: () => dislocate<RepositoryDetailsPresenter>(),
      builder: () {
        final uiState = presenter.currentUiState;

        if (uiState.repository == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Repository Details')),
            body: const Center(child: LoadingIndicator()),
          );
        }

        final repo = uiState.repository!;

        return Scaffold(
          appBar: AppBar(title: Text(repo.name)),
          body: SingleChildScrollView(
            padding: padding16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Repository Header
                _buildHeader(context, repo),
                gapH20,

                // Description Section
                if (repo.description != null && repo.description!.isNotEmpty)
                  _buildDescriptionSection(context, repo),

                gapH20,

                // Stats Cards
                _buildStatsCards(context, repo),

                gapH20,

                // Language and Topics
                _buildLanguageAndTopics(context, repo),

                gapH20,

                // Dates Information
                _buildDatesSection(context, repo),

                gapH20,

                // Additional Info
                _buildAdditionalInfo(context, repo),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, RepositoryEntity repo) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name
            Text(
              repo.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            gapH12,

            // Owner Info (if available from fullName)
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Text(
                    repo.fullName.split('/').first[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                gapW12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repo.fullName.split('/').first,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Repository Owner',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context, RepositoryEntity repo) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.description, size: 20),
                gapW8,
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            gapH12,
            Text(
              repo.description!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCards(BuildContext context, RepositoryEntity repo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Repository Statistics',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        gapH12,
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.star,
                iconColor: Colors.amber,
                label: 'Stars',
                value: _formatNumber(repo.stargazersCount),
              ),
            ),
            gapW12,
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.fork_right,
                iconColor: Colors.blue,
                label: 'Forks',
                value: _formatNumber(repo.forksCount),
              ),
            ),
          ],
        ),
        gapH12,
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.error_outline,
                iconColor: Colors.red,
                label: 'Open Issues',
                value: _formatNumber(repo.openIssuesCount),
              ),
            ),
            gapW12,
            Expanded(
              child: _buildStatCard(
                context,
                icon: Icons.remove_red_eye,
                iconColor: Colors.green,
                label: 'Watchers',
                value: _formatNumber(repo.watchersCount),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          children: [
            Icon(icon, size: 32, color: iconColor),
            gapH8,
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            gapH4,
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageAndTopics(BuildContext context, RepositoryEntity repo) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Language
            if (repo.language != null) ...[
              Row(
                children: [
                  const Icon(Icons.code, size: 20),
                  gapW8,
                  Text(
                    'Primary Language',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              gapH12,
              Container(
                padding: paddingH14.copyWith(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: getLanguageColor(
                    repo.language!,
                  ).withValues(alpha: 0.1),
                  borderRadius: radius8,
                  border: Border.all(
                    color: getLanguageColor(
                      repo.language!,
                    ).withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 16,
                      color: getLanguageColor(repo.language!),
                    ),
                    gapW8,
                    Text(
                      repo.language!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Topics
            if (repo.topics.isNotEmpty) ...[
              gapH20,
              Row(
                children: [
                  const Icon(Icons.label, size: 20),
                  gapW8,
                  Text(
                    'Topics',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              gapH12,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: repo.topics.map((topic) {
                  return Chip(
                    label: Text(topic),
                    backgroundColor: Colors.blue[50],
                    side: BorderSide(color: Colors.blue[200]!),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDatesSection(BuildContext context, RepositoryEntity repo) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20),
                gapW8,
                Text(
                  'Timeline',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            gapH16,
            _buildDateRow(
              context,
              icon: Icons.add_circle_outline,
              label: 'Created',
              date: repo.createdAt,
            ),
            gapH12,
            _buildDateRow(
              context,
              icon: Icons.update,
              label: 'Last Updated',
              date: repo.updatedAt,
            ),
            gapH12,
            _buildDateRow(
              context,
              icon: Icons.push_pin,
              label: 'Last Pushed',
              date: repo.pushedAt,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String date,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        gapW12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
              Text(
                _formatDate(date),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalInfo(BuildContext context, RepositoryEntity repo) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline, size: 20),
                gapW8,
                Text(
                  'Additional Information',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            gapH16,
            _buildInfoRow(context, 'Visibility', repo.visibility.toUpperCase()),
            gapH8,
            _buildInfoRow(context, 'Size', '${_formatNumber(repo.size)} KB'),
            gapH8,
            _buildInfoRow(
              context,
              'Default Branch',
              repo.defaultBranch ?? 'N/A',
            ),
            gapH8,
            _buildInfoRow(context, 'License', repo.license ?? 'No License'),
            gapH16,
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                if (repo.fork) _buildBadge(context, 'Fork', Colors.orange),
                if (repo.archived) _buildBadge(context, 'Archived', Colors.red),
                if (repo.isTemplate)
                  _buildBadge(context, 'Template', Colors.purple),
                if (repo.private) _buildBadge(context, 'Private', Colors.red),
                if (repo.hasWiki) _buildBadge(context, 'Wiki', Colors.blue),
                if (repo.hasPages) _buildBadge(context, 'Pages', Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildBadge(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: radius6,
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
