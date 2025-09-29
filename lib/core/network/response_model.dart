import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

// 示例 JSON:
// {'data': {'PrefabVer': '10031400', 'desc': '其他', 'hash': 'a0d56e7da979e039376d9f2ac8c26c61', 'time': '2025-09-18 15:45:40', 'truthVersion': '10065400'}, 'message': 'success', 'status': 0}

@JsonSerializable()
class LatestDbVersionDataInfo {
  @JsonKey(name: 'PrefabVer')
  final String? prefabVer;
  final String desc;
  final String hash;
  final String time;
  final String truthVersion;

  LatestDbVersionDataInfo({
    required this.prefabVer,
    required this.desc,
    required this.hash,
    required this.time,
    required this.truthVersion,
  });

  // 使用生成的方法
  factory LatestDbVersionDataInfo.fromJson(Map<String, dynamic> json) =>
      _$LatestDbVersionDataInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LatestDbVersionDataInfoToJson(this);

  // 便捷的 getter：获取格式化的时间
  DateTime? get dateTime {
    try {
      return DateTime.parse(time.replaceAll(' ', 'T'));
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return 'LatestDbVersionDataInfo(prefabVer: $prefabVer, desc: $desc, hash: $hash, time: $time, truthVersion: $truthVersion)';
  }
}

@JsonSerializable()
class LatestDbVersionResponse {
  final LatestDbVersionDataInfo data;
  final String message;
  final int status;

  LatestDbVersionResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  // 使用生成的方法
  factory LatestDbVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestDbVersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LatestDbVersionResponseToJson(this);

  // 便捷方法：检查响应是否成功
  bool get isSuccess => status == 0;

  // 便捷方法：获取错误信息
  String get errorMessage => isSuccess ? '' : message;

  @override
  String toString() {
    return 'LatestDbVersionResponse(data: $data, message: $message, status: $status)';
  }
}
