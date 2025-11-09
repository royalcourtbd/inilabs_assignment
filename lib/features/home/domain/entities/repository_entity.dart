import 'package:inilabs_assignment/core/base/base_export.dart';

class RepositoryEntity extends BaseEntity {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String createdAt;
  final String updatedAt;
  final String pushedAt;
  final String? gitUrl;
  final String? sshUrl;
  final String? cloneUrl;
  final String? svnUrl;
  final String? homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final bool hasIssues;
  final bool hasProjects;
  final bool hasDownloads;
  final bool hasWiki;
  final bool hasPages;
  final bool hasDiscussions;
  final int forksCount;
  final String? mirrorUrl;
  final bool archived;
  final bool disabled;
  final int openIssuesCount;
  final String? license;
  final bool allowForking;
  final bool isTemplate;
  final List<String> topics;
  final String visibility;
  final int forks;
  final int openIssues;
  final int watchers;
  final String? defaultBranch;

  const RepositoryEntity({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.htmlUrl,
    this.description,
    required this.fork,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.hasDiscussions,
    required this.forksCount,
    this.mirrorUrl,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    this.defaultBranch,
  });

  @override
  List<Object?> get props => [
    id,
    nodeId,
    name,
    fullName,
    private,
    htmlUrl,
    description,
    fork,
    url,
    createdAt,
    updatedAt,
    pushedAt,
    gitUrl,
    sshUrl,
    cloneUrl,
    svnUrl,
    homepage,
    size,
    stargazersCount,
    watchersCount,
    language,
    hasIssues,
    hasProjects,
    hasDownloads,
    hasWiki,
    hasPages,
    hasDiscussions,
    forksCount,
    mirrorUrl,
    archived,
    disabled,
    openIssuesCount,
    license,
    allowForking,
    isTemplate,
    topics,
    visibility,
    forks,
    openIssues,
    watchers,
    defaultBranch,
  ];
}
