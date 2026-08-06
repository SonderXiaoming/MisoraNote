import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';

void main() {
  group('Priconne Database API', () {
    test('builds regional metadata and download URLs', () {
      expect(
        FetchUrl.dbInfo(Area.jp),
        'https://pcr.cialloworld.com/api/databases?region=jp',
      );
      expect(
        FetchUrl.db(Area.cn),
        'https://pcr.cialloworld.com/api/databases?region=cn&download=1',
      );
    });

    test('reads the selected regional version as a string', () {
      final response = <String, Object>{
        'latest': <String, Object>{
          'cn': <String, Object>{'version': '202607312107'},
          'jp': <String, Object>{'version': '10070110'},
        },
      };

      expect(databaseVersionFromResponse(response, Area.cn), '202607312107');
      expect(databaseVersionFromResponse(response, Area.jp), '10070110');
      expect(databaseVersionFromResponse(response, Area.tw), isNull);
    });

    test('rejects missing and empty versions', () {
      expect(databaseVersionFromResponse(null, Area.jp), isNull);
      expect(
        databaseVersionFromResponse({
          'latest': {
            'jp': {'version': '  '},
          },
        }, Area.jp),
        isNull,
      );
    });
  });
}
