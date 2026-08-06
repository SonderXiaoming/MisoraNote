import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/features/component/update/app_check_update.dart';
import 'package:misora_note/features/component/update/app_version.dart';

void main() {
  test('uses the GitHub latest release endpoint', () {
    expect(
      githubLatestReleaseUrl,
      'https://api.github.com/repos/SonderXiaoming/MisoraNote/releases/latest',
    );
  });

  group('hasAppUpdate', () {
    test('treats GitHub tag prefixes as equivalent', () {
      expect(hasAppUpdate('1.2.0', 'v1.2.0'), isFalse);
      expect(hasAppUpdate('v1.2.0', '1.2.0'), isFalse);
    });

    test('reports a different non-empty release version', () {
      expect(hasAppUpdate('1.1.0', 'v1.2.0'), isTrue);
      expect(hasAppUpdate('1.2.0', 'v1.2.1'), isTrue);
    });

    test('does not report an update for missing version data', () {
      expect(hasAppUpdate(null, 'v1.2.0'), isFalse);
      expect(hasAppUpdate('1.2.0', '  '), isFalse);
    });
  });
}
