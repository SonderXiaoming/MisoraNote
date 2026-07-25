import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/constants.dart';

void main() {
  test('asset paths use Flutter separators on every platform', () {
    expect(FilePath.img, 'resources/img');
    expect(FilePath.uniqueNumIcon(3), 'resources/img/unique_3.png');
  });

  testWidgets('talent images are bundled with normalized asset keys', (
    tester,
  ) async {
    for (final talent in ['fire', 'water', 'wind', 'light', 'dark']) {
      final data = await rootBundle.load('${FilePath.img}/talent/$talent.png');
      expect(data.lengthInBytes, greaterThan(0));
    }
  });
}
