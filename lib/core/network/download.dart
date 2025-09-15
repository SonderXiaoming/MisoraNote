import 'package:dio/dio.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';
import './base.dart';

Future<void> updatePcrDatabase(
  Area area, {
  void Function(int rec, int total)? onProgress,
}) async {
  final path = FilePath.db(area);
  final brPath = '$path.br';
  final url = FetchUrl.db(area);
  await apiClient.download(
    url: url,
    path: brPath,
    allowCache: false,
    onProgress: onProgress,
  );
  await decompress(brPath: brPath, outPath: path);
}

Future<String> getPcrFullcard(int id) async {
  String url = FetchUrl.fullcardUrl(id, 6);
  String savePath = FilePath.fullcard(id, 6);
  try {
    await apiClient.download(url: url, path: savePath);
    return savePath;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      url = FetchUrl.fullcardUrl(id, 3);
      savePath = FilePath.fullcard(id, 3);
      try {
        await apiClient.download(url: url, path: savePath);
        return savePath;
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          throw Exception('暂无id为$id的全卡数据');
        } else {
          rethrow;
        }
      }
    } else {
      rethrow;
    }
  }
}

Future<String> getSkillIcon(int skillIconId) async {
  String url = FetchUrl.skillIconUrl(skillIconId);
  String savePath = FilePath.skillIcon(skillIconId);
  try {
    await apiClient.download(url: url, path: savePath);
    return savePath;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      throw Exception('暂无id为$skillIconId的技能图标');
    } else {
      rethrow;
    }
  }
}

Future<String> getEquipmentIcon(int equipmentIconId) async {
  String url = FetchUrl.equipmentIconUrl(equipmentIconId);
  String savePath = FilePath.equipment(equipmentIconId);
  try {
    await apiClient.download(url: url, path: savePath);
    return savePath;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      throw Exception('暂无id为$equipmentIconId的装备图标');
    } else {
      rethrow;
    }
  }
}

Future<String> getEnemyIcon(int enemyIconId) async {
  String url = FetchUrl.enemyIconUrl(enemyIconId);
  String savePath = FilePath.enemyIcon(enemyIconId);
  try {
    await apiClient.download(url: url, path: savePath);
    return savePath;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      throw Exception('暂无id为$enemyIconId的敌人图标');
    } else {
      rethrow;
    }
  }
}

Future<String> getTeaserIcon(int teaserId, Area area) async {
  String url = FetchUrl.teaser(area, teaserId);
  String savePath = FilePath.teaser(teaserId);
  try {
    await apiClient.download(url: url, path: savePath);
    return savePath;
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      throw Exception('暂无id为$teaserId的预告图标');
    } else {
      rethrow;
    }
  }
}
