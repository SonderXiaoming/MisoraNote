String normalizeAppVersion(String? version) {
  final normalized = version?.trim() ?? '';
  if (normalized.startsWith('v') || normalized.startsWith('V')) {
    return normalized.substring(1);
  }
  return normalized;
}

bool hasAppUpdate(String? currentVersion, String? latestVersion) {
  final current = normalizeAppVersion(currentVersion);
  final latest = normalizeAppVersion(latestVersion);
  return current.isNotEmpty && latest.isNotEmpty && current != latest;
}
