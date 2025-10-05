// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestDbVersionDataInfo _$LatestDbVersionDataInfoFromJson(
  Map<String, dynamic> json,
) => LatestDbVersionDataInfo(
  prefabVer: json['PrefabVer'] as String?,
  desc: json['desc'] as String,
  hash: json['hash'] as String,
  time: json['time'] as String,
  truthVersion: json['truthVersion'] as String,
);

Map<String, dynamic> _$LatestDbVersionDataInfoToJson(
  LatestDbVersionDataInfo instance,
) => <String, dynamic>{
  'PrefabVer': instance.prefabVer,
  'desc': instance.desc,
  'hash': instance.hash,
  'time': instance.time,
  'truthVersion': instance.truthVersion,
};

LatestDbVersionResponse _$LatestDbVersionResponseFromJson(
  Map<String, dynamic> json,
) => LatestDbVersionResponse(
  data: LatestDbVersionDataInfo.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$LatestDbVersionResponseToJson(
  LatestDbVersionResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'status': instance.status,
};

AppAsset _$AppAssetFromJson(Map<String, dynamic> json) => AppAsset(
  name: json['name'] as String,
  browser_download_url: json['browser_download_url'] as String,
);

Map<String, dynamic> _$AppAssetToJson(AppAsset instance) => <String, dynamic>{
  'name': instance.name,
  'browser_download_url': instance.browser_download_url,
};

LatestAppVersionResponse _$LatestAppVersionResponseFromJson(
  Map<String, dynamic> json,
) => LatestAppVersionResponse(
  tag_name: json['tag_name'] as String,
  name: json['name'] as String,
  body: json['body'] as String,
  prerelease: json['prerelease'] as bool,
  assets: (json['assets'] as List<dynamic>)
      .map((e) => AppAsset.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LatestAppVersionResponseToJson(
  LatestAppVersionResponse instance,
) => <String, dynamic>{
  'tag_name': instance.tag_name,
  'name': instance.name,
  'body': instance.body,
  'prerelease': instance.prerelease,
  'assets': instance.assets,
};
