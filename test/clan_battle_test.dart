import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/model.dart';

void main() {
  group('full compensation line calculation', () {
    test('uses kanna_note max return formula and six million cutoff', () {
      final lines = calculateFullCompensationLines(12000000);

      expect(lines, hasLength(1));
      expect(lines.single.count, 1);
      expect(lines.single.damage, closeTo(12000000 / (1 + 21 / 90), 0.01));
    });

    test('caps high HP bosses at eight full compensation lines', () {
      final lines = calculateFullCompensationLines(1160000000);

      expect(lines, hasLength(8));
      expect(lines.last.count, 8);
      expect(lines.last.damage, closeTo(1160000000 / (8 + 21 / 90), 0.01));
    });

    test('omits thresholds at or below six million', () {
      expect(calculateFullCompensationLines(7000000), isEmpty);
    });
  });
}
