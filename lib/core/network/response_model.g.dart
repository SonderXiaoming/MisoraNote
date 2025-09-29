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
