import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanna_note/constants.dart';
import 'package:kanna_note/core/db/database.dart';

final dbProvider = StateProvider<AppDb>((ref) {
  return AppDb(FilePath.db(Area.cn));
});
