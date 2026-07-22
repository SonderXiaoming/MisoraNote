import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/features/component/update/database_update.dart';

void main() {
  group('hasDatabaseUpdate', () {
    test('does not report an update for identical versions', () {
      expect(
        hasDatabaseUpdate(
          '2026-07-16 20:08:06.352929',
          '2026-07-16 20:08:06.352929',
        ),
        isFalse,
      );
    });

    test('normalizes surrounding whitespace', () {
      expect(hasDatabaseUpdate(' version-1 ', 'version-1'), isFalse);
    });

    test('reports only a non-empty different server version', () {
      expect(hasDatabaseUpdate('version-1', 'version-2'), isTrue);
      expect(hasDatabaseUpdate('version-1', null), isFalse);
      expect(hasDatabaseUpdate('version-1', '  '), isFalse);
    });
  });
}
