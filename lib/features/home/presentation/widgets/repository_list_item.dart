import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/core/utility/color_utility.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';

class RepositoryListItem extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryListItem({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: padding12,
      elevation: 2,
      child: Padding(
        padding: padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repository.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH8,

            // Description
            if (repository.description != null &&
                repository.description!.isNotEmpty)
              Text(
                repository.description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            gapH12,

            // Stats row
            Row(
              children: [
                // Language
                if (repository.language != null)
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: getLanguageColor(repository.language!),
                      ),
                      gapW4,
                      Text(
                        repository.language!,
                        style: theme.textTheme.bodySmall,
                      ),
                      gapW16,
                    ],
                  ),

                // Stars
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    gapW4,
                    Text(
                      repository.stargazersCount.toString(),
                      style: theme.textTheme.bodySmall,
                    ),
                    gapW16,
                  ],
                ),

                // Forks
                Row(
                  children: [
                    Icon(Icons.fork_right, size: 16, color: Colors.grey[600]),
                    gapW4,
                    Text(
                      repository.forksCount.toString(),
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
