import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class LatestDbVersionDataInfo {
  @JsonKey(name: 'PrefabVer')
  final String? prefabVer;
  final String? desc;
  final String hash;
  final String? time;
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

@JsonSerializable()
class AppAsset {
  final String name;
  final String browser_download_url;

  AppAsset({required this.name, required this.browser_download_url});
  factory AppAsset.fromJson(Map<String, dynamic> json) =>
      _$AppAssetFromJson(json);
  Map<String, dynamic> toJson() => _$AppAssetToJson(this);
  @override
  String toString() {
    return '_Asset(name: $name, browser_download_url: $browser_download_url)';
  }
}

@JsonSerializable()
class LatestAppVersionResponse {
  final String tag_name;
  final String name;
  final String body;
  final bool prerelease;
  final List<AppAsset> assets;
  LatestAppVersionResponse({
    required this.tag_name,
    required this.name,
    required this.body,
    required this.prerelease,
    required this.assets,
  });
  factory LatestAppVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestAppVersionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LatestAppVersionResponseToJson(this);
  @override
  String toString() {
    return 'LatestAppVersionResponse(tag_name: $tag_name, name: $name, body: $body, prerelease: $prerelease, assets: $assets)';
  }
}
