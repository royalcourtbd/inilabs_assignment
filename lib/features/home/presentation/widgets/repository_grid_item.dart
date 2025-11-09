import 'package:flutter/material.dart';
import 'package:inilabs_assignment/core/static/ui_const.dart';
import 'package:inilabs_assignment/core/utility/color_utility.dart';
import 'package:inilabs_assignment/core/utility/extensions.dart';
import 'package:inilabs_assignment/features/home/domain/entities/repository_entity.dart';
import 'package:inilabs_assignment/features/repository_details/presentation/ui/repository_details_page.dart';

class RepositoryGridItem extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryGridItem({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: padding8,
      elevation: 2,
      child: InkWell(
        onTap: () => context.navigatorPush(
          RepositoryDetailsPage(repository: repository),
        ),
        borderRadius: radius8,
        child: Padding(
          padding: padding12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Repository name
              Text(
                repository.name,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              gapH8,

              // Description
              Expanded(
                child: Text(
                  repository.description ?? 'No description',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              gapH8,

              // Language
              if (repository.language != null)
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: getLanguageColor(repository.language!),
                    ),
                    gapW4,
                    Expanded(
                      child: Text(
                        repository.language!,
                        style: theme.textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              gapH8,

              // Stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stars
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.amber),
                      gapW4,
                      Text(
                        repository.stargazersCount.toString(),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),

                  // Forks
                  Row(
                    children: [
                      Icon(Icons.fork_right, size: 14, color: Colors.grey[600]),
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
      ),
    );
  }
}
