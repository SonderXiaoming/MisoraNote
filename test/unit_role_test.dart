import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/features/component/base.dart';

void main() {
  test('maps database role ids 1 through 8', () {
    expect(
      List.generate(8, (index) => UnitRoleType.fromValue(index + 1)?.value),
      [1, 2, 3, 4, 5, 6, 7, 8],
    );
    expect(UnitRoleType.fromValue(0), isNull);
    expect(UnitRoleType.fromValue(9), isNull);
  });
}
