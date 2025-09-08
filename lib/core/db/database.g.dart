// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UnitProfileTable extends UnitProfile
    with TableInfo<$UnitProfileTable, UnitProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
    'age',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedColumn<String> guild = GeneratedColumn<String>(
    'guild',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<String> race = GeneratedColumn<String>(
    'race',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<String> height = GeneratedColumn<String>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<String> weight = GeneratedColumn<String>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthMonthMeta = const VerificationMeta(
    'birthMonth',
  );
  @override
  late final GeneratedColumn<String> birthMonth = GeneratedColumn<String>(
    'birth_month',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthDayMeta = const VerificationMeta(
    'birthDay',
  );
  @override
  late final GeneratedColumn<String> birthDay = GeneratedColumn<String>(
    'birth_day',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodTypeMeta = const VerificationMeta(
    'bloodType',
  );
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
    'blood_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favoriteMeta = const VerificationMeta(
    'favorite',
  );
  @override
  late final GeneratedColumn<String> favorite = GeneratedColumn<String>(
    'favorite',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voiceMeta = const VerificationMeta('voice');
  @override
  late final GeneratedColumn<String> voice = GeneratedColumn<String>(
    'voice',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _voiceIdMeta = const VerificationMeta(
    'voiceId',
  );
  @override
  late final GeneratedColumn<int> voiceId = GeneratedColumn<int>(
    'voice_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _catchCopyMeta = const VerificationMeta(
    'catchCopy',
  );
  @override
  late final GeneratedColumn<String> catchCopy = GeneratedColumn<String>(
    'catch_copy',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selfTextMeta = const VerificationMeta(
    'selfText',
  );
  @override
  late final GeneratedColumn<String> selfText = GeneratedColumn<String>(
    'self_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guildIdMeta = const VerificationMeta(
    'guildId',
  );
  @override
  late final GeneratedColumn<String> guildId = GeneratedColumn<String>(
    'guild_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    unitId,
    unitName,
    age,
    guild,
    race,
    height,
    weight,
    birthMonth,
    birthDay,
    bloodType,
    favorite,
    voice,
    voiceId,
    catchCopy,
    selfText,
    guildId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    }
    if (data.containsKey('guild')) {
      context.handle(
        _guildMeta,
        guild.isAcceptableOrUnknown(data['guild']!, _guildMeta),
      );
    }
    if (data.containsKey('race')) {
      context.handle(
        _raceMeta,
        race.isAcceptableOrUnknown(data['race']!, _raceMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('birth_month')) {
      context.handle(
        _birthMonthMeta,
        birthMonth.isAcceptableOrUnknown(data['birth_month']!, _birthMonthMeta),
      );
    }
    if (data.containsKey('birth_day')) {
      context.handle(
        _birthDayMeta,
        birthDay.isAcceptableOrUnknown(data['birth_day']!, _birthDayMeta),
      );
    }
    if (data.containsKey('blood_type')) {
      context.handle(
        _bloodTypeMeta,
        bloodType.isAcceptableOrUnknown(data['blood_type']!, _bloodTypeMeta),
      );
    }
    if (data.containsKey('favorite')) {
      context.handle(
        _favoriteMeta,
        favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta),
      );
    }
    if (data.containsKey('voice')) {
      context.handle(
        _voiceMeta,
        voice.isAcceptableOrUnknown(data['voice']!, _voiceMeta),
      );
    }
    if (data.containsKey('voice_id')) {
      context.handle(
        _voiceIdMeta,
        voiceId.isAcceptableOrUnknown(data['voice_id']!, _voiceIdMeta),
      );
    }
    if (data.containsKey('catch_copy')) {
      context.handle(
        _catchCopyMeta,
        catchCopy.isAcceptableOrUnknown(data['catch_copy']!, _catchCopyMeta),
      );
    }
    if (data.containsKey('self_text')) {
      context.handle(
        _selfTextMeta,
        selfText.isAcceptableOrUnknown(data['self_text']!, _selfTextMeta),
      );
    }
    if (data.containsKey('guild_id')) {
      context.handle(
        _guildIdMeta,
        guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  UnitProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitProfileData(
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      unitName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}unit_name'],
          )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age'],
      ),
      guild: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guild'],
      ),
      race: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weight'],
      ),
      birthMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_month'],
      ),
      birthDay: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birth_day'],
      ),
      bloodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_type'],
      ),
      favorite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}favorite'],
      ),
      voice: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voice'],
      ),
      voiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}voice_id'],
      ),
      catchCopy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catch_copy'],
      ),
      selfText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}self_text'],
      ),
      guildId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guild_id'],
      ),
    );
  }

  @override
  $UnitProfileTable createAlias(String alias) {
    return $UnitProfileTable(attachedDatabase, alias);
  }
}

class UnitProfileData extends DataClass implements Insertable<UnitProfileData> {
  final int unitId;
  final String unitName;
  final String? age;
  final String? guild;
  final String? race;
  final String? height;
  final String? weight;
  final String? birthMonth;
  final String? birthDay;
  final String? bloodType;
  final String? favorite;
  final String? voice;
  final int? voiceId;
  final String? catchCopy;
  final String? selfText;
  final String? guildId;
  const UnitProfileData({
    required this.unitId,
    required this.unitName,
    this.age,
    this.guild,
    this.race,
    this.height,
    this.weight,
    this.birthMonth,
    this.birthDay,
    this.bloodType,
    this.favorite,
    this.voice,
    this.voiceId,
    this.catchCopy,
    this.selfText,
    this.guildId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['unit_name'] = Variable<String>(unitName);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<String>(age);
    }
    if (!nullToAbsent || guild != null) {
      map['guild'] = Variable<String>(guild);
    }
    if (!nullToAbsent || race != null) {
      map['race'] = Variable<String>(race);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<String>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<String>(weight);
    }
    if (!nullToAbsent || birthMonth != null) {
      map['birth_month'] = Variable<String>(birthMonth);
    }
    if (!nullToAbsent || birthDay != null) {
      map['birth_day'] = Variable<String>(birthDay);
    }
    if (!nullToAbsent || bloodType != null) {
      map['blood_type'] = Variable<String>(bloodType);
    }
    if (!nullToAbsent || favorite != null) {
      map['favorite'] = Variable<String>(favorite);
    }
    if (!nullToAbsent || voice != null) {
      map['voice'] = Variable<String>(voice);
    }
    if (!nullToAbsent || voiceId != null) {
      map['voice_id'] = Variable<int>(voiceId);
    }
    if (!nullToAbsent || catchCopy != null) {
      map['catch_copy'] = Variable<String>(catchCopy);
    }
    if (!nullToAbsent || selfText != null) {
      map['self_text'] = Variable<String>(selfText);
    }
    if (!nullToAbsent || guildId != null) {
      map['guild_id'] = Variable<String>(guildId);
    }
    return map;
  }

  UnitProfileCompanion toCompanion(bool nullToAbsent) {
    return UnitProfileCompanion(
      unitId: Value(unitId),
      unitName: Value(unitName),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      guild:
          guild == null && nullToAbsent ? const Value.absent() : Value(guild),
      race: race == null && nullToAbsent ? const Value.absent() : Value(race),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      birthMonth:
          birthMonth == null && nullToAbsent
              ? const Value.absent()
              : Value(birthMonth),
      birthDay:
          birthDay == null && nullToAbsent
              ? const Value.absent()
              : Value(birthDay),
      bloodType:
          bloodType == null && nullToAbsent
              ? const Value.absent()
              : Value(bloodType),
      favorite:
          favorite == null && nullToAbsent
              ? const Value.absent()
              : Value(favorite),
      voice:
          voice == null && nullToAbsent ? const Value.absent() : Value(voice),
      voiceId:
          voiceId == null && nullToAbsent
              ? const Value.absent()
              : Value(voiceId),
      catchCopy:
          catchCopy == null && nullToAbsent
              ? const Value.absent()
              : Value(catchCopy),
      selfText:
          selfText == null && nullToAbsent
              ? const Value.absent()
              : Value(selfText),
      guildId:
          guildId == null && nullToAbsent
              ? const Value.absent()
              : Value(guildId),
    );
  }

  factory UnitProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitProfileData(
      unitId: serializer.fromJson<int>(json['unitId']),
      unitName: serializer.fromJson<String>(json['unitName']),
      age: serializer.fromJson<String?>(json['age']),
      guild: serializer.fromJson<String?>(json['guild']),
      race: serializer.fromJson<String?>(json['race']),
      height: serializer.fromJson<String?>(json['height']),
      weight: serializer.fromJson<String?>(json['weight']),
      birthMonth: serializer.fromJson<String?>(json['birthMonth']),
      birthDay: serializer.fromJson<String?>(json['birthDay']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
      favorite: serializer.fromJson<String?>(json['favorite']),
      voice: serializer.fromJson<String?>(json['voice']),
      voiceId: serializer.fromJson<int?>(json['voiceId']),
      catchCopy: serializer.fromJson<String?>(json['catchCopy']),
      selfText: serializer.fromJson<String?>(json['selfText']),
      guildId: serializer.fromJson<String?>(json['guildId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'unitName': serializer.toJson<String>(unitName),
      'age': serializer.toJson<String?>(age),
      'guild': serializer.toJson<String?>(guild),
      'race': serializer.toJson<String?>(race),
      'height': serializer.toJson<String?>(height),
      'weight': serializer.toJson<String?>(weight),
      'birthMonth': serializer.toJson<String?>(birthMonth),
      'birthDay': serializer.toJson<String?>(birthDay),
      'bloodType': serializer.toJson<String?>(bloodType),
      'favorite': serializer.toJson<String?>(favorite),
      'voice': serializer.toJson<String?>(voice),
      'voiceId': serializer.toJson<int?>(voiceId),
      'catchCopy': serializer.toJson<String?>(catchCopy),
      'selfText': serializer.toJson<String?>(selfText),
      'guildId': serializer.toJson<String?>(guildId),
    };
  }

  UnitProfileData copyWith({
    int? unitId,
    String? unitName,
    Value<String?> age = const Value.absent(),
    Value<String?> guild = const Value.absent(),
    Value<String?> race = const Value.absent(),
    Value<String?> height = const Value.absent(),
    Value<String?> weight = const Value.absent(),
    Value<String?> birthMonth = const Value.absent(),
    Value<String?> birthDay = const Value.absent(),
    Value<String?> bloodType = const Value.absent(),
    Value<String?> favorite = const Value.absent(),
    Value<String?> voice = const Value.absent(),
    Value<int?> voiceId = const Value.absent(),
    Value<String?> catchCopy = const Value.absent(),
    Value<String?> selfText = const Value.absent(),
    Value<String?> guildId = const Value.absent(),
  }) => UnitProfileData(
    unitId: unitId ?? this.unitId,
    unitName: unitName ?? this.unitName,
    age: age.present ? age.value : this.age,
    guild: guild.present ? guild.value : this.guild,
    race: race.present ? race.value : this.race,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    birthMonth: birthMonth.present ? birthMonth.value : this.birthMonth,
    birthDay: birthDay.present ? birthDay.value : this.birthDay,
    bloodType: bloodType.present ? bloodType.value : this.bloodType,
    favorite: favorite.present ? favorite.value : this.favorite,
    voice: voice.present ? voice.value : this.voice,
    voiceId: voiceId.present ? voiceId.value : this.voiceId,
    catchCopy: catchCopy.present ? catchCopy.value : this.catchCopy,
    selfText: selfText.present ? selfText.value : this.selfText,
    guildId: guildId.present ? guildId.value : this.guildId,
  );
  UnitProfileData copyWithCompanion(UnitProfileCompanion data) {
    return UnitProfileData(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      age: data.age.present ? data.age.value : this.age,
      guild: data.guild.present ? data.guild.value : this.guild,
      race: data.race.present ? data.race.value : this.race,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      birthMonth:
          data.birthMonth.present ? data.birthMonth.value : this.birthMonth,
      birthDay: data.birthDay.present ? data.birthDay.value : this.birthDay,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      voice: data.voice.present ? data.voice.value : this.voice,
      voiceId: data.voiceId.present ? data.voiceId.value : this.voiceId,
      catchCopy: data.catchCopy.present ? data.catchCopy.value : this.catchCopy,
      selfText: data.selfText.present ? data.selfText.value : this.selfText,
      guildId: data.guildId.present ? data.guildId.value : this.guildId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitProfileData(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('age: $age, ')
          ..write('guild: $guild, ')
          ..write('race: $race, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('birthMonth: $birthMonth, ')
          ..write('birthDay: $birthDay, ')
          ..write('bloodType: $bloodType, ')
          ..write('favorite: $favorite, ')
          ..write('voice: $voice, ')
          ..write('voiceId: $voiceId, ')
          ..write('catchCopy: $catchCopy, ')
          ..write('selfText: $selfText, ')
          ..write('guildId: $guildId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    unitId,
    unitName,
    age,
    guild,
    race,
    height,
    weight,
    birthMonth,
    birthDay,
    bloodType,
    favorite,
    voice,
    voiceId,
    catchCopy,
    selfText,
    guildId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitProfileData &&
          other.unitId == this.unitId &&
          other.unitName == this.unitName &&
          other.age == this.age &&
          other.guild == this.guild &&
          other.race == this.race &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.birthMonth == this.birthMonth &&
          other.birthDay == this.birthDay &&
          other.bloodType == this.bloodType &&
          other.favorite == this.favorite &&
          other.voice == this.voice &&
          other.voiceId == this.voiceId &&
          other.catchCopy == this.catchCopy &&
          other.selfText == this.selfText &&
          other.guildId == this.guildId);
}

class UnitProfileCompanion extends UpdateCompanion<UnitProfileData> {
  final Value<int> unitId;
  final Value<String> unitName;
  final Value<String?> age;
  final Value<String?> guild;
  final Value<String?> race;
  final Value<String?> height;
  final Value<String?> weight;
  final Value<String?> birthMonth;
  final Value<String?> birthDay;
  final Value<String?> bloodType;
  final Value<String?> favorite;
  final Value<String?> voice;
  final Value<int?> voiceId;
  final Value<String?> catchCopy;
  final Value<String?> selfText;
  final Value<String?> guildId;
  const UnitProfileCompanion({
    this.unitId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.age = const Value.absent(),
    this.guild = const Value.absent(),
    this.race = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.birthMonth = const Value.absent(),
    this.birthDay = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.favorite = const Value.absent(),
    this.voice = const Value.absent(),
    this.voiceId = const Value.absent(),
    this.catchCopy = const Value.absent(),
    this.selfText = const Value.absent(),
    this.guildId = const Value.absent(),
  });
  UnitProfileCompanion.insert({
    this.unitId = const Value.absent(),
    required String unitName,
    this.age = const Value.absent(),
    this.guild = const Value.absent(),
    this.race = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.birthMonth = const Value.absent(),
    this.birthDay = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.favorite = const Value.absent(),
    this.voice = const Value.absent(),
    this.voiceId = const Value.absent(),
    this.catchCopy = const Value.absent(),
    this.selfText = const Value.absent(),
    this.guildId = const Value.absent(),
  }) : unitName = Value(unitName);
  static Insertable<UnitProfileData> custom({
    Expression<int>? unitId,
    Expression<String>? unitName,
    Expression<String>? age,
    Expression<String>? guild,
    Expression<String>? race,
    Expression<String>? height,
    Expression<String>? weight,
    Expression<String>? birthMonth,
    Expression<String>? birthDay,
    Expression<String>? bloodType,
    Expression<String>? favorite,
    Expression<String>? voice,
    Expression<int>? voiceId,
    Expression<String>? catchCopy,
    Expression<String>? selfText,
    Expression<String>? guildId,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (unitName != null) 'unit_name': unitName,
      if (age != null) 'age': age,
      if (guild != null) 'guild': guild,
      if (race != null) 'race': race,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (birthMonth != null) 'birth_month': birthMonth,
      if (birthDay != null) 'birth_day': birthDay,
      if (bloodType != null) 'blood_type': bloodType,
      if (favorite != null) 'favorite': favorite,
      if (voice != null) 'voice': voice,
      if (voiceId != null) 'voice_id': voiceId,
      if (catchCopy != null) 'catch_copy': catchCopy,
      if (selfText != null) 'self_text': selfText,
      if (guildId != null) 'guild_id': guildId,
    });
  }

  UnitProfileCompanion copyWith({
    Value<int>? unitId,
    Value<String>? unitName,
    Value<String?>? age,
    Value<String?>? guild,
    Value<String?>? race,
    Value<String?>? height,
    Value<String?>? weight,
    Value<String?>? birthMonth,
    Value<String?>? birthDay,
    Value<String?>? bloodType,
    Value<String?>? favorite,
    Value<String?>? voice,
    Value<int?>? voiceId,
    Value<String?>? catchCopy,
    Value<String?>? selfText,
    Value<String?>? guildId,
  }) {
    return UnitProfileCompanion(
      unitId: unitId ?? this.unitId,
      unitName: unitName ?? this.unitName,
      age: age ?? this.age,
      guild: guild ?? this.guild,
      race: race ?? this.race,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      birthMonth: birthMonth ?? this.birthMonth,
      birthDay: birthDay ?? this.birthDay,
      bloodType: bloodType ?? this.bloodType,
      favorite: favorite ?? this.favorite,
      voice: voice ?? this.voice,
      voiceId: voiceId ?? this.voiceId,
      catchCopy: catchCopy ?? this.catchCopy,
      selfText: selfText ?? this.selfText,
      guildId: guildId ?? this.guildId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (guild.present) {
      map['guild'] = Variable<String>(guild.value);
    }
    if (race.present) {
      map['race'] = Variable<String>(race.value);
    }
    if (height.present) {
      map['height'] = Variable<String>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<String>(weight.value);
    }
    if (birthMonth.present) {
      map['birth_month'] = Variable<String>(birthMonth.value);
    }
    if (birthDay.present) {
      map['birth_day'] = Variable<String>(birthDay.value);
    }
    if (bloodType.present) {
      map['blood_type'] = Variable<String>(bloodType.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<String>(favorite.value);
    }
    if (voice.present) {
      map['voice'] = Variable<String>(voice.value);
    }
    if (voiceId.present) {
      map['voice_id'] = Variable<int>(voiceId.value);
    }
    if (catchCopy.present) {
      map['catch_copy'] = Variable<String>(catchCopy.value);
    }
    if (selfText.present) {
      map['self_text'] = Variable<String>(selfText.value);
    }
    if (guildId.present) {
      map['guild_id'] = Variable<String>(guildId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitProfileCompanion(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('age: $age, ')
          ..write('guild: $guild, ')
          ..write('race: $race, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('birthMonth: $birthMonth, ')
          ..write('birthDay: $birthDay, ')
          ..write('bloodType: $bloodType, ')
          ..write('favorite: $favorite, ')
          ..write('voice: $voice, ')
          ..write('voiceId: $voiceId, ')
          ..write('catchCopy: $catchCopy, ')
          ..write('selfText: $selfText, ')
          ..write('guildId: $guildId')
          ..write(')'))
        .toString();
  }
}

class $RedeemUnitTable extends RedeemUnit
    with TableInfo<$RedeemUnitTable, RedeemUnitData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RedeemUnitTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotIdMeta = const VerificationMeta('slotId');
  @override
  late final GeneratedColumn<int> slotId = GeneratedColumn<int>(
    'slot_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionCategoryMeta = const VerificationMeta(
    'conditionCategory',
  );
  @override
  late final GeneratedColumn<int> conditionCategory = GeneratedColumn<int>(
    'condition_category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionIdMeta = const VerificationMeta(
    'conditionId',
  );
  @override
  late final GeneratedColumn<int> conditionId = GeneratedColumn<int>(
    'condition_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consumeNumMeta = const VerificationMeta(
    'consumeNum',
  );
  @override
  late final GeneratedColumn<String> consumeNum = GeneratedColumn<String>(
    'consume_num',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    unitId,
    slotId,
    conditionCategory,
    conditionId,
    consumeNum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'redeem_unit';
  @override
  VerificationContext validateIntegrity(
    Insertable<RedeemUnitData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('slot_id')) {
      context.handle(
        _slotIdMeta,
        slotId.isAcceptableOrUnknown(data['slot_id']!, _slotIdMeta),
      );
    } else if (isInserting) {
      context.missing(_slotIdMeta);
    }
    if (data.containsKey('condition_category')) {
      context.handle(
        _conditionCategoryMeta,
        conditionCategory.isAcceptableOrUnknown(
          data['condition_category']!,
          _conditionCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conditionCategoryMeta);
    }
    if (data.containsKey('condition_id')) {
      context.handle(
        _conditionIdMeta,
        conditionId.isAcceptableOrUnknown(
          data['condition_id']!,
          _conditionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conditionIdMeta);
    }
    if (data.containsKey('consume_num')) {
      context.handle(
        _consumeNumMeta,
        consumeNum.isAcceptableOrUnknown(data['consume_num']!, _consumeNumMeta),
      );
    } else if (isInserting) {
      context.missing(_consumeNumMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RedeemUnitData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RedeemUnitData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      slotId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}slot_id'],
          )!,
      conditionCategory:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}condition_category'],
          )!,
      conditionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}condition_id'],
          )!,
      consumeNum:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}consume_num'],
          )!,
    );
  }

  @override
  $RedeemUnitTable createAlias(String alias) {
    return $RedeemUnitTable(attachedDatabase, alias);
  }
}

class RedeemUnitData extends DataClass implements Insertable<RedeemUnitData> {
  final int id;
  final int unitId;
  final int slotId;
  final int conditionCategory;
  final int conditionId;
  final String consumeNum;
  const RedeemUnitData({
    required this.id,
    required this.unitId,
    required this.slotId,
    required this.conditionCategory,
    required this.conditionId,
    required this.consumeNum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['unit_id'] = Variable<int>(unitId);
    map['slot_id'] = Variable<int>(slotId);
    map['condition_category'] = Variable<int>(conditionCategory);
    map['condition_id'] = Variable<int>(conditionId);
    map['consume_num'] = Variable<String>(consumeNum);
    return map;
  }

  RedeemUnitCompanion toCompanion(bool nullToAbsent) {
    return RedeemUnitCompanion(
      id: Value(id),
      unitId: Value(unitId),
      slotId: Value(slotId),
      conditionCategory: Value(conditionCategory),
      conditionId: Value(conditionId),
      consumeNum: Value(consumeNum),
    );
  }

  factory RedeemUnitData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RedeemUnitData(
      id: serializer.fromJson<int>(json['id']),
      unitId: serializer.fromJson<int>(json['unitId']),
      slotId: serializer.fromJson<int>(json['slotId']),
      conditionCategory: serializer.fromJson<int>(json['conditionCategory']),
      conditionId: serializer.fromJson<int>(json['conditionId']),
      consumeNum: serializer.fromJson<String>(json['consumeNum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'unitId': serializer.toJson<int>(unitId),
      'slotId': serializer.toJson<int>(slotId),
      'conditionCategory': serializer.toJson<int>(conditionCategory),
      'conditionId': serializer.toJson<int>(conditionId),
      'consumeNum': serializer.toJson<String>(consumeNum),
    };
  }

  RedeemUnitData copyWith({
    int? id,
    int? unitId,
    int? slotId,
    int? conditionCategory,
    int? conditionId,
    String? consumeNum,
  }) => RedeemUnitData(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    slotId: slotId ?? this.slotId,
    conditionCategory: conditionCategory ?? this.conditionCategory,
    conditionId: conditionId ?? this.conditionId,
    consumeNum: consumeNum ?? this.consumeNum,
  );
  RedeemUnitData copyWithCompanion(RedeemUnitCompanion data) {
    return RedeemUnitData(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      slotId: data.slotId.present ? data.slotId.value : this.slotId,
      conditionCategory:
          data.conditionCategory.present
              ? data.conditionCategory.value
              : this.conditionCategory,
      conditionId:
          data.conditionId.present ? data.conditionId.value : this.conditionId,
      consumeNum:
          data.consumeNum.present ? data.consumeNum.value : this.consumeNum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RedeemUnitData(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('slotId: $slotId, ')
          ..write('conditionCategory: $conditionCategory, ')
          ..write('conditionId: $conditionId, ')
          ..write('consumeNum: $consumeNum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    unitId,
    slotId,
    conditionCategory,
    conditionId,
    consumeNum,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RedeemUnitData &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.slotId == this.slotId &&
          other.conditionCategory == this.conditionCategory &&
          other.conditionId == this.conditionId &&
          other.consumeNum == this.consumeNum);
}

class RedeemUnitCompanion extends UpdateCompanion<RedeemUnitData> {
  final Value<int> id;
  final Value<int> unitId;
  final Value<int> slotId;
  final Value<int> conditionCategory;
  final Value<int> conditionId;
  final Value<String> consumeNum;
  const RedeemUnitCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.slotId = const Value.absent(),
    this.conditionCategory = const Value.absent(),
    this.conditionId = const Value.absent(),
    this.consumeNum = const Value.absent(),
  });
  RedeemUnitCompanion.insert({
    this.id = const Value.absent(),
    required int unitId,
    required int slotId,
    required int conditionCategory,
    required int conditionId,
    required String consumeNum,
  }) : unitId = Value(unitId),
       slotId = Value(slotId),
       conditionCategory = Value(conditionCategory),
       conditionId = Value(conditionId),
       consumeNum = Value(consumeNum);
  static Insertable<RedeemUnitData> custom({
    Expression<int>? id,
    Expression<int>? unitId,
    Expression<int>? slotId,
    Expression<int>? conditionCategory,
    Expression<int>? conditionId,
    Expression<String>? consumeNum,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (slotId != null) 'slot_id': slotId,
      if (conditionCategory != null) 'condition_category': conditionCategory,
      if (conditionId != null) 'condition_id': conditionId,
      if (consumeNum != null) 'consume_num': consumeNum,
    });
  }

  RedeemUnitCompanion copyWith({
    Value<int>? id,
    Value<int>? unitId,
    Value<int>? slotId,
    Value<int>? conditionCategory,
    Value<int>? conditionId,
    Value<String>? consumeNum,
  }) {
    return RedeemUnitCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      slotId: slotId ?? this.slotId,
      conditionCategory: conditionCategory ?? this.conditionCategory,
      conditionId: conditionId ?? this.conditionId,
      consumeNum: consumeNum ?? this.consumeNum,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (slotId.present) {
      map['slot_id'] = Variable<int>(slotId.value);
    }
    if (conditionCategory.present) {
      map['condition_category'] = Variable<int>(conditionCategory.value);
    }
    if (conditionId.present) {
      map['condition_id'] = Variable<int>(conditionId.value);
    }
    if (consumeNum.present) {
      map['consume_num'] = Variable<String>(consumeNum.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RedeemUnitCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('slotId: $slotId, ')
          ..write('conditionCategory: $conditionCategory, ')
          ..write('conditionId: $conditionId, ')
          ..write('consumeNum: $consumeNum')
          ..write(')'))
        .toString();
  }
}

class $UnitDataTable extends UnitData
    with TableInfo<$UnitDataTable, UnitDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kanaMeta = const VerificationMeta('kana');
  @override
  late final GeneratedColumn<String> kana = GeneratedColumn<String>(
    'kana',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prefabIdMeta = const VerificationMeta(
    'prefabId',
  );
  @override
  late final GeneratedColumn<int> prefabId = GeneratedColumn<int>(
    'prefab_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prefabIdBattleMeta = const VerificationMeta(
    'prefabIdBattle',
  );
  @override
  late final GeneratedColumn<int> prefabIdBattle = GeneratedColumn<int>(
    'prefab_id_battle',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLimitedMeta = const VerificationMeta(
    'isLimited',
  );
  @override
  late final GeneratedColumn<int> isLimited = GeneratedColumn<int>(
    'is_limited',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<int> rarity = GeneratedColumn<int>(
    'rarity',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _motionTypeMeta = const VerificationMeta(
    'motionType',
  );
  @override
  late final GeneratedColumn<int> motionType = GeneratedColumn<int>(
    'motion_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seTypeMeta = const VerificationMeta('seType');
  @override
  late final GeneratedColumn<int> seType = GeneratedColumn<int>(
    'se_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moveSpeedMeta = const VerificationMeta(
    'moveSpeed',
  );
  @override
  late final GeneratedColumn<int> moveSpeed = GeneratedColumn<int>(
    'move_speed',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _searchAreaWidthMeta = const VerificationMeta(
    'searchAreaWidth',
  );
  @override
  late final GeneratedColumn<int> searchAreaWidth = GeneratedColumn<int>(
    'search_area_width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkTypeMeta = const VerificationMeta(
    'atkType',
  );
  @override
  late final GeneratedColumn<int> atkType = GeneratedColumn<int>(
    'atk_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _normalAtkCastTimeMeta = const VerificationMeta(
    'normalAtkCastTime',
  );
  @override
  late final GeneratedColumn<double> normalAtkCastTime =
      GeneratedColumn<double>(
        'normal_atk_cast_time',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _cutin1Meta = const VerificationMeta('cutin1');
  @override
  late final GeneratedColumn<int> cutin1 = GeneratedColumn<int>(
    'cutin_1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cutin2Meta = const VerificationMeta('cutin2');
  @override
  late final GeneratedColumn<int> cutin2 = GeneratedColumn<int>(
    'cutin_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cutin1Star6Meta = const VerificationMeta(
    'cutin1Star6',
  );
  @override
  late final GeneratedColumn<int> cutin1Star6 = GeneratedColumn<int>(
    'cutin1_star6',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cutin2Star6Meta = const VerificationMeta(
    'cutin2Star6',
  );
  @override
  late final GeneratedColumn<int> cutin2Star6 = GeneratedColumn<int>(
    'cutin2_star6',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _guildIdMeta = const VerificationMeta(
    'guildId',
  );
  @override
  late final GeneratedColumn<int> guildId = GeneratedColumn<int>(
    'guild_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exskillDisplayMeta = const VerificationMeta(
    'exskillDisplay',
  );
  @override
  late final GeneratedColumn<int> exskillDisplay = GeneratedColumn<int>(
    'exskill_display',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _onlyDispOwnedMeta = const VerificationMeta(
    'onlyDispOwned',
  );
  @override
  late final GeneratedColumn<int> onlyDispOwned = GeneratedColumn<int>(
    'only_disp_owned',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _originalUnitIdMeta = const VerificationMeta(
    'originalUnitId',
  );
  @override
  late final GeneratedColumn<int> originalUnitId = GeneratedColumn<int>(
    'original_unit_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    unitId,
    unitName,
    kana,
    prefabId,
    prefabIdBattle,
    isLimited,
    rarity,
    motionType,
    seType,
    moveSpeed,
    searchAreaWidth,
    atkType,
    normalAtkCastTime,
    cutin1,
    cutin2,
    cutin1Star6,
    cutin2Star6,
    guildId,
    exskillDisplay,
    comment,
    onlyDispOwned,
    startTime,
    endTime,
    originalUnitId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    } else if (isInserting) {
      context.missing(_unitNameMeta);
    }
    if (data.containsKey('kana')) {
      context.handle(
        _kanaMeta,
        kana.isAcceptableOrUnknown(data['kana']!, _kanaMeta),
      );
    }
    if (data.containsKey('prefab_id')) {
      context.handle(
        _prefabIdMeta,
        prefabId.isAcceptableOrUnknown(data['prefab_id']!, _prefabIdMeta),
      );
    }
    if (data.containsKey('prefab_id_battle')) {
      context.handle(
        _prefabIdBattleMeta,
        prefabIdBattle.isAcceptableOrUnknown(
          data['prefab_id_battle']!,
          _prefabIdBattleMeta,
        ),
      );
    }
    if (data.containsKey('is_limited')) {
      context.handle(
        _isLimitedMeta,
        isLimited.isAcceptableOrUnknown(data['is_limited']!, _isLimitedMeta),
      );
    }
    if (data.containsKey('rarity')) {
      context.handle(
        _rarityMeta,
        rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta),
      );
    }
    if (data.containsKey('motion_type')) {
      context.handle(
        _motionTypeMeta,
        motionType.isAcceptableOrUnknown(data['motion_type']!, _motionTypeMeta),
      );
    }
    if (data.containsKey('se_type')) {
      context.handle(
        _seTypeMeta,
        seType.isAcceptableOrUnknown(data['se_type']!, _seTypeMeta),
      );
    }
    if (data.containsKey('move_speed')) {
      context.handle(
        _moveSpeedMeta,
        moveSpeed.isAcceptableOrUnknown(data['move_speed']!, _moveSpeedMeta),
      );
    }
    if (data.containsKey('search_area_width')) {
      context.handle(
        _searchAreaWidthMeta,
        searchAreaWidth.isAcceptableOrUnknown(
          data['search_area_width']!,
          _searchAreaWidthMeta,
        ),
      );
    }
    if (data.containsKey('atk_type')) {
      context.handle(
        _atkTypeMeta,
        atkType.isAcceptableOrUnknown(data['atk_type']!, _atkTypeMeta),
      );
    }
    if (data.containsKey('normal_atk_cast_time')) {
      context.handle(
        _normalAtkCastTimeMeta,
        normalAtkCastTime.isAcceptableOrUnknown(
          data['normal_atk_cast_time']!,
          _normalAtkCastTimeMeta,
        ),
      );
    }
    if (data.containsKey('cutin_1')) {
      context.handle(
        _cutin1Meta,
        cutin1.isAcceptableOrUnknown(data['cutin_1']!, _cutin1Meta),
      );
    }
    if (data.containsKey('cutin_2')) {
      context.handle(
        _cutin2Meta,
        cutin2.isAcceptableOrUnknown(data['cutin_2']!, _cutin2Meta),
      );
    }
    if (data.containsKey('cutin1_star6')) {
      context.handle(
        _cutin1Star6Meta,
        cutin1Star6.isAcceptableOrUnknown(
          data['cutin1_star6']!,
          _cutin1Star6Meta,
        ),
      );
    }
    if (data.containsKey('cutin2_star6')) {
      context.handle(
        _cutin2Star6Meta,
        cutin2Star6.isAcceptableOrUnknown(
          data['cutin2_star6']!,
          _cutin2Star6Meta,
        ),
      );
    }
    if (data.containsKey('guild_id')) {
      context.handle(
        _guildIdMeta,
        guildId.isAcceptableOrUnknown(data['guild_id']!, _guildIdMeta),
      );
    }
    if (data.containsKey('exskill_display')) {
      context.handle(
        _exskillDisplayMeta,
        exskillDisplay.isAcceptableOrUnknown(
          data['exskill_display']!,
          _exskillDisplayMeta,
        ),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('only_disp_owned')) {
      context.handle(
        _onlyDispOwnedMeta,
        onlyDispOwned.isAcceptableOrUnknown(
          data['only_disp_owned']!,
          _onlyDispOwnedMeta,
        ),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('original_unit_id')) {
      context.handle(
        _originalUnitIdMeta,
        originalUnitId.isAcceptableOrUnknown(
          data['original_unit_id']!,
          _originalUnitIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  UnitDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitDataData(
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      unitName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}unit_name'],
          )!,
      kana: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kana'],
      ),
      prefabId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prefab_id'],
      ),
      prefabIdBattle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prefab_id_battle'],
      ),
      isLimited: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_limited'],
      ),
      rarity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rarity'],
      ),
      motionType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}motion_type'],
      ),
      seType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}se_type'],
      ),
      moveSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}move_speed'],
      ),
      searchAreaWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}search_area_width'],
      ),
      atkType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_type'],
      ),
      normalAtkCastTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}normal_atk_cast_time'],
      ),
      cutin1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cutin_1'],
      ),
      cutin2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cutin_2'],
      ),
      cutin1Star6: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cutin1_star6'],
      ),
      cutin2Star6: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cutin2_star6'],
      ),
      guildId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guild_id'],
      ),
      exskillDisplay: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exskill_display'],
      ),
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      onlyDispOwned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}only_disp_owned'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}end_time'],
      ),
      originalUnitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}original_unit_id'],
      ),
    );
  }

  @override
  $UnitDataTable createAlias(String alias) {
    return $UnitDataTable(attachedDatabase, alias);
  }
}

class UnitDataData extends DataClass implements Insertable<UnitDataData> {
  final int unitId;
  final String unitName;
  final String? kana;
  final int? prefabId;
  final int? prefabIdBattle;
  final int? isLimited;
  final int? rarity;
  final int? motionType;
  final int? seType;
  final int? moveSpeed;
  final int? searchAreaWidth;
  final int? atkType;
  final double? normalAtkCastTime;
  final int? cutin1;
  final int? cutin2;
  final int? cutin1Star6;
  final int? cutin2Star6;
  final int? guildId;
  final int? exskillDisplay;
  final String? comment;
  final int? onlyDispOwned;
  final String? startTime;
  final String? endTime;
  final int? originalUnitId;
  const UnitDataData({
    required this.unitId,
    required this.unitName,
    this.kana,
    this.prefabId,
    this.prefabIdBattle,
    this.isLimited,
    this.rarity,
    this.motionType,
    this.seType,
    this.moveSpeed,
    this.searchAreaWidth,
    this.atkType,
    this.normalAtkCastTime,
    this.cutin1,
    this.cutin2,
    this.cutin1Star6,
    this.cutin2Star6,
    this.guildId,
    this.exskillDisplay,
    this.comment,
    this.onlyDispOwned,
    this.startTime,
    this.endTime,
    this.originalUnitId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['unit_name'] = Variable<String>(unitName);
    if (!nullToAbsent || kana != null) {
      map['kana'] = Variable<String>(kana);
    }
    if (!nullToAbsent || prefabId != null) {
      map['prefab_id'] = Variable<int>(prefabId);
    }
    if (!nullToAbsent || prefabIdBattle != null) {
      map['prefab_id_battle'] = Variable<int>(prefabIdBattle);
    }
    if (!nullToAbsent || isLimited != null) {
      map['is_limited'] = Variable<int>(isLimited);
    }
    if (!nullToAbsent || rarity != null) {
      map['rarity'] = Variable<int>(rarity);
    }
    if (!nullToAbsent || motionType != null) {
      map['motion_type'] = Variable<int>(motionType);
    }
    if (!nullToAbsent || seType != null) {
      map['se_type'] = Variable<int>(seType);
    }
    if (!nullToAbsent || moveSpeed != null) {
      map['move_speed'] = Variable<int>(moveSpeed);
    }
    if (!nullToAbsent || searchAreaWidth != null) {
      map['search_area_width'] = Variable<int>(searchAreaWidth);
    }
    if (!nullToAbsent || atkType != null) {
      map['atk_type'] = Variable<int>(atkType);
    }
    if (!nullToAbsent || normalAtkCastTime != null) {
      map['normal_atk_cast_time'] = Variable<double>(normalAtkCastTime);
    }
    if (!nullToAbsent || cutin1 != null) {
      map['cutin_1'] = Variable<int>(cutin1);
    }
    if (!nullToAbsent || cutin2 != null) {
      map['cutin_2'] = Variable<int>(cutin2);
    }
    if (!nullToAbsent || cutin1Star6 != null) {
      map['cutin1_star6'] = Variable<int>(cutin1Star6);
    }
    if (!nullToAbsent || cutin2Star6 != null) {
      map['cutin2_star6'] = Variable<int>(cutin2Star6);
    }
    if (!nullToAbsent || guildId != null) {
      map['guild_id'] = Variable<int>(guildId);
    }
    if (!nullToAbsent || exskillDisplay != null) {
      map['exskill_display'] = Variable<int>(exskillDisplay);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    if (!nullToAbsent || onlyDispOwned != null) {
      map['only_disp_owned'] = Variable<int>(onlyDispOwned);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String>(endTime);
    }
    if (!nullToAbsent || originalUnitId != null) {
      map['original_unit_id'] = Variable<int>(originalUnitId);
    }
    return map;
  }

  UnitDataCompanion toCompanion(bool nullToAbsent) {
    return UnitDataCompanion(
      unitId: Value(unitId),
      unitName: Value(unitName),
      kana: kana == null && nullToAbsent ? const Value.absent() : Value(kana),
      prefabId:
          prefabId == null && nullToAbsent
              ? const Value.absent()
              : Value(prefabId),
      prefabIdBattle:
          prefabIdBattle == null && nullToAbsent
              ? const Value.absent()
              : Value(prefabIdBattle),
      isLimited:
          isLimited == null && nullToAbsent
              ? const Value.absent()
              : Value(isLimited),
      rarity:
          rarity == null && nullToAbsent ? const Value.absent() : Value(rarity),
      motionType:
          motionType == null && nullToAbsent
              ? const Value.absent()
              : Value(motionType),
      seType:
          seType == null && nullToAbsent ? const Value.absent() : Value(seType),
      moveSpeed:
          moveSpeed == null && nullToAbsent
              ? const Value.absent()
              : Value(moveSpeed),
      searchAreaWidth:
          searchAreaWidth == null && nullToAbsent
              ? const Value.absent()
              : Value(searchAreaWidth),
      atkType:
          atkType == null && nullToAbsent
              ? const Value.absent()
              : Value(atkType),
      normalAtkCastTime:
          normalAtkCastTime == null && nullToAbsent
              ? const Value.absent()
              : Value(normalAtkCastTime),
      cutin1:
          cutin1 == null && nullToAbsent ? const Value.absent() : Value(cutin1),
      cutin2:
          cutin2 == null && nullToAbsent ? const Value.absent() : Value(cutin2),
      cutin1Star6:
          cutin1Star6 == null && nullToAbsent
              ? const Value.absent()
              : Value(cutin1Star6),
      cutin2Star6:
          cutin2Star6 == null && nullToAbsent
              ? const Value.absent()
              : Value(cutin2Star6),
      guildId:
          guildId == null && nullToAbsent
              ? const Value.absent()
              : Value(guildId),
      exskillDisplay:
          exskillDisplay == null && nullToAbsent
              ? const Value.absent()
              : Value(exskillDisplay),
      comment:
          comment == null && nullToAbsent
              ? const Value.absent()
              : Value(comment),
      onlyDispOwned:
          onlyDispOwned == null && nullToAbsent
              ? const Value.absent()
              : Value(onlyDispOwned),
      startTime:
          startTime == null && nullToAbsent
              ? const Value.absent()
              : Value(startTime),
      endTime:
          endTime == null && nullToAbsent
              ? const Value.absent()
              : Value(endTime),
      originalUnitId:
          originalUnitId == null && nullToAbsent
              ? const Value.absent()
              : Value(originalUnitId),
    );
  }

  factory UnitDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitDataData(
      unitId: serializer.fromJson<int>(json['unitId']),
      unitName: serializer.fromJson<String>(json['unitName']),
      kana: serializer.fromJson<String?>(json['kana']),
      prefabId: serializer.fromJson<int?>(json['prefabId']),
      prefabIdBattle: serializer.fromJson<int?>(json['prefabIdBattle']),
      isLimited: serializer.fromJson<int?>(json['isLimited']),
      rarity: serializer.fromJson<int?>(json['rarity']),
      motionType: serializer.fromJson<int?>(json['motionType']),
      seType: serializer.fromJson<int?>(json['seType']),
      moveSpeed: serializer.fromJson<int?>(json['moveSpeed']),
      searchAreaWidth: serializer.fromJson<int?>(json['searchAreaWidth']),
      atkType: serializer.fromJson<int?>(json['atkType']),
      normalAtkCastTime: serializer.fromJson<double?>(
        json['normalAtkCastTime'],
      ),
      cutin1: serializer.fromJson<int?>(json['cutin1']),
      cutin2: serializer.fromJson<int?>(json['cutin2']),
      cutin1Star6: serializer.fromJson<int?>(json['cutin1Star6']),
      cutin2Star6: serializer.fromJson<int?>(json['cutin2Star6']),
      guildId: serializer.fromJson<int?>(json['guildId']),
      exskillDisplay: serializer.fromJson<int?>(json['exskillDisplay']),
      comment: serializer.fromJson<String?>(json['comment']),
      onlyDispOwned: serializer.fromJson<int?>(json['onlyDispOwned']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      originalUnitId: serializer.fromJson<int?>(json['originalUnitId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'unitName': serializer.toJson<String>(unitName),
      'kana': serializer.toJson<String?>(kana),
      'prefabId': serializer.toJson<int?>(prefabId),
      'prefabIdBattle': serializer.toJson<int?>(prefabIdBattle),
      'isLimited': serializer.toJson<int?>(isLimited),
      'rarity': serializer.toJson<int?>(rarity),
      'motionType': serializer.toJson<int?>(motionType),
      'seType': serializer.toJson<int?>(seType),
      'moveSpeed': serializer.toJson<int?>(moveSpeed),
      'searchAreaWidth': serializer.toJson<int?>(searchAreaWidth),
      'atkType': serializer.toJson<int?>(atkType),
      'normalAtkCastTime': serializer.toJson<double?>(normalAtkCastTime),
      'cutin1': serializer.toJson<int?>(cutin1),
      'cutin2': serializer.toJson<int?>(cutin2),
      'cutin1Star6': serializer.toJson<int?>(cutin1Star6),
      'cutin2Star6': serializer.toJson<int?>(cutin2Star6),
      'guildId': serializer.toJson<int?>(guildId),
      'exskillDisplay': serializer.toJson<int?>(exskillDisplay),
      'comment': serializer.toJson<String?>(comment),
      'onlyDispOwned': serializer.toJson<int?>(onlyDispOwned),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'originalUnitId': serializer.toJson<int?>(originalUnitId),
    };
  }

  UnitDataData copyWith({
    int? unitId,
    String? unitName,
    Value<String?> kana = const Value.absent(),
    Value<int?> prefabId = const Value.absent(),
    Value<int?> prefabIdBattle = const Value.absent(),
    Value<int?> isLimited = const Value.absent(),
    Value<int?> rarity = const Value.absent(),
    Value<int?> motionType = const Value.absent(),
    Value<int?> seType = const Value.absent(),
    Value<int?> moveSpeed = const Value.absent(),
    Value<int?> searchAreaWidth = const Value.absent(),
    Value<int?> atkType = const Value.absent(),
    Value<double?> normalAtkCastTime = const Value.absent(),
    Value<int?> cutin1 = const Value.absent(),
    Value<int?> cutin2 = const Value.absent(),
    Value<int?> cutin1Star6 = const Value.absent(),
    Value<int?> cutin2Star6 = const Value.absent(),
    Value<int?> guildId = const Value.absent(),
    Value<int?> exskillDisplay = const Value.absent(),
    Value<String?> comment = const Value.absent(),
    Value<int?> onlyDispOwned = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> endTime = const Value.absent(),
    Value<int?> originalUnitId = const Value.absent(),
  }) => UnitDataData(
    unitId: unitId ?? this.unitId,
    unitName: unitName ?? this.unitName,
    kana: kana.present ? kana.value : this.kana,
    prefabId: prefabId.present ? prefabId.value : this.prefabId,
    prefabIdBattle:
        prefabIdBattle.present ? prefabIdBattle.value : this.prefabIdBattle,
    isLimited: isLimited.present ? isLimited.value : this.isLimited,
    rarity: rarity.present ? rarity.value : this.rarity,
    motionType: motionType.present ? motionType.value : this.motionType,
    seType: seType.present ? seType.value : this.seType,
    moveSpeed: moveSpeed.present ? moveSpeed.value : this.moveSpeed,
    searchAreaWidth:
        searchAreaWidth.present ? searchAreaWidth.value : this.searchAreaWidth,
    atkType: atkType.present ? atkType.value : this.atkType,
    normalAtkCastTime:
        normalAtkCastTime.present
            ? normalAtkCastTime.value
            : this.normalAtkCastTime,
    cutin1: cutin1.present ? cutin1.value : this.cutin1,
    cutin2: cutin2.present ? cutin2.value : this.cutin2,
    cutin1Star6: cutin1Star6.present ? cutin1Star6.value : this.cutin1Star6,
    cutin2Star6: cutin2Star6.present ? cutin2Star6.value : this.cutin2Star6,
    guildId: guildId.present ? guildId.value : this.guildId,
    exskillDisplay:
        exskillDisplay.present ? exskillDisplay.value : this.exskillDisplay,
    comment: comment.present ? comment.value : this.comment,
    onlyDispOwned:
        onlyDispOwned.present ? onlyDispOwned.value : this.onlyDispOwned,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    originalUnitId:
        originalUnitId.present ? originalUnitId.value : this.originalUnitId,
  );
  UnitDataData copyWithCompanion(UnitDataCompanion data) {
    return UnitDataData(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      kana: data.kana.present ? data.kana.value : this.kana,
      prefabId: data.prefabId.present ? data.prefabId.value : this.prefabId,
      prefabIdBattle:
          data.prefabIdBattle.present
              ? data.prefabIdBattle.value
              : this.prefabIdBattle,
      isLimited: data.isLimited.present ? data.isLimited.value : this.isLimited,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      motionType:
          data.motionType.present ? data.motionType.value : this.motionType,
      seType: data.seType.present ? data.seType.value : this.seType,
      moveSpeed: data.moveSpeed.present ? data.moveSpeed.value : this.moveSpeed,
      searchAreaWidth:
          data.searchAreaWidth.present
              ? data.searchAreaWidth.value
              : this.searchAreaWidth,
      atkType: data.atkType.present ? data.atkType.value : this.atkType,
      normalAtkCastTime:
          data.normalAtkCastTime.present
              ? data.normalAtkCastTime.value
              : this.normalAtkCastTime,
      cutin1: data.cutin1.present ? data.cutin1.value : this.cutin1,
      cutin2: data.cutin2.present ? data.cutin2.value : this.cutin2,
      cutin1Star6:
          data.cutin1Star6.present ? data.cutin1Star6.value : this.cutin1Star6,
      cutin2Star6:
          data.cutin2Star6.present ? data.cutin2Star6.value : this.cutin2Star6,
      guildId: data.guildId.present ? data.guildId.value : this.guildId,
      exskillDisplay:
          data.exskillDisplay.present
              ? data.exskillDisplay.value
              : this.exskillDisplay,
      comment: data.comment.present ? data.comment.value : this.comment,
      onlyDispOwned:
          data.onlyDispOwned.present
              ? data.onlyDispOwned.value
              : this.onlyDispOwned,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      originalUnitId:
          data.originalUnitId.present
              ? data.originalUnitId.value
              : this.originalUnitId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitDataData(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('kana: $kana, ')
          ..write('prefabId: $prefabId, ')
          ..write('prefabIdBattle: $prefabIdBattle, ')
          ..write('isLimited: $isLimited, ')
          ..write('rarity: $rarity, ')
          ..write('motionType: $motionType, ')
          ..write('seType: $seType, ')
          ..write('moveSpeed: $moveSpeed, ')
          ..write('searchAreaWidth: $searchAreaWidth, ')
          ..write('atkType: $atkType, ')
          ..write('normalAtkCastTime: $normalAtkCastTime, ')
          ..write('cutin1: $cutin1, ')
          ..write('cutin2: $cutin2, ')
          ..write('cutin1Star6: $cutin1Star6, ')
          ..write('cutin2Star6: $cutin2Star6, ')
          ..write('guildId: $guildId, ')
          ..write('exskillDisplay: $exskillDisplay, ')
          ..write('comment: $comment, ')
          ..write('onlyDispOwned: $onlyDispOwned, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('originalUnitId: $originalUnitId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    unitId,
    unitName,
    kana,
    prefabId,
    prefabIdBattle,
    isLimited,
    rarity,
    motionType,
    seType,
    moveSpeed,
    searchAreaWidth,
    atkType,
    normalAtkCastTime,
    cutin1,
    cutin2,
    cutin1Star6,
    cutin2Star6,
    guildId,
    exskillDisplay,
    comment,
    onlyDispOwned,
    startTime,
    endTime,
    originalUnitId,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitDataData &&
          other.unitId == this.unitId &&
          other.unitName == this.unitName &&
          other.kana == this.kana &&
          other.prefabId == this.prefabId &&
          other.prefabIdBattle == this.prefabIdBattle &&
          other.isLimited == this.isLimited &&
          other.rarity == this.rarity &&
          other.motionType == this.motionType &&
          other.seType == this.seType &&
          other.moveSpeed == this.moveSpeed &&
          other.searchAreaWidth == this.searchAreaWidth &&
          other.atkType == this.atkType &&
          other.normalAtkCastTime == this.normalAtkCastTime &&
          other.cutin1 == this.cutin1 &&
          other.cutin2 == this.cutin2 &&
          other.cutin1Star6 == this.cutin1Star6 &&
          other.cutin2Star6 == this.cutin2Star6 &&
          other.guildId == this.guildId &&
          other.exskillDisplay == this.exskillDisplay &&
          other.comment == this.comment &&
          other.onlyDispOwned == this.onlyDispOwned &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.originalUnitId == this.originalUnitId);
}

class UnitDataCompanion extends UpdateCompanion<UnitDataData> {
  final Value<int> unitId;
  final Value<String> unitName;
  final Value<String?> kana;
  final Value<int?> prefabId;
  final Value<int?> prefabIdBattle;
  final Value<int?> isLimited;
  final Value<int?> rarity;
  final Value<int?> motionType;
  final Value<int?> seType;
  final Value<int?> moveSpeed;
  final Value<int?> searchAreaWidth;
  final Value<int?> atkType;
  final Value<double?> normalAtkCastTime;
  final Value<int?> cutin1;
  final Value<int?> cutin2;
  final Value<int?> cutin1Star6;
  final Value<int?> cutin2Star6;
  final Value<int?> guildId;
  final Value<int?> exskillDisplay;
  final Value<String?> comment;
  final Value<int?> onlyDispOwned;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<int?> originalUnitId;
  const UnitDataCompanion({
    this.unitId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.kana = const Value.absent(),
    this.prefabId = const Value.absent(),
    this.prefabIdBattle = const Value.absent(),
    this.isLimited = const Value.absent(),
    this.rarity = const Value.absent(),
    this.motionType = const Value.absent(),
    this.seType = const Value.absent(),
    this.moveSpeed = const Value.absent(),
    this.searchAreaWidth = const Value.absent(),
    this.atkType = const Value.absent(),
    this.normalAtkCastTime = const Value.absent(),
    this.cutin1 = const Value.absent(),
    this.cutin2 = const Value.absent(),
    this.cutin1Star6 = const Value.absent(),
    this.cutin2Star6 = const Value.absent(),
    this.guildId = const Value.absent(),
    this.exskillDisplay = const Value.absent(),
    this.comment = const Value.absent(),
    this.onlyDispOwned = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.originalUnitId = const Value.absent(),
  });
  UnitDataCompanion.insert({
    this.unitId = const Value.absent(),
    required String unitName,
    this.kana = const Value.absent(),
    this.prefabId = const Value.absent(),
    this.prefabIdBattle = const Value.absent(),
    this.isLimited = const Value.absent(),
    this.rarity = const Value.absent(),
    this.motionType = const Value.absent(),
    this.seType = const Value.absent(),
    this.moveSpeed = const Value.absent(),
    this.searchAreaWidth = const Value.absent(),
    this.atkType = const Value.absent(),
    this.normalAtkCastTime = const Value.absent(),
    this.cutin1 = const Value.absent(),
    this.cutin2 = const Value.absent(),
    this.cutin1Star6 = const Value.absent(),
    this.cutin2Star6 = const Value.absent(),
    this.guildId = const Value.absent(),
    this.exskillDisplay = const Value.absent(),
    this.comment = const Value.absent(),
    this.onlyDispOwned = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.originalUnitId = const Value.absent(),
  }) : unitName = Value(unitName);
  static Insertable<UnitDataData> custom({
    Expression<int>? unitId,
    Expression<String>? unitName,
    Expression<String>? kana,
    Expression<int>? prefabId,
    Expression<int>? prefabIdBattle,
    Expression<int>? isLimited,
    Expression<int>? rarity,
    Expression<int>? motionType,
    Expression<int>? seType,
    Expression<int>? moveSpeed,
    Expression<int>? searchAreaWidth,
    Expression<int>? atkType,
    Expression<double>? normalAtkCastTime,
    Expression<int>? cutin1,
    Expression<int>? cutin2,
    Expression<int>? cutin1Star6,
    Expression<int>? cutin2Star6,
    Expression<int>? guildId,
    Expression<int>? exskillDisplay,
    Expression<String>? comment,
    Expression<int>? onlyDispOwned,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<int>? originalUnitId,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (unitName != null) 'unit_name': unitName,
      if (kana != null) 'kana': kana,
      if (prefabId != null) 'prefab_id': prefabId,
      if (prefabIdBattle != null) 'prefab_id_battle': prefabIdBattle,
      if (isLimited != null) 'is_limited': isLimited,
      if (rarity != null) 'rarity': rarity,
      if (motionType != null) 'motion_type': motionType,
      if (seType != null) 'se_type': seType,
      if (moveSpeed != null) 'move_speed': moveSpeed,
      if (searchAreaWidth != null) 'search_area_width': searchAreaWidth,
      if (atkType != null) 'atk_type': atkType,
      if (normalAtkCastTime != null) 'normal_atk_cast_time': normalAtkCastTime,
      if (cutin1 != null) 'cutin_1': cutin1,
      if (cutin2 != null) 'cutin_2': cutin2,
      if (cutin1Star6 != null) 'cutin1_star6': cutin1Star6,
      if (cutin2Star6 != null) 'cutin2_star6': cutin2Star6,
      if (guildId != null) 'guild_id': guildId,
      if (exskillDisplay != null) 'exskill_display': exskillDisplay,
      if (comment != null) 'comment': comment,
      if (onlyDispOwned != null) 'only_disp_owned': onlyDispOwned,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (originalUnitId != null) 'original_unit_id': originalUnitId,
    });
  }

  UnitDataCompanion copyWith({
    Value<int>? unitId,
    Value<String>? unitName,
    Value<String?>? kana,
    Value<int?>? prefabId,
    Value<int?>? prefabIdBattle,
    Value<int?>? isLimited,
    Value<int?>? rarity,
    Value<int?>? motionType,
    Value<int?>? seType,
    Value<int?>? moveSpeed,
    Value<int?>? searchAreaWidth,
    Value<int?>? atkType,
    Value<double?>? normalAtkCastTime,
    Value<int?>? cutin1,
    Value<int?>? cutin2,
    Value<int?>? cutin1Star6,
    Value<int?>? cutin2Star6,
    Value<int?>? guildId,
    Value<int?>? exskillDisplay,
    Value<String?>? comment,
    Value<int?>? onlyDispOwned,
    Value<String?>? startTime,
    Value<String?>? endTime,
    Value<int?>? originalUnitId,
  }) {
    return UnitDataCompanion(
      unitId: unitId ?? this.unitId,
      unitName: unitName ?? this.unitName,
      kana: kana ?? this.kana,
      prefabId: prefabId ?? this.prefabId,
      prefabIdBattle: prefabIdBattle ?? this.prefabIdBattle,
      isLimited: isLimited ?? this.isLimited,
      rarity: rarity ?? this.rarity,
      motionType: motionType ?? this.motionType,
      seType: seType ?? this.seType,
      moveSpeed: moveSpeed ?? this.moveSpeed,
      searchAreaWidth: searchAreaWidth ?? this.searchAreaWidth,
      atkType: atkType ?? this.atkType,
      normalAtkCastTime: normalAtkCastTime ?? this.normalAtkCastTime,
      cutin1: cutin1 ?? this.cutin1,
      cutin2: cutin2 ?? this.cutin2,
      cutin1Star6: cutin1Star6 ?? this.cutin1Star6,
      cutin2Star6: cutin2Star6 ?? this.cutin2Star6,
      guildId: guildId ?? this.guildId,
      exskillDisplay: exskillDisplay ?? this.exskillDisplay,
      comment: comment ?? this.comment,
      onlyDispOwned: onlyDispOwned ?? this.onlyDispOwned,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      originalUnitId: originalUnitId ?? this.originalUnitId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (kana.present) {
      map['kana'] = Variable<String>(kana.value);
    }
    if (prefabId.present) {
      map['prefab_id'] = Variable<int>(prefabId.value);
    }
    if (prefabIdBattle.present) {
      map['prefab_id_battle'] = Variable<int>(prefabIdBattle.value);
    }
    if (isLimited.present) {
      map['is_limited'] = Variable<int>(isLimited.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<int>(rarity.value);
    }
    if (motionType.present) {
      map['motion_type'] = Variable<int>(motionType.value);
    }
    if (seType.present) {
      map['se_type'] = Variable<int>(seType.value);
    }
    if (moveSpeed.present) {
      map['move_speed'] = Variable<int>(moveSpeed.value);
    }
    if (searchAreaWidth.present) {
      map['search_area_width'] = Variable<int>(searchAreaWidth.value);
    }
    if (atkType.present) {
      map['atk_type'] = Variable<int>(atkType.value);
    }
    if (normalAtkCastTime.present) {
      map['normal_atk_cast_time'] = Variable<double>(normalAtkCastTime.value);
    }
    if (cutin1.present) {
      map['cutin_1'] = Variable<int>(cutin1.value);
    }
    if (cutin2.present) {
      map['cutin_2'] = Variable<int>(cutin2.value);
    }
    if (cutin1Star6.present) {
      map['cutin1_star6'] = Variable<int>(cutin1Star6.value);
    }
    if (cutin2Star6.present) {
      map['cutin2_star6'] = Variable<int>(cutin2Star6.value);
    }
    if (guildId.present) {
      map['guild_id'] = Variable<int>(guildId.value);
    }
    if (exskillDisplay.present) {
      map['exskill_display'] = Variable<int>(exskillDisplay.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (onlyDispOwned.present) {
      map['only_disp_owned'] = Variable<int>(onlyDispOwned.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (originalUnitId.present) {
      map['original_unit_id'] = Variable<int>(originalUnitId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitDataCompanion(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('kana: $kana, ')
          ..write('prefabId: $prefabId, ')
          ..write('prefabIdBattle: $prefabIdBattle, ')
          ..write('isLimited: $isLimited, ')
          ..write('rarity: $rarity, ')
          ..write('motionType: $motionType, ')
          ..write('seType: $seType, ')
          ..write('moveSpeed: $moveSpeed, ')
          ..write('searchAreaWidth: $searchAreaWidth, ')
          ..write('atkType: $atkType, ')
          ..write('normalAtkCastTime: $normalAtkCastTime, ')
          ..write('cutin1: $cutin1, ')
          ..write('cutin2: $cutin2, ')
          ..write('cutin1Star6: $cutin1Star6, ')
          ..write('cutin2Star6: $cutin2Star6, ')
          ..write('guildId: $guildId, ')
          ..write('exskillDisplay: $exskillDisplay, ')
          ..write('comment: $comment, ')
          ..write('onlyDispOwned: $onlyDispOwned, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('originalUnitId: $originalUnitId')
          ..write(')'))
        .toString();
  }
}

class $UniqueEquipmentEnhanceDataTable extends UniqueEquipmentEnhanceData
    with
        TableInfo<
          $UniqueEquipmentEnhanceDataTable,
          UniqueEquipmentEnhanceDataData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UniqueEquipmentEnhanceDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _equipSlotMeta = const VerificationMeta(
    'equipSlot',
  );
  @override
  late final GeneratedColumn<int> equipSlot = GeneratedColumn<int>(
    'equip_slot',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enhanceLevelMeta = const VerificationMeta(
    'enhanceLevel',
  );
  @override
  late final GeneratedColumn<int> enhanceLevel = GeneratedColumn<int>(
    'enhance_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _neededPointMeta = const VerificationMeta(
    'neededPoint',
  );
  @override
  late final GeneratedColumn<int> neededPoint = GeneratedColumn<int>(
    'needed_point',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalPointMeta = const VerificationMeta(
    'totalPoint',
  );
  @override
  late final GeneratedColumn<int> totalPoint = GeneratedColumn<int>(
    'total_point',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _neededManaMeta = const VerificationMeta(
    'neededMana',
  );
  @override
  late final GeneratedColumn<int> neededMana = GeneratedColumn<int>(
    'needed_mana',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int> rank = GeneratedColumn<int>(
    'rank',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    equipSlot,
    enhanceLevel,
    neededPoint,
    totalPoint,
    neededMana,
    rank,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unique_equipment_enhance_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<UniqueEquipmentEnhanceDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('equip_slot')) {
      context.handle(
        _equipSlotMeta,
        equipSlot.isAcceptableOrUnknown(data['equip_slot']!, _equipSlotMeta),
      );
    } else if (isInserting) {
      context.missing(_equipSlotMeta);
    }
    if (data.containsKey('enhance_level')) {
      context.handle(
        _enhanceLevelMeta,
        enhanceLevel.isAcceptableOrUnknown(
          data['enhance_level']!,
          _enhanceLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enhanceLevelMeta);
    }
    if (data.containsKey('needed_point')) {
      context.handle(
        _neededPointMeta,
        neededPoint.isAcceptableOrUnknown(
          data['needed_point']!,
          _neededPointMeta,
        ),
      );
    }
    if (data.containsKey('total_point')) {
      context.handle(
        _totalPointMeta,
        totalPoint.isAcceptableOrUnknown(data['total_point']!, _totalPointMeta),
      );
    }
    if (data.containsKey('needed_mana')) {
      context.handle(
        _neededManaMeta,
        neededMana.isAcceptableOrUnknown(data['needed_mana']!, _neededManaMeta),
      );
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {equipSlot, enhanceLevel};
  @override
  UniqueEquipmentEnhanceDataData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UniqueEquipmentEnhanceDataData(
      equipSlot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}equip_slot'],
          )!,
      enhanceLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enhance_level'],
          )!,
      neededPoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}needed_point'],
      ),
      totalPoint: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_point'],
      ),
      neededMana: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}needed_mana'],
      ),
      rank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rank'],
      ),
    );
  }

  @override
  $UniqueEquipmentEnhanceDataTable createAlias(String alias) {
    return $UniqueEquipmentEnhanceDataTable(attachedDatabase, alias);
  }
}

class UniqueEquipmentEnhanceDataData extends DataClass
    implements Insertable<UniqueEquipmentEnhanceDataData> {
  final int equipSlot;
  final int enhanceLevel;
  final int? neededPoint;
  final int? totalPoint;
  final int? neededMana;
  final int? rank;
  const UniqueEquipmentEnhanceDataData({
    required this.equipSlot,
    required this.enhanceLevel,
    this.neededPoint,
    this.totalPoint,
    this.neededMana,
    this.rank,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['equip_slot'] = Variable<int>(equipSlot);
    map['enhance_level'] = Variable<int>(enhanceLevel);
    if (!nullToAbsent || neededPoint != null) {
      map['needed_point'] = Variable<int>(neededPoint);
    }
    if (!nullToAbsent || totalPoint != null) {
      map['total_point'] = Variable<int>(totalPoint);
    }
    if (!nullToAbsent || neededMana != null) {
      map['needed_mana'] = Variable<int>(neededMana);
    }
    if (!nullToAbsent || rank != null) {
      map['rank'] = Variable<int>(rank);
    }
    return map;
  }

  UniqueEquipmentEnhanceDataCompanion toCompanion(bool nullToAbsent) {
    return UniqueEquipmentEnhanceDataCompanion(
      equipSlot: Value(equipSlot),
      enhanceLevel: Value(enhanceLevel),
      neededPoint:
          neededPoint == null && nullToAbsent
              ? const Value.absent()
              : Value(neededPoint),
      totalPoint:
          totalPoint == null && nullToAbsent
              ? const Value.absent()
              : Value(totalPoint),
      neededMana:
          neededMana == null && nullToAbsent
              ? const Value.absent()
              : Value(neededMana),
      rank: rank == null && nullToAbsent ? const Value.absent() : Value(rank),
    );
  }

  factory UniqueEquipmentEnhanceDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UniqueEquipmentEnhanceDataData(
      equipSlot: serializer.fromJson<int>(json['equipSlot']),
      enhanceLevel: serializer.fromJson<int>(json['enhanceLevel']),
      neededPoint: serializer.fromJson<int?>(json['neededPoint']),
      totalPoint: serializer.fromJson<int?>(json['totalPoint']),
      neededMana: serializer.fromJson<int?>(json['neededMana']),
      rank: serializer.fromJson<int?>(json['rank']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'equipSlot': serializer.toJson<int>(equipSlot),
      'enhanceLevel': serializer.toJson<int>(enhanceLevel),
      'neededPoint': serializer.toJson<int?>(neededPoint),
      'totalPoint': serializer.toJson<int?>(totalPoint),
      'neededMana': serializer.toJson<int?>(neededMana),
      'rank': serializer.toJson<int?>(rank),
    };
  }

  UniqueEquipmentEnhanceDataData copyWith({
    int? equipSlot,
    int? enhanceLevel,
    Value<int?> neededPoint = const Value.absent(),
    Value<int?> totalPoint = const Value.absent(),
    Value<int?> neededMana = const Value.absent(),
    Value<int?> rank = const Value.absent(),
  }) => UniqueEquipmentEnhanceDataData(
    equipSlot: equipSlot ?? this.equipSlot,
    enhanceLevel: enhanceLevel ?? this.enhanceLevel,
    neededPoint: neededPoint.present ? neededPoint.value : this.neededPoint,
    totalPoint: totalPoint.present ? totalPoint.value : this.totalPoint,
    neededMana: neededMana.present ? neededMana.value : this.neededMana,
    rank: rank.present ? rank.value : this.rank,
  );
  UniqueEquipmentEnhanceDataData copyWithCompanion(
    UniqueEquipmentEnhanceDataCompanion data,
  ) {
    return UniqueEquipmentEnhanceDataData(
      equipSlot: data.equipSlot.present ? data.equipSlot.value : this.equipSlot,
      enhanceLevel:
          data.enhanceLevel.present
              ? data.enhanceLevel.value
              : this.enhanceLevel,
      neededPoint:
          data.neededPoint.present ? data.neededPoint.value : this.neededPoint,
      totalPoint:
          data.totalPoint.present ? data.totalPoint.value : this.totalPoint,
      neededMana:
          data.neededMana.present ? data.neededMana.value : this.neededMana,
      rank: data.rank.present ? data.rank.value : this.rank,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UniqueEquipmentEnhanceDataData(')
          ..write('equipSlot: $equipSlot, ')
          ..write('enhanceLevel: $enhanceLevel, ')
          ..write('neededPoint: $neededPoint, ')
          ..write('totalPoint: $totalPoint, ')
          ..write('neededMana: $neededMana, ')
          ..write('rank: $rank')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    equipSlot,
    enhanceLevel,
    neededPoint,
    totalPoint,
    neededMana,
    rank,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UniqueEquipmentEnhanceDataData &&
          other.equipSlot == this.equipSlot &&
          other.enhanceLevel == this.enhanceLevel &&
          other.neededPoint == this.neededPoint &&
          other.totalPoint == this.totalPoint &&
          other.neededMana == this.neededMana &&
          other.rank == this.rank);
}

class UniqueEquipmentEnhanceDataCompanion
    extends UpdateCompanion<UniqueEquipmentEnhanceDataData> {
  final Value<int> equipSlot;
  final Value<int> enhanceLevel;
  final Value<int?> neededPoint;
  final Value<int?> totalPoint;
  final Value<int?> neededMana;
  final Value<int?> rank;
  final Value<int> rowid;
  const UniqueEquipmentEnhanceDataCompanion({
    this.equipSlot = const Value.absent(),
    this.enhanceLevel = const Value.absent(),
    this.neededPoint = const Value.absent(),
    this.totalPoint = const Value.absent(),
    this.neededMana = const Value.absent(),
    this.rank = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UniqueEquipmentEnhanceDataCompanion.insert({
    required int equipSlot,
    required int enhanceLevel,
    this.neededPoint = const Value.absent(),
    this.totalPoint = const Value.absent(),
    this.neededMana = const Value.absent(),
    this.rank = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : equipSlot = Value(equipSlot),
       enhanceLevel = Value(enhanceLevel);
  static Insertable<UniqueEquipmentEnhanceDataData> custom({
    Expression<int>? equipSlot,
    Expression<int>? enhanceLevel,
    Expression<int>? neededPoint,
    Expression<int>? totalPoint,
    Expression<int>? neededMana,
    Expression<int>? rank,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (equipSlot != null) 'equip_slot': equipSlot,
      if (enhanceLevel != null) 'enhance_level': enhanceLevel,
      if (neededPoint != null) 'needed_point': neededPoint,
      if (totalPoint != null) 'total_point': totalPoint,
      if (neededMana != null) 'needed_mana': neededMana,
      if (rank != null) 'rank': rank,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UniqueEquipmentEnhanceDataCompanion copyWith({
    Value<int>? equipSlot,
    Value<int>? enhanceLevel,
    Value<int?>? neededPoint,
    Value<int?>? totalPoint,
    Value<int?>? neededMana,
    Value<int?>? rank,
    Value<int>? rowid,
  }) {
    return UniqueEquipmentEnhanceDataCompanion(
      equipSlot: equipSlot ?? this.equipSlot,
      enhanceLevel: enhanceLevel ?? this.enhanceLevel,
      neededPoint: neededPoint ?? this.neededPoint,
      totalPoint: totalPoint ?? this.totalPoint,
      neededMana: neededMana ?? this.neededMana,
      rank: rank ?? this.rank,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (equipSlot.present) {
      map['equip_slot'] = Variable<int>(equipSlot.value);
    }
    if (enhanceLevel.present) {
      map['enhance_level'] = Variable<int>(enhanceLevel.value);
    }
    if (neededPoint.present) {
      map['needed_point'] = Variable<int>(neededPoint.value);
    }
    if (totalPoint.present) {
      map['total_point'] = Variable<int>(totalPoint.value);
    }
    if (neededMana.present) {
      map['needed_mana'] = Variable<int>(neededMana.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UniqueEquipmentEnhanceDataCompanion(')
          ..write('equipSlot: $equipSlot, ')
          ..write('enhanceLevel: $enhanceLevel, ')
          ..write('neededPoint: $neededPoint, ')
          ..write('totalPoint: $totalPoint, ')
          ..write('neededMana: $neededMana, ')
          ..write('rank: $rank, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActualUnitBackgroundTable extends ActualUnitBackground
    with TableInfo<$ActualUnitBackgroundTable, ActualUnitBackgroundData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActualUnitBackgroundTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitNameMeta = const VerificationMeta(
    'unitName',
  );
  @override
  late final GeneratedColumn<String> unitName = GeneratedColumn<String>(
    'unit_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bgIdMeta = const VerificationMeta('bgId');
  @override
  late final GeneratedColumn<int> bgId = GeneratedColumn<int>(
    'bg_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _faceTypeMeta = const VerificationMeta(
    'faceType',
  );
  @override
  late final GeneratedColumn<int> faceType = GeneratedColumn<int>(
    'face_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [unitId, unitName, bgId, faceType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actual_unit_background';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActualUnitBackgroundData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('unit_name')) {
      context.handle(
        _unitNameMeta,
        unitName.isAcceptableOrUnknown(data['unit_name']!, _unitNameMeta),
      );
    }
    if (data.containsKey('bg_id')) {
      context.handle(
        _bgIdMeta,
        bgId.isAcceptableOrUnknown(data['bg_id']!, _bgIdMeta),
      );
    }
    if (data.containsKey('face_type')) {
      context.handle(
        _faceTypeMeta,
        faceType.isAcceptableOrUnknown(data['face_type']!, _faceTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  ActualUnitBackgroundData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActualUnitBackgroundData(
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      unitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_name'],
      ),
      bgId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bg_id'],
      ),
      faceType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}face_type'],
      ),
    );
  }

  @override
  $ActualUnitBackgroundTable createAlias(String alias) {
    return $ActualUnitBackgroundTable(attachedDatabase, alias);
  }
}

class ActualUnitBackgroundData extends DataClass
    implements Insertable<ActualUnitBackgroundData> {
  final int unitId;
  final String? unitName;
  final int? bgId;
  final int? faceType;
  const ActualUnitBackgroundData({
    required this.unitId,
    this.unitName,
    this.bgId,
    this.faceType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    if (!nullToAbsent || unitName != null) {
      map['unit_name'] = Variable<String>(unitName);
    }
    if (!nullToAbsent || bgId != null) {
      map['bg_id'] = Variable<int>(bgId);
    }
    if (!nullToAbsent || faceType != null) {
      map['face_type'] = Variable<int>(faceType);
    }
    return map;
  }

  ActualUnitBackgroundCompanion toCompanion(bool nullToAbsent) {
    return ActualUnitBackgroundCompanion(
      unitId: Value(unitId),
      unitName:
          unitName == null && nullToAbsent
              ? const Value.absent()
              : Value(unitName),
      bgId: bgId == null && nullToAbsent ? const Value.absent() : Value(bgId),
      faceType:
          faceType == null && nullToAbsent
              ? const Value.absent()
              : Value(faceType),
    );
  }

  factory ActualUnitBackgroundData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActualUnitBackgroundData(
      unitId: serializer.fromJson<int>(json['unitId']),
      unitName: serializer.fromJson<String?>(json['unitName']),
      bgId: serializer.fromJson<int?>(json['bgId']),
      faceType: serializer.fromJson<int?>(json['faceType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'unitName': serializer.toJson<String?>(unitName),
      'bgId': serializer.toJson<int?>(bgId),
      'faceType': serializer.toJson<int?>(faceType),
    };
  }

  ActualUnitBackgroundData copyWith({
    int? unitId,
    Value<String?> unitName = const Value.absent(),
    Value<int?> bgId = const Value.absent(),
    Value<int?> faceType = const Value.absent(),
  }) => ActualUnitBackgroundData(
    unitId: unitId ?? this.unitId,
    unitName: unitName.present ? unitName.value : this.unitName,
    bgId: bgId.present ? bgId.value : this.bgId,
    faceType: faceType.present ? faceType.value : this.faceType,
  );
  ActualUnitBackgroundData copyWithCompanion(
    ActualUnitBackgroundCompanion data,
  ) {
    return ActualUnitBackgroundData(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unitName: data.unitName.present ? data.unitName.value : this.unitName,
      bgId: data.bgId.present ? data.bgId.value : this.bgId,
      faceType: data.faceType.present ? data.faceType.value : this.faceType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActualUnitBackgroundData(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('bgId: $bgId, ')
          ..write('faceType: $faceType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(unitId, unitName, bgId, faceType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActualUnitBackgroundData &&
          other.unitId == this.unitId &&
          other.unitName == this.unitName &&
          other.bgId == this.bgId &&
          other.faceType == this.faceType);
}

class ActualUnitBackgroundCompanion
    extends UpdateCompanion<ActualUnitBackgroundData> {
  final Value<int> unitId;
  final Value<String?> unitName;
  final Value<int?> bgId;
  final Value<int?> faceType;
  const ActualUnitBackgroundCompanion({
    this.unitId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.bgId = const Value.absent(),
    this.faceType = const Value.absent(),
  });
  ActualUnitBackgroundCompanion.insert({
    this.unitId = const Value.absent(),
    this.unitName = const Value.absent(),
    this.bgId = const Value.absent(),
    this.faceType = const Value.absent(),
  });
  static Insertable<ActualUnitBackgroundData> custom({
    Expression<int>? unitId,
    Expression<String>? unitName,
    Expression<int>? bgId,
    Expression<int>? faceType,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (unitName != null) 'unit_name': unitName,
      if (bgId != null) 'bg_id': bgId,
      if (faceType != null) 'face_type': faceType,
    });
  }

  ActualUnitBackgroundCompanion copyWith({
    Value<int>? unitId,
    Value<String?>? unitName,
    Value<int?>? bgId,
    Value<int?>? faceType,
  }) {
    return ActualUnitBackgroundCompanion(
      unitId: unitId ?? this.unitId,
      unitName: unitName ?? this.unitName,
      bgId: bgId ?? this.bgId,
      faceType: faceType ?? this.faceType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (unitName.present) {
      map['unit_name'] = Variable<String>(unitName.value);
    }
    if (bgId.present) {
      map['bg_id'] = Variable<int>(bgId.value);
    }
    if (faceType.present) {
      map['face_type'] = Variable<int>(faceType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActualUnitBackgroundCompanion(')
          ..write('unitId: $unitId, ')
          ..write('unitName: $unitName, ')
          ..write('bgId: $bgId, ')
          ..write('faceType: $faceType')
          ..write(')'))
        .toString();
  }
}

class $Rarity6QuestDataTable extends Rarity6QuestData
    with TableInfo<$Rarity6QuestDataTable, Rarity6QuestDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Rarity6QuestDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _rarity6QuestIdMeta = const VerificationMeta(
    'rarity6QuestId',
  );
  @override
  late final GeneratedColumn<int> rarity6QuestId = GeneratedColumn<int>(
    'rarity_6_quest_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questNameMeta = const VerificationMeta(
    'questName',
  );
  @override
  late final GeneratedColumn<String> questName = GeneratedColumn<String>(
    'quest_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _limitTimeMeta = const VerificationMeta(
    'limitTime',
  );
  @override
  late final GeneratedColumn<int> limitTime = GeneratedColumn<int>(
    'limit_time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recommendedLevelMeta = const VerificationMeta(
    'recommendedLevel',
  );
  @override
  late final GeneratedColumn<int> recommendedLevel = GeneratedColumn<int>(
    'recommended_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardGroupIdMeta = const VerificationMeta(
    'rewardGroupId',
  );
  @override
  late final GeneratedColumn<int> rewardGroupId = GeneratedColumn<int>(
    'reward_group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _treasureTypeMeta = const VerificationMeta(
    'treasureType',
  );
  @override
  late final GeneratedColumn<int> treasureType = GeneratedColumn<int>(
    'treasure_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardImage1Meta = const VerificationMeta(
    'rewardImage1',
  );
  @override
  late final GeneratedColumn<int> rewardImage1 = GeneratedColumn<int>(
    'reward_image_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardCount1Meta = const VerificationMeta(
    'rewardCount1',
  );
  @override
  late final GeneratedColumn<int> rewardCount1 = GeneratedColumn<int>(
    'reward_count_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardImage2Meta = const VerificationMeta(
    'rewardImage2',
  );
  @override
  late final GeneratedColumn<int> rewardImage2 = GeneratedColumn<int>(
    'reward_image_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardCount2Meta = const VerificationMeta(
    'rewardCount2',
  );
  @override
  late final GeneratedColumn<int> rewardCount2 = GeneratedColumn<int>(
    'reward_count_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardImage3Meta = const VerificationMeta(
    'rewardImage3',
  );
  @override
  late final GeneratedColumn<int> rewardImage3 = GeneratedColumn<int>(
    'reward_image_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardCount3Meta = const VerificationMeta(
    'rewardCount3',
  );
  @override
  late final GeneratedColumn<int> rewardCount3 = GeneratedColumn<int>(
    'reward_count_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardImage4Meta = const VerificationMeta(
    'rewardImage4',
  );
  @override
  late final GeneratedColumn<int> rewardImage4 = GeneratedColumn<int>(
    'reward_image_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardCount4Meta = const VerificationMeta(
    'rewardCount4',
  );
  @override
  late final GeneratedColumn<int> rewardCount4 = GeneratedColumn<int>(
    'reward_count_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardImage5Meta = const VerificationMeta(
    'rewardImage5',
  );
  @override
  late final GeneratedColumn<int> rewardImage5 = GeneratedColumn<int>(
    'reward_image_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rewardCount5Meta = const VerificationMeta(
    'rewardCount5',
  );
  @override
  late final GeneratedColumn<int> rewardCount5 = GeneratedColumn<int>(
    'reward_count_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _backgroundMeta = const VerificationMeta(
    'background',
  );
  @override
  late final GeneratedColumn<int> background = GeneratedColumn<int>(
    'background',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bgPositionMeta = const VerificationMeta(
    'bgPosition',
  );
  @override
  late final GeneratedColumn<int> bgPosition = GeneratedColumn<int>(
    'bg_position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waveGroupIdMeta = const VerificationMeta(
    'waveGroupId',
  );
  @override
  late final GeneratedColumn<int> waveGroupId = GeneratedColumn<int>(
    'wave_group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyPositionX1Meta = const VerificationMeta(
    'enemyPositionX1',
  );
  @override
  late final GeneratedColumn<int> enemyPositionX1 = GeneratedColumn<int>(
    'enemy_position_x_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyLocalPositionY1Meta =
      const VerificationMeta('enemyLocalPositionY1');
  @override
  late final GeneratedColumn<int> enemyLocalPositionY1 = GeneratedColumn<int>(
    'enemy_local_position_y_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemySize1Meta = const VerificationMeta(
    'enemySize1',
  );
  @override
  late final GeneratedColumn<double> enemySize1 = GeneratedColumn<double>(
    'enemy_size_1',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyPositionX2Meta = const VerificationMeta(
    'enemyPositionX2',
  );
  @override
  late final GeneratedColumn<int> enemyPositionX2 = GeneratedColumn<int>(
    'enemy_position_x_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyLocalPositionY2Meta =
      const VerificationMeta('enemyLocalPositionY2');
  @override
  late final GeneratedColumn<int> enemyLocalPositionY2 = GeneratedColumn<int>(
    'enemy_local_position_y_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemySize2Meta = const VerificationMeta(
    'enemySize2',
  );
  @override
  late final GeneratedColumn<double> enemySize2 = GeneratedColumn<double>(
    'enemy_size_2',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyPositionX3Meta = const VerificationMeta(
    'enemyPositionX3',
  );
  @override
  late final GeneratedColumn<int> enemyPositionX3 = GeneratedColumn<int>(
    'enemy_position_x_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyLocalPositionY3Meta =
      const VerificationMeta('enemyLocalPositionY3');
  @override
  late final GeneratedColumn<int> enemyLocalPositionY3 = GeneratedColumn<int>(
    'enemy_local_position_y_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemySize3Meta = const VerificationMeta(
    'enemySize3',
  );
  @override
  late final GeneratedColumn<double> enemySize3 = GeneratedColumn<double>(
    'enemy_size_3',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyPositionX4Meta = const VerificationMeta(
    'enemyPositionX4',
  );
  @override
  late final GeneratedColumn<int> enemyPositionX4 = GeneratedColumn<int>(
    'enemy_position_x_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyLocalPositionY4Meta =
      const VerificationMeta('enemyLocalPositionY4');
  @override
  late final GeneratedColumn<int> enemyLocalPositionY4 = GeneratedColumn<int>(
    'enemy_local_position_y_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemySize4Meta = const VerificationMeta(
    'enemySize4',
  );
  @override
  late final GeneratedColumn<double> enemySize4 = GeneratedColumn<double>(
    'enemy_size_4',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyPositionX5Meta = const VerificationMeta(
    'enemyPositionX5',
  );
  @override
  late final GeneratedColumn<int> enemyPositionX5 = GeneratedColumn<int>(
    'enemy_position_x_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemyLocalPositionY5Meta =
      const VerificationMeta('enemyLocalPositionY5');
  @override
  late final GeneratedColumn<int> enemyLocalPositionY5 = GeneratedColumn<int>(
    'enemy_local_position_y_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enemySize5Meta = const VerificationMeta(
    'enemySize5',
  );
  @override
  late final GeneratedColumn<double> enemySize5 = GeneratedColumn<double>(
    'enemy_size_5',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waveBgmMeta = const VerificationMeta(
    'waveBgm',
  );
  @override
  late final GeneratedColumn<String> waveBgm = GeneratedColumn<String>(
    'wave_bgm',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    rarity6QuestId,
    unitId,
    questName,
    limitTime,
    recommendedLevel,
    rewardGroupId,
    treasureType,
    rewardImage1,
    rewardCount1,
    rewardImage2,
    rewardCount2,
    rewardImage3,
    rewardCount3,
    rewardImage4,
    rewardCount4,
    rewardImage5,
    rewardCount5,
    background,
    bgPosition,
    waveGroupId,
    enemyPositionX1,
    enemyLocalPositionY1,
    enemySize1,
    enemyPositionX2,
    enemyLocalPositionY2,
    enemySize2,
    enemyPositionX3,
    enemyLocalPositionY3,
    enemySize3,
    enemyPositionX4,
    enemyLocalPositionY4,
    enemySize4,
    enemyPositionX5,
    enemyLocalPositionY5,
    enemySize5,
    waveBgm,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rarity_6_quest_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rarity6QuestDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rarity_6_quest_id')) {
      context.handle(
        _rarity6QuestIdMeta,
        rarity6QuestId.isAcceptableOrUnknown(
          data['rarity_6_quest_id']!,
          _rarity6QuestIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rarity6QuestIdMeta);
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('quest_name')) {
      context.handle(
        _questNameMeta,
        questName.isAcceptableOrUnknown(data['quest_name']!, _questNameMeta),
      );
    } else if (isInserting) {
      context.missing(_questNameMeta);
    }
    if (data.containsKey('limit_time')) {
      context.handle(
        _limitTimeMeta,
        limitTime.isAcceptableOrUnknown(data['limit_time']!, _limitTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_limitTimeMeta);
    }
    if (data.containsKey('recommended_level')) {
      context.handle(
        _recommendedLevelMeta,
        recommendedLevel.isAcceptableOrUnknown(
          data['recommended_level']!,
          _recommendedLevelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recommendedLevelMeta);
    }
    if (data.containsKey('reward_group_id')) {
      context.handle(
        _rewardGroupIdMeta,
        rewardGroupId.isAcceptableOrUnknown(
          data['reward_group_id']!,
          _rewardGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardGroupIdMeta);
    }
    if (data.containsKey('treasure_type')) {
      context.handle(
        _treasureTypeMeta,
        treasureType.isAcceptableOrUnknown(
          data['treasure_type']!,
          _treasureTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_treasureTypeMeta);
    }
    if (data.containsKey('reward_image_1')) {
      context.handle(
        _rewardImage1Meta,
        rewardImage1.isAcceptableOrUnknown(
          data['reward_image_1']!,
          _rewardImage1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardImage1Meta);
    }
    if (data.containsKey('reward_count_1')) {
      context.handle(
        _rewardCount1Meta,
        rewardCount1.isAcceptableOrUnknown(
          data['reward_count_1']!,
          _rewardCount1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardCount1Meta);
    }
    if (data.containsKey('reward_image_2')) {
      context.handle(
        _rewardImage2Meta,
        rewardImage2.isAcceptableOrUnknown(
          data['reward_image_2']!,
          _rewardImage2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardImage2Meta);
    }
    if (data.containsKey('reward_count_2')) {
      context.handle(
        _rewardCount2Meta,
        rewardCount2.isAcceptableOrUnknown(
          data['reward_count_2']!,
          _rewardCount2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardCount2Meta);
    }
    if (data.containsKey('reward_image_3')) {
      context.handle(
        _rewardImage3Meta,
        rewardImage3.isAcceptableOrUnknown(
          data['reward_image_3']!,
          _rewardImage3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardImage3Meta);
    }
    if (data.containsKey('reward_count_3')) {
      context.handle(
        _rewardCount3Meta,
        rewardCount3.isAcceptableOrUnknown(
          data['reward_count_3']!,
          _rewardCount3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardCount3Meta);
    }
    if (data.containsKey('reward_image_4')) {
      context.handle(
        _rewardImage4Meta,
        rewardImage4.isAcceptableOrUnknown(
          data['reward_image_4']!,
          _rewardImage4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardImage4Meta);
    }
    if (data.containsKey('reward_count_4')) {
      context.handle(
        _rewardCount4Meta,
        rewardCount4.isAcceptableOrUnknown(
          data['reward_count_4']!,
          _rewardCount4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardCount4Meta);
    }
    if (data.containsKey('reward_image_5')) {
      context.handle(
        _rewardImage5Meta,
        rewardImage5.isAcceptableOrUnknown(
          data['reward_image_5']!,
          _rewardImage5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardImage5Meta);
    }
    if (data.containsKey('reward_count_5')) {
      context.handle(
        _rewardCount5Meta,
        rewardCount5.isAcceptableOrUnknown(
          data['reward_count_5']!,
          _rewardCount5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_rewardCount5Meta);
    }
    if (data.containsKey('background')) {
      context.handle(
        _backgroundMeta,
        background.isAcceptableOrUnknown(data['background']!, _backgroundMeta),
      );
    } else if (isInserting) {
      context.missing(_backgroundMeta);
    }
    if (data.containsKey('bg_position')) {
      context.handle(
        _bgPositionMeta,
        bgPosition.isAcceptableOrUnknown(data['bg_position']!, _bgPositionMeta),
      );
    } else if (isInserting) {
      context.missing(_bgPositionMeta);
    }
    if (data.containsKey('wave_group_id')) {
      context.handle(
        _waveGroupIdMeta,
        waveGroupId.isAcceptableOrUnknown(
          data['wave_group_id']!,
          _waveGroupIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_waveGroupIdMeta);
    }
    if (data.containsKey('enemy_position_x_1')) {
      context.handle(
        _enemyPositionX1Meta,
        enemyPositionX1.isAcceptableOrUnknown(
          data['enemy_position_x_1']!,
          _enemyPositionX1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyPositionX1Meta);
    }
    if (data.containsKey('enemy_local_position_y_1')) {
      context.handle(
        _enemyLocalPositionY1Meta,
        enemyLocalPositionY1.isAcceptableOrUnknown(
          data['enemy_local_position_y_1']!,
          _enemyLocalPositionY1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyLocalPositionY1Meta);
    }
    if (data.containsKey('enemy_size_1')) {
      context.handle(
        _enemySize1Meta,
        enemySize1.isAcceptableOrUnknown(
          data['enemy_size_1']!,
          _enemySize1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemySize1Meta);
    }
    if (data.containsKey('enemy_position_x_2')) {
      context.handle(
        _enemyPositionX2Meta,
        enemyPositionX2.isAcceptableOrUnknown(
          data['enemy_position_x_2']!,
          _enemyPositionX2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyPositionX2Meta);
    }
    if (data.containsKey('enemy_local_position_y_2')) {
      context.handle(
        _enemyLocalPositionY2Meta,
        enemyLocalPositionY2.isAcceptableOrUnknown(
          data['enemy_local_position_y_2']!,
          _enemyLocalPositionY2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyLocalPositionY2Meta);
    }
    if (data.containsKey('enemy_size_2')) {
      context.handle(
        _enemySize2Meta,
        enemySize2.isAcceptableOrUnknown(
          data['enemy_size_2']!,
          _enemySize2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemySize2Meta);
    }
    if (data.containsKey('enemy_position_x_3')) {
      context.handle(
        _enemyPositionX3Meta,
        enemyPositionX3.isAcceptableOrUnknown(
          data['enemy_position_x_3']!,
          _enemyPositionX3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyPositionX3Meta);
    }
    if (data.containsKey('enemy_local_position_y_3')) {
      context.handle(
        _enemyLocalPositionY3Meta,
        enemyLocalPositionY3.isAcceptableOrUnknown(
          data['enemy_local_position_y_3']!,
          _enemyLocalPositionY3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyLocalPositionY3Meta);
    }
    if (data.containsKey('enemy_size_3')) {
      context.handle(
        _enemySize3Meta,
        enemySize3.isAcceptableOrUnknown(
          data['enemy_size_3']!,
          _enemySize3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemySize3Meta);
    }
    if (data.containsKey('enemy_position_x_4')) {
      context.handle(
        _enemyPositionX4Meta,
        enemyPositionX4.isAcceptableOrUnknown(
          data['enemy_position_x_4']!,
          _enemyPositionX4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyPositionX4Meta);
    }
    if (data.containsKey('enemy_local_position_y_4')) {
      context.handle(
        _enemyLocalPositionY4Meta,
        enemyLocalPositionY4.isAcceptableOrUnknown(
          data['enemy_local_position_y_4']!,
          _enemyLocalPositionY4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyLocalPositionY4Meta);
    }
    if (data.containsKey('enemy_size_4')) {
      context.handle(
        _enemySize4Meta,
        enemySize4.isAcceptableOrUnknown(
          data['enemy_size_4']!,
          _enemySize4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemySize4Meta);
    }
    if (data.containsKey('enemy_position_x_5')) {
      context.handle(
        _enemyPositionX5Meta,
        enemyPositionX5.isAcceptableOrUnknown(
          data['enemy_position_x_5']!,
          _enemyPositionX5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyPositionX5Meta);
    }
    if (data.containsKey('enemy_local_position_y_5')) {
      context.handle(
        _enemyLocalPositionY5Meta,
        enemyLocalPositionY5.isAcceptableOrUnknown(
          data['enemy_local_position_y_5']!,
          _enemyLocalPositionY5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemyLocalPositionY5Meta);
    }
    if (data.containsKey('enemy_size_5')) {
      context.handle(
        _enemySize5Meta,
        enemySize5.isAcceptableOrUnknown(
          data['enemy_size_5']!,
          _enemySize5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enemySize5Meta);
    }
    if (data.containsKey('wave_bgm')) {
      context.handle(
        _waveBgmMeta,
        waveBgm.isAcceptableOrUnknown(data['wave_bgm']!, _waveBgmMeta),
      );
    } else if (isInserting) {
      context.missing(_waveBgmMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  Rarity6QuestDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rarity6QuestDataData(
      rarity6QuestId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rarity_6_quest_id'],
          )!,
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      questName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}quest_name'],
          )!,
      limitTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}limit_time'],
          )!,
      recommendedLevel:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}recommended_level'],
          )!,
      rewardGroupId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_group_id'],
          )!,
      treasureType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}treasure_type'],
          )!,
      rewardImage1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_image_1'],
          )!,
      rewardCount1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_count_1'],
          )!,
      rewardImage2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_image_2'],
          )!,
      rewardCount2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_count_2'],
          )!,
      rewardImage3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_image_3'],
          )!,
      rewardCount3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_count_3'],
          )!,
      rewardImage4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_image_4'],
          )!,
      rewardCount4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_count_4'],
          )!,
      rewardImage5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_image_5'],
          )!,
      rewardCount5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}reward_count_5'],
          )!,
      background:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}background'],
          )!,
      bgPosition:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}bg_position'],
          )!,
      waveGroupId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}wave_group_id'],
          )!,
      enemyPositionX1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_position_x_1'],
          )!,
      enemyLocalPositionY1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_local_position_y_1'],
          )!,
      enemySize1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}enemy_size_1'],
          )!,
      enemyPositionX2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_position_x_2'],
          )!,
      enemyLocalPositionY2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_local_position_y_2'],
          )!,
      enemySize2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}enemy_size_2'],
          )!,
      enemyPositionX3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_position_x_3'],
          )!,
      enemyLocalPositionY3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_local_position_y_3'],
          )!,
      enemySize3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}enemy_size_3'],
          )!,
      enemyPositionX4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_position_x_4'],
          )!,
      enemyLocalPositionY4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_local_position_y_4'],
          )!,
      enemySize4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}enemy_size_4'],
          )!,
      enemyPositionX5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_position_x_5'],
          )!,
      enemyLocalPositionY5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}enemy_local_position_y_5'],
          )!,
      enemySize5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}enemy_size_5'],
          )!,
      waveBgm:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}wave_bgm'],
          )!,
    );
  }

  @override
  $Rarity6QuestDataTable createAlias(String alias) {
    return $Rarity6QuestDataTable(attachedDatabase, alias);
  }
}

class Rarity6QuestDataData extends DataClass
    implements Insertable<Rarity6QuestDataData> {
  final int rarity6QuestId;
  final int unitId;
  final String questName;
  final int limitTime;
  final int recommendedLevel;
  final int rewardGroupId;
  final int treasureType;
  final int rewardImage1;
  final int rewardCount1;
  final int rewardImage2;
  final int rewardCount2;
  final int rewardImage3;
  final int rewardCount3;
  final int rewardImage4;
  final int rewardCount4;
  final int rewardImage5;
  final int rewardCount5;
  final int background;
  final int bgPosition;
  final int waveGroupId;
  final int enemyPositionX1;
  final int enemyLocalPositionY1;
  final double enemySize1;
  final int enemyPositionX2;
  final int enemyLocalPositionY2;
  final double enemySize2;
  final int enemyPositionX3;
  final int enemyLocalPositionY3;
  final double enemySize3;
  final int enemyPositionX4;
  final int enemyLocalPositionY4;
  final double enemySize4;
  final int enemyPositionX5;
  final int enemyLocalPositionY5;
  final double enemySize5;
  final String waveBgm;
  const Rarity6QuestDataData({
    required this.rarity6QuestId,
    required this.unitId,
    required this.questName,
    required this.limitTime,
    required this.recommendedLevel,
    required this.rewardGroupId,
    required this.treasureType,
    required this.rewardImage1,
    required this.rewardCount1,
    required this.rewardImage2,
    required this.rewardCount2,
    required this.rewardImage3,
    required this.rewardCount3,
    required this.rewardImage4,
    required this.rewardCount4,
    required this.rewardImage5,
    required this.rewardCount5,
    required this.background,
    required this.bgPosition,
    required this.waveGroupId,
    required this.enemyPositionX1,
    required this.enemyLocalPositionY1,
    required this.enemySize1,
    required this.enemyPositionX2,
    required this.enemyLocalPositionY2,
    required this.enemySize2,
    required this.enemyPositionX3,
    required this.enemyLocalPositionY3,
    required this.enemySize3,
    required this.enemyPositionX4,
    required this.enemyLocalPositionY4,
    required this.enemySize4,
    required this.enemyPositionX5,
    required this.enemyLocalPositionY5,
    required this.enemySize5,
    required this.waveBgm,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rarity_6_quest_id'] = Variable<int>(rarity6QuestId);
    map['unit_id'] = Variable<int>(unitId);
    map['quest_name'] = Variable<String>(questName);
    map['limit_time'] = Variable<int>(limitTime);
    map['recommended_level'] = Variable<int>(recommendedLevel);
    map['reward_group_id'] = Variable<int>(rewardGroupId);
    map['treasure_type'] = Variable<int>(treasureType);
    map['reward_image_1'] = Variable<int>(rewardImage1);
    map['reward_count_1'] = Variable<int>(rewardCount1);
    map['reward_image_2'] = Variable<int>(rewardImage2);
    map['reward_count_2'] = Variable<int>(rewardCount2);
    map['reward_image_3'] = Variable<int>(rewardImage3);
    map['reward_count_3'] = Variable<int>(rewardCount3);
    map['reward_image_4'] = Variable<int>(rewardImage4);
    map['reward_count_4'] = Variable<int>(rewardCount4);
    map['reward_image_5'] = Variable<int>(rewardImage5);
    map['reward_count_5'] = Variable<int>(rewardCount5);
    map['background'] = Variable<int>(background);
    map['bg_position'] = Variable<int>(bgPosition);
    map['wave_group_id'] = Variable<int>(waveGroupId);
    map['enemy_position_x_1'] = Variable<int>(enemyPositionX1);
    map['enemy_local_position_y_1'] = Variable<int>(enemyLocalPositionY1);
    map['enemy_size_1'] = Variable<double>(enemySize1);
    map['enemy_position_x_2'] = Variable<int>(enemyPositionX2);
    map['enemy_local_position_y_2'] = Variable<int>(enemyLocalPositionY2);
    map['enemy_size_2'] = Variable<double>(enemySize2);
    map['enemy_position_x_3'] = Variable<int>(enemyPositionX3);
    map['enemy_local_position_y_3'] = Variable<int>(enemyLocalPositionY3);
    map['enemy_size_3'] = Variable<double>(enemySize3);
    map['enemy_position_x_4'] = Variable<int>(enemyPositionX4);
    map['enemy_local_position_y_4'] = Variable<int>(enemyLocalPositionY4);
    map['enemy_size_4'] = Variable<double>(enemySize4);
    map['enemy_position_x_5'] = Variable<int>(enemyPositionX5);
    map['enemy_local_position_y_5'] = Variable<int>(enemyLocalPositionY5);
    map['enemy_size_5'] = Variable<double>(enemySize5);
    map['wave_bgm'] = Variable<String>(waveBgm);
    return map;
  }

  Rarity6QuestDataCompanion toCompanion(bool nullToAbsent) {
    return Rarity6QuestDataCompanion(
      rarity6QuestId: Value(rarity6QuestId),
      unitId: Value(unitId),
      questName: Value(questName),
      limitTime: Value(limitTime),
      recommendedLevel: Value(recommendedLevel),
      rewardGroupId: Value(rewardGroupId),
      treasureType: Value(treasureType),
      rewardImage1: Value(rewardImage1),
      rewardCount1: Value(rewardCount1),
      rewardImage2: Value(rewardImage2),
      rewardCount2: Value(rewardCount2),
      rewardImage3: Value(rewardImage3),
      rewardCount3: Value(rewardCount3),
      rewardImage4: Value(rewardImage4),
      rewardCount4: Value(rewardCount4),
      rewardImage5: Value(rewardImage5),
      rewardCount5: Value(rewardCount5),
      background: Value(background),
      bgPosition: Value(bgPosition),
      waveGroupId: Value(waveGroupId),
      enemyPositionX1: Value(enemyPositionX1),
      enemyLocalPositionY1: Value(enemyLocalPositionY1),
      enemySize1: Value(enemySize1),
      enemyPositionX2: Value(enemyPositionX2),
      enemyLocalPositionY2: Value(enemyLocalPositionY2),
      enemySize2: Value(enemySize2),
      enemyPositionX3: Value(enemyPositionX3),
      enemyLocalPositionY3: Value(enemyLocalPositionY3),
      enemySize3: Value(enemySize3),
      enemyPositionX4: Value(enemyPositionX4),
      enemyLocalPositionY4: Value(enemyLocalPositionY4),
      enemySize4: Value(enemySize4),
      enemyPositionX5: Value(enemyPositionX5),
      enemyLocalPositionY5: Value(enemyLocalPositionY5),
      enemySize5: Value(enemySize5),
      waveBgm: Value(waveBgm),
    );
  }

  factory Rarity6QuestDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rarity6QuestDataData(
      rarity6QuestId: serializer.fromJson<int>(json['rarity6QuestId']),
      unitId: serializer.fromJson<int>(json['unitId']),
      questName: serializer.fromJson<String>(json['questName']),
      limitTime: serializer.fromJson<int>(json['limitTime']),
      recommendedLevel: serializer.fromJson<int>(json['recommendedLevel']),
      rewardGroupId: serializer.fromJson<int>(json['rewardGroupId']),
      treasureType: serializer.fromJson<int>(json['treasureType']),
      rewardImage1: serializer.fromJson<int>(json['rewardImage1']),
      rewardCount1: serializer.fromJson<int>(json['rewardCount1']),
      rewardImage2: serializer.fromJson<int>(json['rewardImage2']),
      rewardCount2: serializer.fromJson<int>(json['rewardCount2']),
      rewardImage3: serializer.fromJson<int>(json['rewardImage3']),
      rewardCount3: serializer.fromJson<int>(json['rewardCount3']),
      rewardImage4: serializer.fromJson<int>(json['rewardImage4']),
      rewardCount4: serializer.fromJson<int>(json['rewardCount4']),
      rewardImage5: serializer.fromJson<int>(json['rewardImage5']),
      rewardCount5: serializer.fromJson<int>(json['rewardCount5']),
      background: serializer.fromJson<int>(json['background']),
      bgPosition: serializer.fromJson<int>(json['bgPosition']),
      waveGroupId: serializer.fromJson<int>(json['waveGroupId']),
      enemyPositionX1: serializer.fromJson<int>(json['enemyPositionX1']),
      enemyLocalPositionY1: serializer.fromJson<int>(
        json['enemyLocalPositionY1'],
      ),
      enemySize1: serializer.fromJson<double>(json['enemySize1']),
      enemyPositionX2: serializer.fromJson<int>(json['enemyPositionX2']),
      enemyLocalPositionY2: serializer.fromJson<int>(
        json['enemyLocalPositionY2'],
      ),
      enemySize2: serializer.fromJson<double>(json['enemySize2']),
      enemyPositionX3: serializer.fromJson<int>(json['enemyPositionX3']),
      enemyLocalPositionY3: serializer.fromJson<int>(
        json['enemyLocalPositionY3'],
      ),
      enemySize3: serializer.fromJson<double>(json['enemySize3']),
      enemyPositionX4: serializer.fromJson<int>(json['enemyPositionX4']),
      enemyLocalPositionY4: serializer.fromJson<int>(
        json['enemyLocalPositionY4'],
      ),
      enemySize4: serializer.fromJson<double>(json['enemySize4']),
      enemyPositionX5: serializer.fromJson<int>(json['enemyPositionX5']),
      enemyLocalPositionY5: serializer.fromJson<int>(
        json['enemyLocalPositionY5'],
      ),
      enemySize5: serializer.fromJson<double>(json['enemySize5']),
      waveBgm: serializer.fromJson<String>(json['waveBgm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'rarity6QuestId': serializer.toJson<int>(rarity6QuestId),
      'unitId': serializer.toJson<int>(unitId),
      'questName': serializer.toJson<String>(questName),
      'limitTime': serializer.toJson<int>(limitTime),
      'recommendedLevel': serializer.toJson<int>(recommendedLevel),
      'rewardGroupId': serializer.toJson<int>(rewardGroupId),
      'treasureType': serializer.toJson<int>(treasureType),
      'rewardImage1': serializer.toJson<int>(rewardImage1),
      'rewardCount1': serializer.toJson<int>(rewardCount1),
      'rewardImage2': serializer.toJson<int>(rewardImage2),
      'rewardCount2': serializer.toJson<int>(rewardCount2),
      'rewardImage3': serializer.toJson<int>(rewardImage3),
      'rewardCount3': serializer.toJson<int>(rewardCount3),
      'rewardImage4': serializer.toJson<int>(rewardImage4),
      'rewardCount4': serializer.toJson<int>(rewardCount4),
      'rewardImage5': serializer.toJson<int>(rewardImage5),
      'rewardCount5': serializer.toJson<int>(rewardCount5),
      'background': serializer.toJson<int>(background),
      'bgPosition': serializer.toJson<int>(bgPosition),
      'waveGroupId': serializer.toJson<int>(waveGroupId),
      'enemyPositionX1': serializer.toJson<int>(enemyPositionX1),
      'enemyLocalPositionY1': serializer.toJson<int>(enemyLocalPositionY1),
      'enemySize1': serializer.toJson<double>(enemySize1),
      'enemyPositionX2': serializer.toJson<int>(enemyPositionX2),
      'enemyLocalPositionY2': serializer.toJson<int>(enemyLocalPositionY2),
      'enemySize2': serializer.toJson<double>(enemySize2),
      'enemyPositionX3': serializer.toJson<int>(enemyPositionX3),
      'enemyLocalPositionY3': serializer.toJson<int>(enemyLocalPositionY3),
      'enemySize3': serializer.toJson<double>(enemySize3),
      'enemyPositionX4': serializer.toJson<int>(enemyPositionX4),
      'enemyLocalPositionY4': serializer.toJson<int>(enemyLocalPositionY4),
      'enemySize4': serializer.toJson<double>(enemySize4),
      'enemyPositionX5': serializer.toJson<int>(enemyPositionX5),
      'enemyLocalPositionY5': serializer.toJson<int>(enemyLocalPositionY5),
      'enemySize5': serializer.toJson<double>(enemySize5),
      'waveBgm': serializer.toJson<String>(waveBgm),
    };
  }

  Rarity6QuestDataData copyWith({
    int? rarity6QuestId,
    int? unitId,
    String? questName,
    int? limitTime,
    int? recommendedLevel,
    int? rewardGroupId,
    int? treasureType,
    int? rewardImage1,
    int? rewardCount1,
    int? rewardImage2,
    int? rewardCount2,
    int? rewardImage3,
    int? rewardCount3,
    int? rewardImage4,
    int? rewardCount4,
    int? rewardImage5,
    int? rewardCount5,
    int? background,
    int? bgPosition,
    int? waveGroupId,
    int? enemyPositionX1,
    int? enemyLocalPositionY1,
    double? enemySize1,
    int? enemyPositionX2,
    int? enemyLocalPositionY2,
    double? enemySize2,
    int? enemyPositionX3,
    int? enemyLocalPositionY3,
    double? enemySize3,
    int? enemyPositionX4,
    int? enemyLocalPositionY4,
    double? enemySize4,
    int? enemyPositionX5,
    int? enemyLocalPositionY5,
    double? enemySize5,
    String? waveBgm,
  }) => Rarity6QuestDataData(
    rarity6QuestId: rarity6QuestId ?? this.rarity6QuestId,
    unitId: unitId ?? this.unitId,
    questName: questName ?? this.questName,
    limitTime: limitTime ?? this.limitTime,
    recommendedLevel: recommendedLevel ?? this.recommendedLevel,
    rewardGroupId: rewardGroupId ?? this.rewardGroupId,
    treasureType: treasureType ?? this.treasureType,
    rewardImage1: rewardImage1 ?? this.rewardImage1,
    rewardCount1: rewardCount1 ?? this.rewardCount1,
    rewardImage2: rewardImage2 ?? this.rewardImage2,
    rewardCount2: rewardCount2 ?? this.rewardCount2,
    rewardImage3: rewardImage3 ?? this.rewardImage3,
    rewardCount3: rewardCount3 ?? this.rewardCount3,
    rewardImage4: rewardImage4 ?? this.rewardImage4,
    rewardCount4: rewardCount4 ?? this.rewardCount4,
    rewardImage5: rewardImage5 ?? this.rewardImage5,
    rewardCount5: rewardCount5 ?? this.rewardCount5,
    background: background ?? this.background,
    bgPosition: bgPosition ?? this.bgPosition,
    waveGroupId: waveGroupId ?? this.waveGroupId,
    enemyPositionX1: enemyPositionX1 ?? this.enemyPositionX1,
    enemyLocalPositionY1: enemyLocalPositionY1 ?? this.enemyLocalPositionY1,
    enemySize1: enemySize1 ?? this.enemySize1,
    enemyPositionX2: enemyPositionX2 ?? this.enemyPositionX2,
    enemyLocalPositionY2: enemyLocalPositionY2 ?? this.enemyLocalPositionY2,
    enemySize2: enemySize2 ?? this.enemySize2,
    enemyPositionX3: enemyPositionX3 ?? this.enemyPositionX3,
    enemyLocalPositionY3: enemyLocalPositionY3 ?? this.enemyLocalPositionY3,
    enemySize3: enemySize3 ?? this.enemySize3,
    enemyPositionX4: enemyPositionX4 ?? this.enemyPositionX4,
    enemyLocalPositionY4: enemyLocalPositionY4 ?? this.enemyLocalPositionY4,
    enemySize4: enemySize4 ?? this.enemySize4,
    enemyPositionX5: enemyPositionX5 ?? this.enemyPositionX5,
    enemyLocalPositionY5: enemyLocalPositionY5 ?? this.enemyLocalPositionY5,
    enemySize5: enemySize5 ?? this.enemySize5,
    waveBgm: waveBgm ?? this.waveBgm,
  );
  Rarity6QuestDataData copyWithCompanion(Rarity6QuestDataCompanion data) {
    return Rarity6QuestDataData(
      rarity6QuestId:
          data.rarity6QuestId.present
              ? data.rarity6QuestId.value
              : this.rarity6QuestId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      questName: data.questName.present ? data.questName.value : this.questName,
      limitTime: data.limitTime.present ? data.limitTime.value : this.limitTime,
      recommendedLevel:
          data.recommendedLevel.present
              ? data.recommendedLevel.value
              : this.recommendedLevel,
      rewardGroupId:
          data.rewardGroupId.present
              ? data.rewardGroupId.value
              : this.rewardGroupId,
      treasureType:
          data.treasureType.present
              ? data.treasureType.value
              : this.treasureType,
      rewardImage1:
          data.rewardImage1.present
              ? data.rewardImage1.value
              : this.rewardImage1,
      rewardCount1:
          data.rewardCount1.present
              ? data.rewardCount1.value
              : this.rewardCount1,
      rewardImage2:
          data.rewardImage2.present
              ? data.rewardImage2.value
              : this.rewardImage2,
      rewardCount2:
          data.rewardCount2.present
              ? data.rewardCount2.value
              : this.rewardCount2,
      rewardImage3:
          data.rewardImage3.present
              ? data.rewardImage3.value
              : this.rewardImage3,
      rewardCount3:
          data.rewardCount3.present
              ? data.rewardCount3.value
              : this.rewardCount3,
      rewardImage4:
          data.rewardImage4.present
              ? data.rewardImage4.value
              : this.rewardImage4,
      rewardCount4:
          data.rewardCount4.present
              ? data.rewardCount4.value
              : this.rewardCount4,
      rewardImage5:
          data.rewardImage5.present
              ? data.rewardImage5.value
              : this.rewardImage5,
      rewardCount5:
          data.rewardCount5.present
              ? data.rewardCount5.value
              : this.rewardCount5,
      background:
          data.background.present ? data.background.value : this.background,
      bgPosition:
          data.bgPosition.present ? data.bgPosition.value : this.bgPosition,
      waveGroupId:
          data.waveGroupId.present ? data.waveGroupId.value : this.waveGroupId,
      enemyPositionX1:
          data.enemyPositionX1.present
              ? data.enemyPositionX1.value
              : this.enemyPositionX1,
      enemyLocalPositionY1:
          data.enemyLocalPositionY1.present
              ? data.enemyLocalPositionY1.value
              : this.enemyLocalPositionY1,
      enemySize1:
          data.enemySize1.present ? data.enemySize1.value : this.enemySize1,
      enemyPositionX2:
          data.enemyPositionX2.present
              ? data.enemyPositionX2.value
              : this.enemyPositionX2,
      enemyLocalPositionY2:
          data.enemyLocalPositionY2.present
              ? data.enemyLocalPositionY2.value
              : this.enemyLocalPositionY2,
      enemySize2:
          data.enemySize2.present ? data.enemySize2.value : this.enemySize2,
      enemyPositionX3:
          data.enemyPositionX3.present
              ? data.enemyPositionX3.value
              : this.enemyPositionX3,
      enemyLocalPositionY3:
          data.enemyLocalPositionY3.present
              ? data.enemyLocalPositionY3.value
              : this.enemyLocalPositionY3,
      enemySize3:
          data.enemySize3.present ? data.enemySize3.value : this.enemySize3,
      enemyPositionX4:
          data.enemyPositionX4.present
              ? data.enemyPositionX4.value
              : this.enemyPositionX4,
      enemyLocalPositionY4:
          data.enemyLocalPositionY4.present
              ? data.enemyLocalPositionY4.value
              : this.enemyLocalPositionY4,
      enemySize4:
          data.enemySize4.present ? data.enemySize4.value : this.enemySize4,
      enemyPositionX5:
          data.enemyPositionX5.present
              ? data.enemyPositionX5.value
              : this.enemyPositionX5,
      enemyLocalPositionY5:
          data.enemyLocalPositionY5.present
              ? data.enemyLocalPositionY5.value
              : this.enemyLocalPositionY5,
      enemySize5:
          data.enemySize5.present ? data.enemySize5.value : this.enemySize5,
      waveBgm: data.waveBgm.present ? data.waveBgm.value : this.waveBgm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rarity6QuestDataData(')
          ..write('rarity6QuestId: $rarity6QuestId, ')
          ..write('unitId: $unitId, ')
          ..write('questName: $questName, ')
          ..write('limitTime: $limitTime, ')
          ..write('recommendedLevel: $recommendedLevel, ')
          ..write('rewardGroupId: $rewardGroupId, ')
          ..write('treasureType: $treasureType, ')
          ..write('rewardImage1: $rewardImage1, ')
          ..write('rewardCount1: $rewardCount1, ')
          ..write('rewardImage2: $rewardImage2, ')
          ..write('rewardCount2: $rewardCount2, ')
          ..write('rewardImage3: $rewardImage3, ')
          ..write('rewardCount3: $rewardCount3, ')
          ..write('rewardImage4: $rewardImage4, ')
          ..write('rewardCount4: $rewardCount4, ')
          ..write('rewardImage5: $rewardImage5, ')
          ..write('rewardCount5: $rewardCount5, ')
          ..write('background: $background, ')
          ..write('bgPosition: $bgPosition, ')
          ..write('waveGroupId: $waveGroupId, ')
          ..write('enemyPositionX1: $enemyPositionX1, ')
          ..write('enemyLocalPositionY1: $enemyLocalPositionY1, ')
          ..write('enemySize1: $enemySize1, ')
          ..write('enemyPositionX2: $enemyPositionX2, ')
          ..write('enemyLocalPositionY2: $enemyLocalPositionY2, ')
          ..write('enemySize2: $enemySize2, ')
          ..write('enemyPositionX3: $enemyPositionX3, ')
          ..write('enemyLocalPositionY3: $enemyLocalPositionY3, ')
          ..write('enemySize3: $enemySize3, ')
          ..write('enemyPositionX4: $enemyPositionX4, ')
          ..write('enemyLocalPositionY4: $enemyLocalPositionY4, ')
          ..write('enemySize4: $enemySize4, ')
          ..write('enemyPositionX5: $enemyPositionX5, ')
          ..write('enemyLocalPositionY5: $enemyLocalPositionY5, ')
          ..write('enemySize5: $enemySize5, ')
          ..write('waveBgm: $waveBgm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    rarity6QuestId,
    unitId,
    questName,
    limitTime,
    recommendedLevel,
    rewardGroupId,
    treasureType,
    rewardImage1,
    rewardCount1,
    rewardImage2,
    rewardCount2,
    rewardImage3,
    rewardCount3,
    rewardImage4,
    rewardCount4,
    rewardImage5,
    rewardCount5,
    background,
    bgPosition,
    waveGroupId,
    enemyPositionX1,
    enemyLocalPositionY1,
    enemySize1,
    enemyPositionX2,
    enemyLocalPositionY2,
    enemySize2,
    enemyPositionX3,
    enemyLocalPositionY3,
    enemySize3,
    enemyPositionX4,
    enemyLocalPositionY4,
    enemySize4,
    enemyPositionX5,
    enemyLocalPositionY5,
    enemySize5,
    waveBgm,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rarity6QuestDataData &&
          other.rarity6QuestId == this.rarity6QuestId &&
          other.unitId == this.unitId &&
          other.questName == this.questName &&
          other.limitTime == this.limitTime &&
          other.recommendedLevel == this.recommendedLevel &&
          other.rewardGroupId == this.rewardGroupId &&
          other.treasureType == this.treasureType &&
          other.rewardImage1 == this.rewardImage1 &&
          other.rewardCount1 == this.rewardCount1 &&
          other.rewardImage2 == this.rewardImage2 &&
          other.rewardCount2 == this.rewardCount2 &&
          other.rewardImage3 == this.rewardImage3 &&
          other.rewardCount3 == this.rewardCount3 &&
          other.rewardImage4 == this.rewardImage4 &&
          other.rewardCount4 == this.rewardCount4 &&
          other.rewardImage5 == this.rewardImage5 &&
          other.rewardCount5 == this.rewardCount5 &&
          other.background == this.background &&
          other.bgPosition == this.bgPosition &&
          other.waveGroupId == this.waveGroupId &&
          other.enemyPositionX1 == this.enemyPositionX1 &&
          other.enemyLocalPositionY1 == this.enemyLocalPositionY1 &&
          other.enemySize1 == this.enemySize1 &&
          other.enemyPositionX2 == this.enemyPositionX2 &&
          other.enemyLocalPositionY2 == this.enemyLocalPositionY2 &&
          other.enemySize2 == this.enemySize2 &&
          other.enemyPositionX3 == this.enemyPositionX3 &&
          other.enemyLocalPositionY3 == this.enemyLocalPositionY3 &&
          other.enemySize3 == this.enemySize3 &&
          other.enemyPositionX4 == this.enemyPositionX4 &&
          other.enemyLocalPositionY4 == this.enemyLocalPositionY4 &&
          other.enemySize4 == this.enemySize4 &&
          other.enemyPositionX5 == this.enemyPositionX5 &&
          other.enemyLocalPositionY5 == this.enemyLocalPositionY5 &&
          other.enemySize5 == this.enemySize5 &&
          other.waveBgm == this.waveBgm);
}

class Rarity6QuestDataCompanion extends UpdateCompanion<Rarity6QuestDataData> {
  final Value<int> rarity6QuestId;
  final Value<int> unitId;
  final Value<String> questName;
  final Value<int> limitTime;
  final Value<int> recommendedLevel;
  final Value<int> rewardGroupId;
  final Value<int> treasureType;
  final Value<int> rewardImage1;
  final Value<int> rewardCount1;
  final Value<int> rewardImage2;
  final Value<int> rewardCount2;
  final Value<int> rewardImage3;
  final Value<int> rewardCount3;
  final Value<int> rewardImage4;
  final Value<int> rewardCount4;
  final Value<int> rewardImage5;
  final Value<int> rewardCount5;
  final Value<int> background;
  final Value<int> bgPosition;
  final Value<int> waveGroupId;
  final Value<int> enemyPositionX1;
  final Value<int> enemyLocalPositionY1;
  final Value<double> enemySize1;
  final Value<int> enemyPositionX2;
  final Value<int> enemyLocalPositionY2;
  final Value<double> enemySize2;
  final Value<int> enemyPositionX3;
  final Value<int> enemyLocalPositionY3;
  final Value<double> enemySize3;
  final Value<int> enemyPositionX4;
  final Value<int> enemyLocalPositionY4;
  final Value<double> enemySize4;
  final Value<int> enemyPositionX5;
  final Value<int> enemyLocalPositionY5;
  final Value<double> enemySize5;
  final Value<String> waveBgm;
  const Rarity6QuestDataCompanion({
    this.rarity6QuestId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.questName = const Value.absent(),
    this.limitTime = const Value.absent(),
    this.recommendedLevel = const Value.absent(),
    this.rewardGroupId = const Value.absent(),
    this.treasureType = const Value.absent(),
    this.rewardImage1 = const Value.absent(),
    this.rewardCount1 = const Value.absent(),
    this.rewardImage2 = const Value.absent(),
    this.rewardCount2 = const Value.absent(),
    this.rewardImage3 = const Value.absent(),
    this.rewardCount3 = const Value.absent(),
    this.rewardImage4 = const Value.absent(),
    this.rewardCount4 = const Value.absent(),
    this.rewardImage5 = const Value.absent(),
    this.rewardCount5 = const Value.absent(),
    this.background = const Value.absent(),
    this.bgPosition = const Value.absent(),
    this.waveGroupId = const Value.absent(),
    this.enemyPositionX1 = const Value.absent(),
    this.enemyLocalPositionY1 = const Value.absent(),
    this.enemySize1 = const Value.absent(),
    this.enemyPositionX2 = const Value.absent(),
    this.enemyLocalPositionY2 = const Value.absent(),
    this.enemySize2 = const Value.absent(),
    this.enemyPositionX3 = const Value.absent(),
    this.enemyLocalPositionY3 = const Value.absent(),
    this.enemySize3 = const Value.absent(),
    this.enemyPositionX4 = const Value.absent(),
    this.enemyLocalPositionY4 = const Value.absent(),
    this.enemySize4 = const Value.absent(),
    this.enemyPositionX5 = const Value.absent(),
    this.enemyLocalPositionY5 = const Value.absent(),
    this.enemySize5 = const Value.absent(),
    this.waveBgm = const Value.absent(),
  });
  Rarity6QuestDataCompanion.insert({
    required int rarity6QuestId,
    this.unitId = const Value.absent(),
    required String questName,
    required int limitTime,
    required int recommendedLevel,
    required int rewardGroupId,
    required int treasureType,
    required int rewardImage1,
    required int rewardCount1,
    required int rewardImage2,
    required int rewardCount2,
    required int rewardImage3,
    required int rewardCount3,
    required int rewardImage4,
    required int rewardCount4,
    required int rewardImage5,
    required int rewardCount5,
    required int background,
    required int bgPosition,
    required int waveGroupId,
    required int enemyPositionX1,
    required int enemyLocalPositionY1,
    required double enemySize1,
    required int enemyPositionX2,
    required int enemyLocalPositionY2,
    required double enemySize2,
    required int enemyPositionX3,
    required int enemyLocalPositionY3,
    required double enemySize3,
    required int enemyPositionX4,
    required int enemyLocalPositionY4,
    required double enemySize4,
    required int enemyPositionX5,
    required int enemyLocalPositionY5,
    required double enemySize5,
    required String waveBgm,
  }) : rarity6QuestId = Value(rarity6QuestId),
       questName = Value(questName),
       limitTime = Value(limitTime),
       recommendedLevel = Value(recommendedLevel),
       rewardGroupId = Value(rewardGroupId),
       treasureType = Value(treasureType),
       rewardImage1 = Value(rewardImage1),
       rewardCount1 = Value(rewardCount1),
       rewardImage2 = Value(rewardImage2),
       rewardCount2 = Value(rewardCount2),
       rewardImage3 = Value(rewardImage3),
       rewardCount3 = Value(rewardCount3),
       rewardImage4 = Value(rewardImage4),
       rewardCount4 = Value(rewardCount4),
       rewardImage5 = Value(rewardImage5),
       rewardCount5 = Value(rewardCount5),
       background = Value(background),
       bgPosition = Value(bgPosition),
       waveGroupId = Value(waveGroupId),
       enemyPositionX1 = Value(enemyPositionX1),
       enemyLocalPositionY1 = Value(enemyLocalPositionY1),
       enemySize1 = Value(enemySize1),
       enemyPositionX2 = Value(enemyPositionX2),
       enemyLocalPositionY2 = Value(enemyLocalPositionY2),
       enemySize2 = Value(enemySize2),
       enemyPositionX3 = Value(enemyPositionX3),
       enemyLocalPositionY3 = Value(enemyLocalPositionY3),
       enemySize3 = Value(enemySize3),
       enemyPositionX4 = Value(enemyPositionX4),
       enemyLocalPositionY4 = Value(enemyLocalPositionY4),
       enemySize4 = Value(enemySize4),
       enemyPositionX5 = Value(enemyPositionX5),
       enemyLocalPositionY5 = Value(enemyLocalPositionY5),
       enemySize5 = Value(enemySize5),
       waveBgm = Value(waveBgm);
  static Insertable<Rarity6QuestDataData> custom({
    Expression<int>? rarity6QuestId,
    Expression<int>? unitId,
    Expression<String>? questName,
    Expression<int>? limitTime,
    Expression<int>? recommendedLevel,
    Expression<int>? rewardGroupId,
    Expression<int>? treasureType,
    Expression<int>? rewardImage1,
    Expression<int>? rewardCount1,
    Expression<int>? rewardImage2,
    Expression<int>? rewardCount2,
    Expression<int>? rewardImage3,
    Expression<int>? rewardCount3,
    Expression<int>? rewardImage4,
    Expression<int>? rewardCount4,
    Expression<int>? rewardImage5,
    Expression<int>? rewardCount5,
    Expression<int>? background,
    Expression<int>? bgPosition,
    Expression<int>? waveGroupId,
    Expression<int>? enemyPositionX1,
    Expression<int>? enemyLocalPositionY1,
    Expression<double>? enemySize1,
    Expression<int>? enemyPositionX2,
    Expression<int>? enemyLocalPositionY2,
    Expression<double>? enemySize2,
    Expression<int>? enemyPositionX3,
    Expression<int>? enemyLocalPositionY3,
    Expression<double>? enemySize3,
    Expression<int>? enemyPositionX4,
    Expression<int>? enemyLocalPositionY4,
    Expression<double>? enemySize4,
    Expression<int>? enemyPositionX5,
    Expression<int>? enemyLocalPositionY5,
    Expression<double>? enemySize5,
    Expression<String>? waveBgm,
  }) {
    return RawValuesInsertable({
      if (rarity6QuestId != null) 'rarity_6_quest_id': rarity6QuestId,
      if (unitId != null) 'unit_id': unitId,
      if (questName != null) 'quest_name': questName,
      if (limitTime != null) 'limit_time': limitTime,
      if (recommendedLevel != null) 'recommended_level': recommendedLevel,
      if (rewardGroupId != null) 'reward_group_id': rewardGroupId,
      if (treasureType != null) 'treasure_type': treasureType,
      if (rewardImage1 != null) 'reward_image_1': rewardImage1,
      if (rewardCount1 != null) 'reward_count_1': rewardCount1,
      if (rewardImage2 != null) 'reward_image_2': rewardImage2,
      if (rewardCount2 != null) 'reward_count_2': rewardCount2,
      if (rewardImage3 != null) 'reward_image_3': rewardImage3,
      if (rewardCount3 != null) 'reward_count_3': rewardCount3,
      if (rewardImage4 != null) 'reward_image_4': rewardImage4,
      if (rewardCount4 != null) 'reward_count_4': rewardCount4,
      if (rewardImage5 != null) 'reward_image_5': rewardImage5,
      if (rewardCount5 != null) 'reward_count_5': rewardCount5,
      if (background != null) 'background': background,
      if (bgPosition != null) 'bg_position': bgPosition,
      if (waveGroupId != null) 'wave_group_id': waveGroupId,
      if (enemyPositionX1 != null) 'enemy_position_x_1': enemyPositionX1,
      if (enemyLocalPositionY1 != null)
        'enemy_local_position_y_1': enemyLocalPositionY1,
      if (enemySize1 != null) 'enemy_size_1': enemySize1,
      if (enemyPositionX2 != null) 'enemy_position_x_2': enemyPositionX2,
      if (enemyLocalPositionY2 != null)
        'enemy_local_position_y_2': enemyLocalPositionY2,
      if (enemySize2 != null) 'enemy_size_2': enemySize2,
      if (enemyPositionX3 != null) 'enemy_position_x_3': enemyPositionX3,
      if (enemyLocalPositionY3 != null)
        'enemy_local_position_y_3': enemyLocalPositionY3,
      if (enemySize3 != null) 'enemy_size_3': enemySize3,
      if (enemyPositionX4 != null) 'enemy_position_x_4': enemyPositionX4,
      if (enemyLocalPositionY4 != null)
        'enemy_local_position_y_4': enemyLocalPositionY4,
      if (enemySize4 != null) 'enemy_size_4': enemySize4,
      if (enemyPositionX5 != null) 'enemy_position_x_5': enemyPositionX5,
      if (enemyLocalPositionY5 != null)
        'enemy_local_position_y_5': enemyLocalPositionY5,
      if (enemySize5 != null) 'enemy_size_5': enemySize5,
      if (waveBgm != null) 'wave_bgm': waveBgm,
    });
  }

  Rarity6QuestDataCompanion copyWith({
    Value<int>? rarity6QuestId,
    Value<int>? unitId,
    Value<String>? questName,
    Value<int>? limitTime,
    Value<int>? recommendedLevel,
    Value<int>? rewardGroupId,
    Value<int>? treasureType,
    Value<int>? rewardImage1,
    Value<int>? rewardCount1,
    Value<int>? rewardImage2,
    Value<int>? rewardCount2,
    Value<int>? rewardImage3,
    Value<int>? rewardCount3,
    Value<int>? rewardImage4,
    Value<int>? rewardCount4,
    Value<int>? rewardImage5,
    Value<int>? rewardCount5,
    Value<int>? background,
    Value<int>? bgPosition,
    Value<int>? waveGroupId,
    Value<int>? enemyPositionX1,
    Value<int>? enemyLocalPositionY1,
    Value<double>? enemySize1,
    Value<int>? enemyPositionX2,
    Value<int>? enemyLocalPositionY2,
    Value<double>? enemySize2,
    Value<int>? enemyPositionX3,
    Value<int>? enemyLocalPositionY3,
    Value<double>? enemySize3,
    Value<int>? enemyPositionX4,
    Value<int>? enemyLocalPositionY4,
    Value<double>? enemySize4,
    Value<int>? enemyPositionX5,
    Value<int>? enemyLocalPositionY5,
    Value<double>? enemySize5,
    Value<String>? waveBgm,
  }) {
    return Rarity6QuestDataCompanion(
      rarity6QuestId: rarity6QuestId ?? this.rarity6QuestId,
      unitId: unitId ?? this.unitId,
      questName: questName ?? this.questName,
      limitTime: limitTime ?? this.limitTime,
      recommendedLevel: recommendedLevel ?? this.recommendedLevel,
      rewardGroupId: rewardGroupId ?? this.rewardGroupId,
      treasureType: treasureType ?? this.treasureType,
      rewardImage1: rewardImage1 ?? this.rewardImage1,
      rewardCount1: rewardCount1 ?? this.rewardCount1,
      rewardImage2: rewardImage2 ?? this.rewardImage2,
      rewardCount2: rewardCount2 ?? this.rewardCount2,
      rewardImage3: rewardImage3 ?? this.rewardImage3,
      rewardCount3: rewardCount3 ?? this.rewardCount3,
      rewardImage4: rewardImage4 ?? this.rewardImage4,
      rewardCount4: rewardCount4 ?? this.rewardCount4,
      rewardImage5: rewardImage5 ?? this.rewardImage5,
      rewardCount5: rewardCount5 ?? this.rewardCount5,
      background: background ?? this.background,
      bgPosition: bgPosition ?? this.bgPosition,
      waveGroupId: waveGroupId ?? this.waveGroupId,
      enemyPositionX1: enemyPositionX1 ?? this.enemyPositionX1,
      enemyLocalPositionY1: enemyLocalPositionY1 ?? this.enemyLocalPositionY1,
      enemySize1: enemySize1 ?? this.enemySize1,
      enemyPositionX2: enemyPositionX2 ?? this.enemyPositionX2,
      enemyLocalPositionY2: enemyLocalPositionY2 ?? this.enemyLocalPositionY2,
      enemySize2: enemySize2 ?? this.enemySize2,
      enemyPositionX3: enemyPositionX3 ?? this.enemyPositionX3,
      enemyLocalPositionY3: enemyLocalPositionY3 ?? this.enemyLocalPositionY3,
      enemySize3: enemySize3 ?? this.enemySize3,
      enemyPositionX4: enemyPositionX4 ?? this.enemyPositionX4,
      enemyLocalPositionY4: enemyLocalPositionY4 ?? this.enemyLocalPositionY4,
      enemySize4: enemySize4 ?? this.enemySize4,
      enemyPositionX5: enemyPositionX5 ?? this.enemyPositionX5,
      enemyLocalPositionY5: enemyLocalPositionY5 ?? this.enemyLocalPositionY5,
      enemySize5: enemySize5 ?? this.enemySize5,
      waveBgm: waveBgm ?? this.waveBgm,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (rarity6QuestId.present) {
      map['rarity_6_quest_id'] = Variable<int>(rarity6QuestId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (questName.present) {
      map['quest_name'] = Variable<String>(questName.value);
    }
    if (limitTime.present) {
      map['limit_time'] = Variable<int>(limitTime.value);
    }
    if (recommendedLevel.present) {
      map['recommended_level'] = Variable<int>(recommendedLevel.value);
    }
    if (rewardGroupId.present) {
      map['reward_group_id'] = Variable<int>(rewardGroupId.value);
    }
    if (treasureType.present) {
      map['treasure_type'] = Variable<int>(treasureType.value);
    }
    if (rewardImage1.present) {
      map['reward_image_1'] = Variable<int>(rewardImage1.value);
    }
    if (rewardCount1.present) {
      map['reward_count_1'] = Variable<int>(rewardCount1.value);
    }
    if (rewardImage2.present) {
      map['reward_image_2'] = Variable<int>(rewardImage2.value);
    }
    if (rewardCount2.present) {
      map['reward_count_2'] = Variable<int>(rewardCount2.value);
    }
    if (rewardImage3.present) {
      map['reward_image_3'] = Variable<int>(rewardImage3.value);
    }
    if (rewardCount3.present) {
      map['reward_count_3'] = Variable<int>(rewardCount3.value);
    }
    if (rewardImage4.present) {
      map['reward_image_4'] = Variable<int>(rewardImage4.value);
    }
    if (rewardCount4.present) {
      map['reward_count_4'] = Variable<int>(rewardCount4.value);
    }
    if (rewardImage5.present) {
      map['reward_image_5'] = Variable<int>(rewardImage5.value);
    }
    if (rewardCount5.present) {
      map['reward_count_5'] = Variable<int>(rewardCount5.value);
    }
    if (background.present) {
      map['background'] = Variable<int>(background.value);
    }
    if (bgPosition.present) {
      map['bg_position'] = Variable<int>(bgPosition.value);
    }
    if (waveGroupId.present) {
      map['wave_group_id'] = Variable<int>(waveGroupId.value);
    }
    if (enemyPositionX1.present) {
      map['enemy_position_x_1'] = Variable<int>(enemyPositionX1.value);
    }
    if (enemyLocalPositionY1.present) {
      map['enemy_local_position_y_1'] = Variable<int>(
        enemyLocalPositionY1.value,
      );
    }
    if (enemySize1.present) {
      map['enemy_size_1'] = Variable<double>(enemySize1.value);
    }
    if (enemyPositionX2.present) {
      map['enemy_position_x_2'] = Variable<int>(enemyPositionX2.value);
    }
    if (enemyLocalPositionY2.present) {
      map['enemy_local_position_y_2'] = Variable<int>(
        enemyLocalPositionY2.value,
      );
    }
    if (enemySize2.present) {
      map['enemy_size_2'] = Variable<double>(enemySize2.value);
    }
    if (enemyPositionX3.present) {
      map['enemy_position_x_3'] = Variable<int>(enemyPositionX3.value);
    }
    if (enemyLocalPositionY3.present) {
      map['enemy_local_position_y_3'] = Variable<int>(
        enemyLocalPositionY3.value,
      );
    }
    if (enemySize3.present) {
      map['enemy_size_3'] = Variable<double>(enemySize3.value);
    }
    if (enemyPositionX4.present) {
      map['enemy_position_x_4'] = Variable<int>(enemyPositionX4.value);
    }
    if (enemyLocalPositionY4.present) {
      map['enemy_local_position_y_4'] = Variable<int>(
        enemyLocalPositionY4.value,
      );
    }
    if (enemySize4.present) {
      map['enemy_size_4'] = Variable<double>(enemySize4.value);
    }
    if (enemyPositionX5.present) {
      map['enemy_position_x_5'] = Variable<int>(enemyPositionX5.value);
    }
    if (enemyLocalPositionY5.present) {
      map['enemy_local_position_y_5'] = Variable<int>(
        enemyLocalPositionY5.value,
      );
    }
    if (enemySize5.present) {
      map['enemy_size_5'] = Variable<double>(enemySize5.value);
    }
    if (waveBgm.present) {
      map['wave_bgm'] = Variable<String>(waveBgm.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Rarity6QuestDataCompanion(')
          ..write('rarity6QuestId: $rarity6QuestId, ')
          ..write('unitId: $unitId, ')
          ..write('questName: $questName, ')
          ..write('limitTime: $limitTime, ')
          ..write('recommendedLevel: $recommendedLevel, ')
          ..write('rewardGroupId: $rewardGroupId, ')
          ..write('treasureType: $treasureType, ')
          ..write('rewardImage1: $rewardImage1, ')
          ..write('rewardCount1: $rewardCount1, ')
          ..write('rewardImage2: $rewardImage2, ')
          ..write('rewardCount2: $rewardCount2, ')
          ..write('rewardImage3: $rewardImage3, ')
          ..write('rewardCount3: $rewardCount3, ')
          ..write('rewardImage4: $rewardImage4, ')
          ..write('rewardCount4: $rewardCount4, ')
          ..write('rewardImage5: $rewardImage5, ')
          ..write('rewardCount5: $rewardCount5, ')
          ..write('background: $background, ')
          ..write('bgPosition: $bgPosition, ')
          ..write('waveGroupId: $waveGroupId, ')
          ..write('enemyPositionX1: $enemyPositionX1, ')
          ..write('enemyLocalPositionY1: $enemyLocalPositionY1, ')
          ..write('enemySize1: $enemySize1, ')
          ..write('enemyPositionX2: $enemyPositionX2, ')
          ..write('enemyLocalPositionY2: $enemyLocalPositionY2, ')
          ..write('enemySize2: $enemySize2, ')
          ..write('enemyPositionX3: $enemyPositionX3, ')
          ..write('enemyLocalPositionY3: $enemyLocalPositionY3, ')
          ..write('enemySize3: $enemySize3, ')
          ..write('enemyPositionX4: $enemyPositionX4, ')
          ..write('enemyLocalPositionY4: $enemyLocalPositionY4, ')
          ..write('enemySize4: $enemySize4, ')
          ..write('enemyPositionX5: $enemyPositionX5, ')
          ..write('enemyLocalPositionY5: $enemyLocalPositionY5, ')
          ..write('enemySize5: $enemySize5, ')
          ..write('waveBgm: $waveBgm')
          ..write(')'))
        .toString();
  }
}

class $SkillDataTable extends SkillData
    with TableInfo<$SkillDataTable, SkillDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _skillIdMeta = const VerificationMeta(
    'skillId',
  );
  @override
  late final GeneratedColumn<int> skillId = GeneratedColumn<int>(
    'skill_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillTypeMeta = const VerificationMeta(
    'skillType',
  );
  @override
  late final GeneratedColumn<int> skillType = GeneratedColumn<int>(
    'skill_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillAreaWidthMeta = const VerificationMeta(
    'skillAreaWidth',
  );
  @override
  late final GeneratedColumn<int> skillAreaWidth = GeneratedColumn<int>(
    'skill_area_width',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skillCastTimeMeta = const VerificationMeta(
    'skillCastTime',
  );
  @override
  late final GeneratedColumn<double> skillCastTime = GeneratedColumn<double>(
    'skill_cast_time',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bossUbCoolTimeMeta = const VerificationMeta(
    'bossUbCoolTime',
  );
  @override
  late final GeneratedColumn<double> bossUbCoolTime = GeneratedColumn<double>(
    'boss_ub_cool_time',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _action1Meta = const VerificationMeta(
    'action1',
  );
  @override
  late final GeneratedColumn<int> action1 = GeneratedColumn<int>(
    'action_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action2Meta = const VerificationMeta(
    'action2',
  );
  @override
  late final GeneratedColumn<int> action2 = GeneratedColumn<int>(
    'action_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action3Meta = const VerificationMeta(
    'action3',
  );
  @override
  late final GeneratedColumn<int> action3 = GeneratedColumn<int>(
    'action_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action4Meta = const VerificationMeta(
    'action4',
  );
  @override
  late final GeneratedColumn<int> action4 = GeneratedColumn<int>(
    'action_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action5Meta = const VerificationMeta(
    'action5',
  );
  @override
  late final GeneratedColumn<int> action5 = GeneratedColumn<int>(
    'action_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action6Meta = const VerificationMeta(
    'action6',
  );
  @override
  late final GeneratedColumn<int> action6 = GeneratedColumn<int>(
    'action_6',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action7Meta = const VerificationMeta(
    'action7',
  );
  @override
  late final GeneratedColumn<int> action7 = GeneratedColumn<int>(
    'action_7',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action8Meta = const VerificationMeta(
    'action8',
  );
  @override
  late final GeneratedColumn<int> action8 = GeneratedColumn<int>(
    'action_8',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action9Meta = const VerificationMeta(
    'action9',
  );
  @override
  late final GeneratedColumn<int> action9 = GeneratedColumn<int>(
    'action_9',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _action10Meta = const VerificationMeta(
    'action10',
  );
  @override
  late final GeneratedColumn<int> action10 = GeneratedColumn<int>(
    'action_10',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend1Meta = const VerificationMeta(
    'actionDepend1',
  );
  @override
  late final GeneratedColumn<int> actionDepend1 = GeneratedColumn<int>(
    'depend_action_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend2Meta = const VerificationMeta(
    'actionDepend2',
  );
  @override
  late final GeneratedColumn<int> actionDepend2 = GeneratedColumn<int>(
    'depend_action_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend3Meta = const VerificationMeta(
    'actionDepend3',
  );
  @override
  late final GeneratedColumn<int> actionDepend3 = GeneratedColumn<int>(
    'depend_action_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend4Meta = const VerificationMeta(
    'actionDepend4',
  );
  @override
  late final GeneratedColumn<int> actionDepend4 = GeneratedColumn<int>(
    'depend_action_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend5Meta = const VerificationMeta(
    'actionDepend5',
  );
  @override
  late final GeneratedColumn<int> actionDepend5 = GeneratedColumn<int>(
    'depend_action_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend6Meta = const VerificationMeta(
    'actionDepend6',
  );
  @override
  late final GeneratedColumn<int> actionDepend6 = GeneratedColumn<int>(
    'depend_action_6',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend7Meta = const VerificationMeta(
    'actionDepend7',
  );
  @override
  late final GeneratedColumn<int> actionDepend7 = GeneratedColumn<int>(
    'depend_action_7',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend8Meta = const VerificationMeta(
    'actionDepend8',
  );
  @override
  late final GeneratedColumn<int> actionDepend8 = GeneratedColumn<int>(
    'depend_action_8',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend9Meta = const VerificationMeta(
    'actionDepend9',
  );
  @override
  late final GeneratedColumn<int> actionDepend9 = GeneratedColumn<int>(
    'depend_action_9',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDepend10Meta = const VerificationMeta(
    'actionDepend10',
  );
  @override
  late final GeneratedColumn<int> actionDepend10 = GeneratedColumn<int>(
    'depend_action_10',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconTypeMeta = const VerificationMeta(
    'iconType',
  );
  @override
  late final GeneratedColumn<int> iconType = GeneratedColumn<int>(
    'icon_type',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    skillId,
    name,
    skillType,
    skillAreaWidth,
    skillCastTime,
    bossUbCoolTime,
    action1,
    action2,
    action3,
    action4,
    action5,
    action6,
    action7,
    action8,
    action9,
    action10,
    actionDepend1,
    actionDepend2,
    actionDepend3,
    actionDepend4,
    actionDepend5,
    actionDepend6,
    actionDepend7,
    actionDepend8,
    actionDepend9,
    actionDepend10,
    description,
    iconType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skill_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('skill_id')) {
      context.handle(
        _skillIdMeta,
        skillId.isAcceptableOrUnknown(data['skill_id']!, _skillIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('skill_type')) {
      context.handle(
        _skillTypeMeta,
        skillType.isAcceptableOrUnknown(data['skill_type']!, _skillTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_skillTypeMeta);
    }
    if (data.containsKey('skill_area_width')) {
      context.handle(
        _skillAreaWidthMeta,
        skillAreaWidth.isAcceptableOrUnknown(
          data['skill_area_width']!,
          _skillAreaWidthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_skillAreaWidthMeta);
    }
    if (data.containsKey('skill_cast_time')) {
      context.handle(
        _skillCastTimeMeta,
        skillCastTime.isAcceptableOrUnknown(
          data['skill_cast_time']!,
          _skillCastTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_skillCastTimeMeta);
    }
    if (data.containsKey('boss_ub_cool_time')) {
      context.handle(
        _bossUbCoolTimeMeta,
        bossUbCoolTime.isAcceptableOrUnknown(
          data['boss_ub_cool_time']!,
          _bossUbCoolTimeMeta,
        ),
      );
    }
    if (data.containsKey('action_1')) {
      context.handle(
        _action1Meta,
        action1.isAcceptableOrUnknown(data['action_1']!, _action1Meta),
      );
    } else if (isInserting) {
      context.missing(_action1Meta);
    }
    if (data.containsKey('action_2')) {
      context.handle(
        _action2Meta,
        action2.isAcceptableOrUnknown(data['action_2']!, _action2Meta),
      );
    } else if (isInserting) {
      context.missing(_action2Meta);
    }
    if (data.containsKey('action_3')) {
      context.handle(
        _action3Meta,
        action3.isAcceptableOrUnknown(data['action_3']!, _action3Meta),
      );
    } else if (isInserting) {
      context.missing(_action3Meta);
    }
    if (data.containsKey('action_4')) {
      context.handle(
        _action4Meta,
        action4.isAcceptableOrUnknown(data['action_4']!, _action4Meta),
      );
    } else if (isInserting) {
      context.missing(_action4Meta);
    }
    if (data.containsKey('action_5')) {
      context.handle(
        _action5Meta,
        action5.isAcceptableOrUnknown(data['action_5']!, _action5Meta),
      );
    } else if (isInserting) {
      context.missing(_action5Meta);
    }
    if (data.containsKey('action_6')) {
      context.handle(
        _action6Meta,
        action6.isAcceptableOrUnknown(data['action_6']!, _action6Meta),
      );
    } else if (isInserting) {
      context.missing(_action6Meta);
    }
    if (data.containsKey('action_7')) {
      context.handle(
        _action7Meta,
        action7.isAcceptableOrUnknown(data['action_7']!, _action7Meta),
      );
    } else if (isInserting) {
      context.missing(_action7Meta);
    }
    if (data.containsKey('action_8')) {
      context.handle(
        _action8Meta,
        action8.isAcceptableOrUnknown(data['action_8']!, _action8Meta),
      );
    } else if (isInserting) {
      context.missing(_action8Meta);
    }
    if (data.containsKey('action_9')) {
      context.handle(
        _action9Meta,
        action9.isAcceptableOrUnknown(data['action_9']!, _action9Meta),
      );
    } else if (isInserting) {
      context.missing(_action9Meta);
    }
    if (data.containsKey('action_10')) {
      context.handle(
        _action10Meta,
        action10.isAcceptableOrUnknown(data['action_10']!, _action10Meta),
      );
    } else if (isInserting) {
      context.missing(_action10Meta);
    }
    if (data.containsKey('depend_action_1')) {
      context.handle(
        _actionDepend1Meta,
        actionDepend1.isAcceptableOrUnknown(
          data['depend_action_1']!,
          _actionDepend1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend1Meta);
    }
    if (data.containsKey('depend_action_2')) {
      context.handle(
        _actionDepend2Meta,
        actionDepend2.isAcceptableOrUnknown(
          data['depend_action_2']!,
          _actionDepend2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend2Meta);
    }
    if (data.containsKey('depend_action_3')) {
      context.handle(
        _actionDepend3Meta,
        actionDepend3.isAcceptableOrUnknown(
          data['depend_action_3']!,
          _actionDepend3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend3Meta);
    }
    if (data.containsKey('depend_action_4')) {
      context.handle(
        _actionDepend4Meta,
        actionDepend4.isAcceptableOrUnknown(
          data['depend_action_4']!,
          _actionDepend4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend4Meta);
    }
    if (data.containsKey('depend_action_5')) {
      context.handle(
        _actionDepend5Meta,
        actionDepend5.isAcceptableOrUnknown(
          data['depend_action_5']!,
          _actionDepend5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend5Meta);
    }
    if (data.containsKey('depend_action_6')) {
      context.handle(
        _actionDepend6Meta,
        actionDepend6.isAcceptableOrUnknown(
          data['depend_action_6']!,
          _actionDepend6Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend6Meta);
    }
    if (data.containsKey('depend_action_7')) {
      context.handle(
        _actionDepend7Meta,
        actionDepend7.isAcceptableOrUnknown(
          data['depend_action_7']!,
          _actionDepend7Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend7Meta);
    }
    if (data.containsKey('depend_action_8')) {
      context.handle(
        _actionDepend8Meta,
        actionDepend8.isAcceptableOrUnknown(
          data['depend_action_8']!,
          _actionDepend8Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend8Meta);
    }
    if (data.containsKey('depend_action_9')) {
      context.handle(
        _actionDepend9Meta,
        actionDepend9.isAcceptableOrUnknown(
          data['depend_action_9']!,
          _actionDepend9Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend9Meta);
    }
    if (data.containsKey('depend_action_10')) {
      context.handle(
        _actionDepend10Meta,
        actionDepend10.isAcceptableOrUnknown(
          data['depend_action_10']!,
          _actionDepend10Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDepend10Meta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('icon_type')) {
      context.handle(
        _iconTypeMeta,
        iconType.isAcceptableOrUnknown(data['icon_type']!, _iconTypeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {skillId};
  @override
  SkillDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillDataData(
      skillId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      skillType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill_type'],
          )!,
      skillAreaWidth:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill_area_width'],
          )!,
      skillCastTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}skill_cast_time'],
          )!,
      bossUbCoolTime: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}boss_ub_cool_time'],
      ),
      action1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_1'],
          )!,
      action2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_2'],
          )!,
      action3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_3'],
          )!,
      action4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_4'],
          )!,
      action5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_5'],
          )!,
      action6:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_6'],
          )!,
      action7:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_7'],
          )!,
      action8:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_8'],
          )!,
      action9:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_9'],
          )!,
      action10:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_10'],
          )!,
      actionDepend1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_1'],
          )!,
      actionDepend2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_2'],
          )!,
      actionDepend3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_3'],
          )!,
      actionDepend4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_4'],
          )!,
      actionDepend5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_5'],
          )!,
      actionDepend6:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_6'],
          )!,
      actionDepend7:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_7'],
          )!,
      actionDepend8:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_8'],
          )!,
      actionDepend9:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_9'],
          )!,
      actionDepend10:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}depend_action_10'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      iconType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}icon_type'],
      ),
    );
  }

  @override
  $SkillDataTable createAlias(String alias) {
    return $SkillDataTable(attachedDatabase, alias);
  }
}

class SkillDataData extends DataClass implements Insertable<SkillDataData> {
  final int skillId;
  final String name;
  final int skillType;
  final int skillAreaWidth;
  final double skillCastTime;
  final double? bossUbCoolTime;
  final int action1;
  final int action2;
  final int action3;
  final int action4;
  final int action5;
  final int action6;
  final int action7;
  final int action8;
  final int action9;
  final int action10;
  final int actionDepend1;
  final int actionDepend2;
  final int actionDepend3;
  final int actionDepend4;
  final int actionDepend5;
  final int actionDepend6;
  final int actionDepend7;
  final int actionDepend8;
  final int actionDepend9;
  final int actionDepend10;
  final String? description;
  final int? iconType;
  const SkillDataData({
    required this.skillId,
    required this.name,
    required this.skillType,
    required this.skillAreaWidth,
    required this.skillCastTime,
    this.bossUbCoolTime,
    required this.action1,
    required this.action2,
    required this.action3,
    required this.action4,
    required this.action5,
    required this.action6,
    required this.action7,
    required this.action8,
    required this.action9,
    required this.action10,
    required this.actionDepend1,
    required this.actionDepend2,
    required this.actionDepend3,
    required this.actionDepend4,
    required this.actionDepend5,
    required this.actionDepend6,
    required this.actionDepend7,
    required this.actionDepend8,
    required this.actionDepend9,
    required this.actionDepend10,
    this.description,
    this.iconType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['skill_id'] = Variable<int>(skillId);
    map['name'] = Variable<String>(name);
    map['skill_type'] = Variable<int>(skillType);
    map['skill_area_width'] = Variable<int>(skillAreaWidth);
    map['skill_cast_time'] = Variable<double>(skillCastTime);
    if (!nullToAbsent || bossUbCoolTime != null) {
      map['boss_ub_cool_time'] = Variable<double>(bossUbCoolTime);
    }
    map['action_1'] = Variable<int>(action1);
    map['action_2'] = Variable<int>(action2);
    map['action_3'] = Variable<int>(action3);
    map['action_4'] = Variable<int>(action4);
    map['action_5'] = Variable<int>(action5);
    map['action_6'] = Variable<int>(action6);
    map['action_7'] = Variable<int>(action7);
    map['action_8'] = Variable<int>(action8);
    map['action_9'] = Variable<int>(action9);
    map['action_10'] = Variable<int>(action10);
    map['depend_action_1'] = Variable<int>(actionDepend1);
    map['depend_action_2'] = Variable<int>(actionDepend2);
    map['depend_action_3'] = Variable<int>(actionDepend3);
    map['depend_action_4'] = Variable<int>(actionDepend4);
    map['depend_action_5'] = Variable<int>(actionDepend5);
    map['depend_action_6'] = Variable<int>(actionDepend6);
    map['depend_action_7'] = Variable<int>(actionDepend7);
    map['depend_action_8'] = Variable<int>(actionDepend8);
    map['depend_action_9'] = Variable<int>(actionDepend9);
    map['depend_action_10'] = Variable<int>(actionDepend10);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || iconType != null) {
      map['icon_type'] = Variable<int>(iconType);
    }
    return map;
  }

  SkillDataCompanion toCompanion(bool nullToAbsent) {
    return SkillDataCompanion(
      skillId: Value(skillId),
      name: Value(name),
      skillType: Value(skillType),
      skillAreaWidth: Value(skillAreaWidth),
      skillCastTime: Value(skillCastTime),
      bossUbCoolTime:
          bossUbCoolTime == null && nullToAbsent
              ? const Value.absent()
              : Value(bossUbCoolTime),
      action1: Value(action1),
      action2: Value(action2),
      action3: Value(action3),
      action4: Value(action4),
      action5: Value(action5),
      action6: Value(action6),
      action7: Value(action7),
      action8: Value(action8),
      action9: Value(action9),
      action10: Value(action10),
      actionDepend1: Value(actionDepend1),
      actionDepend2: Value(actionDepend2),
      actionDepend3: Value(actionDepend3),
      actionDepend4: Value(actionDepend4),
      actionDepend5: Value(actionDepend5),
      actionDepend6: Value(actionDepend6),
      actionDepend7: Value(actionDepend7),
      actionDepend8: Value(actionDepend8),
      actionDepend9: Value(actionDepend9),
      actionDepend10: Value(actionDepend10),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      iconType:
          iconType == null && nullToAbsent
              ? const Value.absent()
              : Value(iconType),
    );
  }

  factory SkillDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillDataData(
      skillId: serializer.fromJson<int>(json['skillId']),
      name: serializer.fromJson<String>(json['name']),
      skillType: serializer.fromJson<int>(json['skillType']),
      skillAreaWidth: serializer.fromJson<int>(json['skillAreaWidth']),
      skillCastTime: serializer.fromJson<double>(json['skillCastTime']),
      bossUbCoolTime: serializer.fromJson<double?>(json['bossUbCoolTime']),
      action1: serializer.fromJson<int>(json['action1']),
      action2: serializer.fromJson<int>(json['action2']),
      action3: serializer.fromJson<int>(json['action3']),
      action4: serializer.fromJson<int>(json['action4']),
      action5: serializer.fromJson<int>(json['action5']),
      action6: serializer.fromJson<int>(json['action6']),
      action7: serializer.fromJson<int>(json['action7']),
      action8: serializer.fromJson<int>(json['action8']),
      action9: serializer.fromJson<int>(json['action9']),
      action10: serializer.fromJson<int>(json['action10']),
      actionDepend1: serializer.fromJson<int>(json['actionDepend1']),
      actionDepend2: serializer.fromJson<int>(json['actionDepend2']),
      actionDepend3: serializer.fromJson<int>(json['actionDepend3']),
      actionDepend4: serializer.fromJson<int>(json['actionDepend4']),
      actionDepend5: serializer.fromJson<int>(json['actionDepend5']),
      actionDepend6: serializer.fromJson<int>(json['actionDepend6']),
      actionDepend7: serializer.fromJson<int>(json['actionDepend7']),
      actionDepend8: serializer.fromJson<int>(json['actionDepend8']),
      actionDepend9: serializer.fromJson<int>(json['actionDepend9']),
      actionDepend10: serializer.fromJson<int>(json['actionDepend10']),
      description: serializer.fromJson<String?>(json['description']),
      iconType: serializer.fromJson<int?>(json['iconType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'skillId': serializer.toJson<int>(skillId),
      'name': serializer.toJson<String>(name),
      'skillType': serializer.toJson<int>(skillType),
      'skillAreaWidth': serializer.toJson<int>(skillAreaWidth),
      'skillCastTime': serializer.toJson<double>(skillCastTime),
      'bossUbCoolTime': serializer.toJson<double?>(bossUbCoolTime),
      'action1': serializer.toJson<int>(action1),
      'action2': serializer.toJson<int>(action2),
      'action3': serializer.toJson<int>(action3),
      'action4': serializer.toJson<int>(action4),
      'action5': serializer.toJson<int>(action5),
      'action6': serializer.toJson<int>(action6),
      'action7': serializer.toJson<int>(action7),
      'action8': serializer.toJson<int>(action8),
      'action9': serializer.toJson<int>(action9),
      'action10': serializer.toJson<int>(action10),
      'actionDepend1': serializer.toJson<int>(actionDepend1),
      'actionDepend2': serializer.toJson<int>(actionDepend2),
      'actionDepend3': serializer.toJson<int>(actionDepend3),
      'actionDepend4': serializer.toJson<int>(actionDepend4),
      'actionDepend5': serializer.toJson<int>(actionDepend5),
      'actionDepend6': serializer.toJson<int>(actionDepend6),
      'actionDepend7': serializer.toJson<int>(actionDepend7),
      'actionDepend8': serializer.toJson<int>(actionDepend8),
      'actionDepend9': serializer.toJson<int>(actionDepend9),
      'actionDepend10': serializer.toJson<int>(actionDepend10),
      'description': serializer.toJson<String?>(description),
      'iconType': serializer.toJson<int?>(iconType),
    };
  }

  SkillDataData copyWith({
    int? skillId,
    String? name,
    int? skillType,
    int? skillAreaWidth,
    double? skillCastTime,
    Value<double?> bossUbCoolTime = const Value.absent(),
    int? action1,
    int? action2,
    int? action3,
    int? action4,
    int? action5,
    int? action6,
    int? action7,
    int? action8,
    int? action9,
    int? action10,
    int? actionDepend1,
    int? actionDepend2,
    int? actionDepend3,
    int? actionDepend4,
    int? actionDepend5,
    int? actionDepend6,
    int? actionDepend7,
    int? actionDepend8,
    int? actionDepend9,
    int? actionDepend10,
    Value<String?> description = const Value.absent(),
    Value<int?> iconType = const Value.absent(),
  }) => SkillDataData(
    skillId: skillId ?? this.skillId,
    name: name ?? this.name,
    skillType: skillType ?? this.skillType,
    skillAreaWidth: skillAreaWidth ?? this.skillAreaWidth,
    skillCastTime: skillCastTime ?? this.skillCastTime,
    bossUbCoolTime:
        bossUbCoolTime.present ? bossUbCoolTime.value : this.bossUbCoolTime,
    action1: action1 ?? this.action1,
    action2: action2 ?? this.action2,
    action3: action3 ?? this.action3,
    action4: action4 ?? this.action4,
    action5: action5 ?? this.action5,
    action6: action6 ?? this.action6,
    action7: action7 ?? this.action7,
    action8: action8 ?? this.action8,
    action9: action9 ?? this.action9,
    action10: action10 ?? this.action10,
    actionDepend1: actionDepend1 ?? this.actionDepend1,
    actionDepend2: actionDepend2 ?? this.actionDepend2,
    actionDepend3: actionDepend3 ?? this.actionDepend3,
    actionDepend4: actionDepend4 ?? this.actionDepend4,
    actionDepend5: actionDepend5 ?? this.actionDepend5,
    actionDepend6: actionDepend6 ?? this.actionDepend6,
    actionDepend7: actionDepend7 ?? this.actionDepend7,
    actionDepend8: actionDepend8 ?? this.actionDepend8,
    actionDepend9: actionDepend9 ?? this.actionDepend9,
    actionDepend10: actionDepend10 ?? this.actionDepend10,
    description: description.present ? description.value : this.description,
    iconType: iconType.present ? iconType.value : this.iconType,
  );
  SkillDataData copyWithCompanion(SkillDataCompanion data) {
    return SkillDataData(
      skillId: data.skillId.present ? data.skillId.value : this.skillId,
      name: data.name.present ? data.name.value : this.name,
      skillType: data.skillType.present ? data.skillType.value : this.skillType,
      skillAreaWidth:
          data.skillAreaWidth.present
              ? data.skillAreaWidth.value
              : this.skillAreaWidth,
      skillCastTime:
          data.skillCastTime.present
              ? data.skillCastTime.value
              : this.skillCastTime,
      bossUbCoolTime:
          data.bossUbCoolTime.present
              ? data.bossUbCoolTime.value
              : this.bossUbCoolTime,
      action1: data.action1.present ? data.action1.value : this.action1,
      action2: data.action2.present ? data.action2.value : this.action2,
      action3: data.action3.present ? data.action3.value : this.action3,
      action4: data.action4.present ? data.action4.value : this.action4,
      action5: data.action5.present ? data.action5.value : this.action5,
      action6: data.action6.present ? data.action6.value : this.action6,
      action7: data.action7.present ? data.action7.value : this.action7,
      action8: data.action8.present ? data.action8.value : this.action8,
      action9: data.action9.present ? data.action9.value : this.action9,
      action10: data.action10.present ? data.action10.value : this.action10,
      actionDepend1:
          data.actionDepend1.present
              ? data.actionDepend1.value
              : this.actionDepend1,
      actionDepend2:
          data.actionDepend2.present
              ? data.actionDepend2.value
              : this.actionDepend2,
      actionDepend3:
          data.actionDepend3.present
              ? data.actionDepend3.value
              : this.actionDepend3,
      actionDepend4:
          data.actionDepend4.present
              ? data.actionDepend4.value
              : this.actionDepend4,
      actionDepend5:
          data.actionDepend5.present
              ? data.actionDepend5.value
              : this.actionDepend5,
      actionDepend6:
          data.actionDepend6.present
              ? data.actionDepend6.value
              : this.actionDepend6,
      actionDepend7:
          data.actionDepend7.present
              ? data.actionDepend7.value
              : this.actionDepend7,
      actionDepend8:
          data.actionDepend8.present
              ? data.actionDepend8.value
              : this.actionDepend8,
      actionDepend9:
          data.actionDepend9.present
              ? data.actionDepend9.value
              : this.actionDepend9,
      actionDepend10:
          data.actionDepend10.present
              ? data.actionDepend10.value
              : this.actionDepend10,
      description:
          data.description.present ? data.description.value : this.description,
      iconType: data.iconType.present ? data.iconType.value : this.iconType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillDataData(')
          ..write('skillId: $skillId, ')
          ..write('name: $name, ')
          ..write('skillType: $skillType, ')
          ..write('skillAreaWidth: $skillAreaWidth, ')
          ..write('skillCastTime: $skillCastTime, ')
          ..write('bossUbCoolTime: $bossUbCoolTime, ')
          ..write('action1: $action1, ')
          ..write('action2: $action2, ')
          ..write('action3: $action3, ')
          ..write('action4: $action4, ')
          ..write('action5: $action5, ')
          ..write('action6: $action6, ')
          ..write('action7: $action7, ')
          ..write('action8: $action8, ')
          ..write('action9: $action9, ')
          ..write('action10: $action10, ')
          ..write('actionDepend1: $actionDepend1, ')
          ..write('actionDepend2: $actionDepend2, ')
          ..write('actionDepend3: $actionDepend3, ')
          ..write('actionDepend4: $actionDepend4, ')
          ..write('actionDepend5: $actionDepend5, ')
          ..write('actionDepend6: $actionDepend6, ')
          ..write('actionDepend7: $actionDepend7, ')
          ..write('actionDepend8: $actionDepend8, ')
          ..write('actionDepend9: $actionDepend9, ')
          ..write('actionDepend10: $actionDepend10, ')
          ..write('description: $description, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    skillId,
    name,
    skillType,
    skillAreaWidth,
    skillCastTime,
    bossUbCoolTime,
    action1,
    action2,
    action3,
    action4,
    action5,
    action6,
    action7,
    action8,
    action9,
    action10,
    actionDepend1,
    actionDepend2,
    actionDepend3,
    actionDepend4,
    actionDepend5,
    actionDepend6,
    actionDepend7,
    actionDepend8,
    actionDepend9,
    actionDepend10,
    description,
    iconType,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillDataData &&
          other.skillId == this.skillId &&
          other.name == this.name &&
          other.skillType == this.skillType &&
          other.skillAreaWidth == this.skillAreaWidth &&
          other.skillCastTime == this.skillCastTime &&
          other.bossUbCoolTime == this.bossUbCoolTime &&
          other.action1 == this.action1 &&
          other.action2 == this.action2 &&
          other.action3 == this.action3 &&
          other.action4 == this.action4 &&
          other.action5 == this.action5 &&
          other.action6 == this.action6 &&
          other.action7 == this.action7 &&
          other.action8 == this.action8 &&
          other.action9 == this.action9 &&
          other.action10 == this.action10 &&
          other.actionDepend1 == this.actionDepend1 &&
          other.actionDepend2 == this.actionDepend2 &&
          other.actionDepend3 == this.actionDepend3 &&
          other.actionDepend4 == this.actionDepend4 &&
          other.actionDepend5 == this.actionDepend5 &&
          other.actionDepend6 == this.actionDepend6 &&
          other.actionDepend7 == this.actionDepend7 &&
          other.actionDepend8 == this.actionDepend8 &&
          other.actionDepend9 == this.actionDepend9 &&
          other.actionDepend10 == this.actionDepend10 &&
          other.description == this.description &&
          other.iconType == this.iconType);
}

class SkillDataCompanion extends UpdateCompanion<SkillDataData> {
  final Value<int> skillId;
  final Value<String> name;
  final Value<int> skillType;
  final Value<int> skillAreaWidth;
  final Value<double> skillCastTime;
  final Value<double?> bossUbCoolTime;
  final Value<int> action1;
  final Value<int> action2;
  final Value<int> action3;
  final Value<int> action4;
  final Value<int> action5;
  final Value<int> action6;
  final Value<int> action7;
  final Value<int> action8;
  final Value<int> action9;
  final Value<int> action10;
  final Value<int> actionDepend1;
  final Value<int> actionDepend2;
  final Value<int> actionDepend3;
  final Value<int> actionDepend4;
  final Value<int> actionDepend5;
  final Value<int> actionDepend6;
  final Value<int> actionDepend7;
  final Value<int> actionDepend8;
  final Value<int> actionDepend9;
  final Value<int> actionDepend10;
  final Value<String?> description;
  final Value<int?> iconType;
  const SkillDataCompanion({
    this.skillId = const Value.absent(),
    this.name = const Value.absent(),
    this.skillType = const Value.absent(),
    this.skillAreaWidth = const Value.absent(),
    this.skillCastTime = const Value.absent(),
    this.bossUbCoolTime = const Value.absent(),
    this.action1 = const Value.absent(),
    this.action2 = const Value.absent(),
    this.action3 = const Value.absent(),
    this.action4 = const Value.absent(),
    this.action5 = const Value.absent(),
    this.action6 = const Value.absent(),
    this.action7 = const Value.absent(),
    this.action8 = const Value.absent(),
    this.action9 = const Value.absent(),
    this.action10 = const Value.absent(),
    this.actionDepend1 = const Value.absent(),
    this.actionDepend2 = const Value.absent(),
    this.actionDepend3 = const Value.absent(),
    this.actionDepend4 = const Value.absent(),
    this.actionDepend5 = const Value.absent(),
    this.actionDepend6 = const Value.absent(),
    this.actionDepend7 = const Value.absent(),
    this.actionDepend8 = const Value.absent(),
    this.actionDepend9 = const Value.absent(),
    this.actionDepend10 = const Value.absent(),
    this.description = const Value.absent(),
    this.iconType = const Value.absent(),
  });
  SkillDataCompanion.insert({
    this.skillId = const Value.absent(),
    required String name,
    required int skillType,
    required int skillAreaWidth,
    required double skillCastTime,
    this.bossUbCoolTime = const Value.absent(),
    required int action1,
    required int action2,
    required int action3,
    required int action4,
    required int action5,
    required int action6,
    required int action7,
    required int action8,
    required int action9,
    required int action10,
    required int actionDepend1,
    required int actionDepend2,
    required int actionDepend3,
    required int actionDepend4,
    required int actionDepend5,
    required int actionDepend6,
    required int actionDepend7,
    required int actionDepend8,
    required int actionDepend9,
    required int actionDepend10,
    this.description = const Value.absent(),
    this.iconType = const Value.absent(),
  }) : name = Value(name),
       skillType = Value(skillType),
       skillAreaWidth = Value(skillAreaWidth),
       skillCastTime = Value(skillCastTime),
       action1 = Value(action1),
       action2 = Value(action2),
       action3 = Value(action3),
       action4 = Value(action4),
       action5 = Value(action5),
       action6 = Value(action6),
       action7 = Value(action7),
       action8 = Value(action8),
       action9 = Value(action9),
       action10 = Value(action10),
       actionDepend1 = Value(actionDepend1),
       actionDepend2 = Value(actionDepend2),
       actionDepend3 = Value(actionDepend3),
       actionDepend4 = Value(actionDepend4),
       actionDepend5 = Value(actionDepend5),
       actionDepend6 = Value(actionDepend6),
       actionDepend7 = Value(actionDepend7),
       actionDepend8 = Value(actionDepend8),
       actionDepend9 = Value(actionDepend9),
       actionDepend10 = Value(actionDepend10);
  static Insertable<SkillDataData> custom({
    Expression<int>? skillId,
    Expression<String>? name,
    Expression<int>? skillType,
    Expression<int>? skillAreaWidth,
    Expression<double>? skillCastTime,
    Expression<double>? bossUbCoolTime,
    Expression<int>? action1,
    Expression<int>? action2,
    Expression<int>? action3,
    Expression<int>? action4,
    Expression<int>? action5,
    Expression<int>? action6,
    Expression<int>? action7,
    Expression<int>? action8,
    Expression<int>? action9,
    Expression<int>? action10,
    Expression<int>? actionDepend1,
    Expression<int>? actionDepend2,
    Expression<int>? actionDepend3,
    Expression<int>? actionDepend4,
    Expression<int>? actionDepend5,
    Expression<int>? actionDepend6,
    Expression<int>? actionDepend7,
    Expression<int>? actionDepend8,
    Expression<int>? actionDepend9,
    Expression<int>? actionDepend10,
    Expression<String>? description,
    Expression<int>? iconType,
  }) {
    return RawValuesInsertable({
      if (skillId != null) 'skill_id': skillId,
      if (name != null) 'name': name,
      if (skillType != null) 'skill_type': skillType,
      if (skillAreaWidth != null) 'skill_area_width': skillAreaWidth,
      if (skillCastTime != null) 'skill_cast_time': skillCastTime,
      if (bossUbCoolTime != null) 'boss_ub_cool_time': bossUbCoolTime,
      if (action1 != null) 'action_1': action1,
      if (action2 != null) 'action_2': action2,
      if (action3 != null) 'action_3': action3,
      if (action4 != null) 'action_4': action4,
      if (action5 != null) 'action_5': action5,
      if (action6 != null) 'action_6': action6,
      if (action7 != null) 'action_7': action7,
      if (action8 != null) 'action_8': action8,
      if (action9 != null) 'action_9': action9,
      if (action10 != null) 'action_10': action10,
      if (actionDepend1 != null) 'depend_action_1': actionDepend1,
      if (actionDepend2 != null) 'depend_action_2': actionDepend2,
      if (actionDepend3 != null) 'depend_action_3': actionDepend3,
      if (actionDepend4 != null) 'depend_action_4': actionDepend4,
      if (actionDepend5 != null) 'depend_action_5': actionDepend5,
      if (actionDepend6 != null) 'depend_action_6': actionDepend6,
      if (actionDepend7 != null) 'depend_action_7': actionDepend7,
      if (actionDepend8 != null) 'depend_action_8': actionDepend8,
      if (actionDepend9 != null) 'depend_action_9': actionDepend9,
      if (actionDepend10 != null) 'depend_action_10': actionDepend10,
      if (description != null) 'description': description,
      if (iconType != null) 'icon_type': iconType,
    });
  }

  SkillDataCompanion copyWith({
    Value<int>? skillId,
    Value<String>? name,
    Value<int>? skillType,
    Value<int>? skillAreaWidth,
    Value<double>? skillCastTime,
    Value<double?>? bossUbCoolTime,
    Value<int>? action1,
    Value<int>? action2,
    Value<int>? action3,
    Value<int>? action4,
    Value<int>? action5,
    Value<int>? action6,
    Value<int>? action7,
    Value<int>? action8,
    Value<int>? action9,
    Value<int>? action10,
    Value<int>? actionDepend1,
    Value<int>? actionDepend2,
    Value<int>? actionDepend3,
    Value<int>? actionDepend4,
    Value<int>? actionDepend5,
    Value<int>? actionDepend6,
    Value<int>? actionDepend7,
    Value<int>? actionDepend8,
    Value<int>? actionDepend9,
    Value<int>? actionDepend10,
    Value<String?>? description,
    Value<int?>? iconType,
  }) {
    return SkillDataCompanion(
      skillId: skillId ?? this.skillId,
      name: name ?? this.name,
      skillType: skillType ?? this.skillType,
      skillAreaWidth: skillAreaWidth ?? this.skillAreaWidth,
      skillCastTime: skillCastTime ?? this.skillCastTime,
      bossUbCoolTime: bossUbCoolTime ?? this.bossUbCoolTime,
      action1: action1 ?? this.action1,
      action2: action2 ?? this.action2,
      action3: action3 ?? this.action3,
      action4: action4 ?? this.action4,
      action5: action5 ?? this.action5,
      action6: action6 ?? this.action6,
      action7: action7 ?? this.action7,
      action8: action8 ?? this.action8,
      action9: action9 ?? this.action9,
      action10: action10 ?? this.action10,
      actionDepend1: actionDepend1 ?? this.actionDepend1,
      actionDepend2: actionDepend2 ?? this.actionDepend2,
      actionDepend3: actionDepend3 ?? this.actionDepend3,
      actionDepend4: actionDepend4 ?? this.actionDepend4,
      actionDepend5: actionDepend5 ?? this.actionDepend5,
      actionDepend6: actionDepend6 ?? this.actionDepend6,
      actionDepend7: actionDepend7 ?? this.actionDepend7,
      actionDepend8: actionDepend8 ?? this.actionDepend8,
      actionDepend9: actionDepend9 ?? this.actionDepend9,
      actionDepend10: actionDepend10 ?? this.actionDepend10,
      description: description ?? this.description,
      iconType: iconType ?? this.iconType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (skillId.present) {
      map['skill_id'] = Variable<int>(skillId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (skillType.present) {
      map['skill_type'] = Variable<int>(skillType.value);
    }
    if (skillAreaWidth.present) {
      map['skill_area_width'] = Variable<int>(skillAreaWidth.value);
    }
    if (skillCastTime.present) {
      map['skill_cast_time'] = Variable<double>(skillCastTime.value);
    }
    if (bossUbCoolTime.present) {
      map['boss_ub_cool_time'] = Variable<double>(bossUbCoolTime.value);
    }
    if (action1.present) {
      map['action_1'] = Variable<int>(action1.value);
    }
    if (action2.present) {
      map['action_2'] = Variable<int>(action2.value);
    }
    if (action3.present) {
      map['action_3'] = Variable<int>(action3.value);
    }
    if (action4.present) {
      map['action_4'] = Variable<int>(action4.value);
    }
    if (action5.present) {
      map['action_5'] = Variable<int>(action5.value);
    }
    if (action6.present) {
      map['action_6'] = Variable<int>(action6.value);
    }
    if (action7.present) {
      map['action_7'] = Variable<int>(action7.value);
    }
    if (action8.present) {
      map['action_8'] = Variable<int>(action8.value);
    }
    if (action9.present) {
      map['action_9'] = Variable<int>(action9.value);
    }
    if (action10.present) {
      map['action_10'] = Variable<int>(action10.value);
    }
    if (actionDepend1.present) {
      map['depend_action_1'] = Variable<int>(actionDepend1.value);
    }
    if (actionDepend2.present) {
      map['depend_action_2'] = Variable<int>(actionDepend2.value);
    }
    if (actionDepend3.present) {
      map['depend_action_3'] = Variable<int>(actionDepend3.value);
    }
    if (actionDepend4.present) {
      map['depend_action_4'] = Variable<int>(actionDepend4.value);
    }
    if (actionDepend5.present) {
      map['depend_action_5'] = Variable<int>(actionDepend5.value);
    }
    if (actionDepend6.present) {
      map['depend_action_6'] = Variable<int>(actionDepend6.value);
    }
    if (actionDepend7.present) {
      map['depend_action_7'] = Variable<int>(actionDepend7.value);
    }
    if (actionDepend8.present) {
      map['depend_action_8'] = Variable<int>(actionDepend8.value);
    }
    if (actionDepend9.present) {
      map['depend_action_9'] = Variable<int>(actionDepend9.value);
    }
    if (actionDepend10.present) {
      map['depend_action_10'] = Variable<int>(actionDepend10.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iconType.present) {
      map['icon_type'] = Variable<int>(iconType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillDataCompanion(')
          ..write('skillId: $skillId, ')
          ..write('name: $name, ')
          ..write('skillType: $skillType, ')
          ..write('skillAreaWidth: $skillAreaWidth, ')
          ..write('skillCastTime: $skillCastTime, ')
          ..write('bossUbCoolTime: $bossUbCoolTime, ')
          ..write('action1: $action1, ')
          ..write('action2: $action2, ')
          ..write('action3: $action3, ')
          ..write('action4: $action4, ')
          ..write('action5: $action5, ')
          ..write('action6: $action6, ')
          ..write('action7: $action7, ')
          ..write('action8: $action8, ')
          ..write('action9: $action9, ')
          ..write('action10: $action10, ')
          ..write('actionDepend1: $actionDepend1, ')
          ..write('actionDepend2: $actionDepend2, ')
          ..write('actionDepend3: $actionDepend3, ')
          ..write('actionDepend4: $actionDepend4, ')
          ..write('actionDepend5: $actionDepend5, ')
          ..write('actionDepend6: $actionDepend6, ')
          ..write('actionDepend7: $actionDepend7, ')
          ..write('actionDepend8: $actionDepend8, ')
          ..write('actionDepend9: $actionDepend9, ')
          ..write('actionDepend10: $actionDepend10, ')
          ..write('description: $description, ')
          ..write('iconType: $iconType')
          ..write(')'))
        .toString();
  }
}

class $UnitSkillDataTable extends UnitSkillData
    with TableInfo<$UnitSkillDataTable, UnitSkillDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitSkillDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unionBurstMeta = const VerificationMeta(
    'unionBurst',
  );
  @override
  late final GeneratedColumn<int> unionBurst = GeneratedColumn<int>(
    'union_burst',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spUnionBurstMeta = const VerificationMeta(
    'spUnionBurst',
  );
  @override
  late final GeneratedColumn<int> spUnionBurst = GeneratedColumn<int>(
    'sp_union_burst',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unionBurstEvolutionMeta =
      const VerificationMeta('unionBurstEvolution');
  @override
  late final GeneratedColumn<int> unionBurstEvolution = GeneratedColumn<int>(
    'union_burst_evolution',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainSkill1Meta = const VerificationMeta(
    'mainSkill1',
  );
  @override
  late final GeneratedColumn<int> mainSkill1 = GeneratedColumn<int>(
    'main_skill_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill2Meta = const VerificationMeta(
    'mainSkill2',
  );
  @override
  late final GeneratedColumn<int> mainSkill2 = GeneratedColumn<int>(
    'main_skill_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill3Meta = const VerificationMeta(
    'mainSkill3',
  );
  @override
  late final GeneratedColumn<int> mainSkill3 = GeneratedColumn<int>(
    'main_skill_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill4Meta = const VerificationMeta(
    'mainSkill4',
  );
  @override
  late final GeneratedColumn<int> mainSkill4 = GeneratedColumn<int>(
    'main_skill_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill5Meta = const VerificationMeta(
    'mainSkill5',
  );
  @override
  late final GeneratedColumn<int> mainSkill5 = GeneratedColumn<int>(
    'main_skill_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill6Meta = const VerificationMeta(
    'mainSkill6',
  );
  @override
  late final GeneratedColumn<int> mainSkill6 = GeneratedColumn<int>(
    'main_skill_6',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill7Meta = const VerificationMeta(
    'mainSkill7',
  );
  @override
  late final GeneratedColumn<int> mainSkill7 = GeneratedColumn<int>(
    'main_skill_7',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill8Meta = const VerificationMeta(
    'mainSkill8',
  );
  @override
  late final GeneratedColumn<int> mainSkill8 = GeneratedColumn<int>(
    'main_skill_8',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill9Meta = const VerificationMeta(
    'mainSkill9',
  );
  @override
  late final GeneratedColumn<int> mainSkill9 = GeneratedColumn<int>(
    'main_skill_9',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkill10Meta = const VerificationMeta(
    'mainSkill10',
  );
  @override
  late final GeneratedColumn<int> mainSkill10 = GeneratedColumn<int>(
    'main_skill_10',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mainSkillEvolution1Meta =
      const VerificationMeta('mainSkillEvolution1');
  @override
  late final GeneratedColumn<int> mainSkillEvolution1 = GeneratedColumn<int>(
    'main_skill_evolution_1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mainSkillEvolution2Meta =
      const VerificationMeta('mainSkillEvolution2');
  @override
  late final GeneratedColumn<int> mainSkillEvolution2 = GeneratedColumn<int>(
    'main_skill_evolution_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exSkill1Meta = const VerificationMeta(
    'exSkill1',
  );
  @override
  late final GeneratedColumn<int> exSkill1 = GeneratedColumn<int>(
    'ex_skill_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exSkill2Meta = const VerificationMeta(
    'exSkill2',
  );
  @override
  late final GeneratedColumn<int> exSkill2 = GeneratedColumn<int>(
    'ex_skill_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exSkill3Meta = const VerificationMeta(
    'exSkill3',
  );
  @override
  late final GeneratedColumn<int> exSkill3 = GeneratedColumn<int>(
    'ex_skill_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exSkill4Meta = const VerificationMeta(
    'exSkill4',
  );
  @override
  late final GeneratedColumn<int> exSkill4 = GeneratedColumn<int>(
    'ex_skill_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exSkill5Meta = const VerificationMeta(
    'exSkill5',
  );
  @override
  late final GeneratedColumn<int> exSkill5 = GeneratedColumn<int>(
    'ex_skill_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exSkillEvolution1Meta = const VerificationMeta(
    'exSkillEvolution1',
  );
  @override
  late final GeneratedColumn<int> exSkillEvolution1 = GeneratedColumn<int>(
    'ex_skill_evolution_1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exSkillEvolution2Meta = const VerificationMeta(
    'exSkillEvolution2',
  );
  @override
  late final GeneratedColumn<int> exSkillEvolution2 = GeneratedColumn<int>(
    'ex_skill_evolution_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exSkillEvolution3Meta = const VerificationMeta(
    'exSkillEvolution3',
  );
  @override
  late final GeneratedColumn<int> exSkillEvolution3 = GeneratedColumn<int>(
    'ex_skill_evolution_3',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exSkillEvolution4Meta = const VerificationMeta(
    'exSkillEvolution4',
  );
  @override
  late final GeneratedColumn<int> exSkillEvolution4 = GeneratedColumn<int>(
    'ex_skill_evolution_4',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _exSkillEvolution5Meta = const VerificationMeta(
    'exSkillEvolution5',
  );
  @override
  late final GeneratedColumn<int> exSkillEvolution5 = GeneratedColumn<int>(
    'ex_skill_evolution_5',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spSkill1Meta = const VerificationMeta(
    'spSkill1',
  );
  @override
  late final GeneratedColumn<int> spSkill1 = GeneratedColumn<int>(
    'sp_skill_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spSkill2Meta = const VerificationMeta(
    'spSkill2',
  );
  @override
  late final GeneratedColumn<int> spSkill2 = GeneratedColumn<int>(
    'sp_skill_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spSkill3Meta = const VerificationMeta(
    'spSkill3',
  );
  @override
  late final GeneratedColumn<int> spSkill3 = GeneratedColumn<int>(
    'sp_skill_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spSkill4Meta = const VerificationMeta(
    'spSkill4',
  );
  @override
  late final GeneratedColumn<int> spSkill4 = GeneratedColumn<int>(
    'sp_skill_4',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spSkill5Meta = const VerificationMeta(
    'spSkill5',
  );
  @override
  late final GeneratedColumn<int> spSkill5 = GeneratedColumn<int>(
    'sp_skill_5',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _spSkillEvolution1Meta = const VerificationMeta(
    'spSkillEvolution1',
  );
  @override
  late final GeneratedColumn<int> spSkillEvolution1 = GeneratedColumn<int>(
    'sp_skill_evolution_1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spSkillEvolution2Meta = const VerificationMeta(
    'spSkillEvolution2',
  );
  @override
  late final GeneratedColumn<int> spSkillEvolution2 = GeneratedColumn<int>(
    'sp_skill_evolution_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    unitId,
    unionBurst,
    spUnionBurst,
    unionBurstEvolution,
    mainSkill1,
    mainSkill2,
    mainSkill3,
    mainSkill4,
    mainSkill5,
    mainSkill6,
    mainSkill7,
    mainSkill8,
    mainSkill9,
    mainSkill10,
    mainSkillEvolution1,
    mainSkillEvolution2,
    exSkill1,
    exSkill2,
    exSkill3,
    exSkill4,
    exSkill5,
    exSkillEvolution1,
    exSkillEvolution2,
    exSkillEvolution3,
    exSkillEvolution4,
    exSkillEvolution5,
    spSkill1,
    spSkill2,
    spSkill3,
    spSkill4,
    spSkill5,
    spSkillEvolution1,
    spSkillEvolution2,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_skill_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitSkillDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('union_burst')) {
      context.handle(
        _unionBurstMeta,
        unionBurst.isAcceptableOrUnknown(data['union_burst']!, _unionBurstMeta),
      );
    } else if (isInserting) {
      context.missing(_unionBurstMeta);
    }
    if (data.containsKey('sp_union_burst')) {
      context.handle(
        _spUnionBurstMeta,
        spUnionBurst.isAcceptableOrUnknown(
          data['sp_union_burst']!,
          _spUnionBurstMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_spUnionBurstMeta);
    }
    if (data.containsKey('union_burst_evolution')) {
      context.handle(
        _unionBurstEvolutionMeta,
        unionBurstEvolution.isAcceptableOrUnknown(
          data['union_burst_evolution']!,
          _unionBurstEvolutionMeta,
        ),
      );
    }
    if (data.containsKey('main_skill_1')) {
      context.handle(
        _mainSkill1Meta,
        mainSkill1.isAcceptableOrUnknown(
          data['main_skill_1']!,
          _mainSkill1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill1Meta);
    }
    if (data.containsKey('main_skill_2')) {
      context.handle(
        _mainSkill2Meta,
        mainSkill2.isAcceptableOrUnknown(
          data['main_skill_2']!,
          _mainSkill2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill2Meta);
    }
    if (data.containsKey('main_skill_3')) {
      context.handle(
        _mainSkill3Meta,
        mainSkill3.isAcceptableOrUnknown(
          data['main_skill_3']!,
          _mainSkill3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill3Meta);
    }
    if (data.containsKey('main_skill_4')) {
      context.handle(
        _mainSkill4Meta,
        mainSkill4.isAcceptableOrUnknown(
          data['main_skill_4']!,
          _mainSkill4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill4Meta);
    }
    if (data.containsKey('main_skill_5')) {
      context.handle(
        _mainSkill5Meta,
        mainSkill5.isAcceptableOrUnknown(
          data['main_skill_5']!,
          _mainSkill5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill5Meta);
    }
    if (data.containsKey('main_skill_6')) {
      context.handle(
        _mainSkill6Meta,
        mainSkill6.isAcceptableOrUnknown(
          data['main_skill_6']!,
          _mainSkill6Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill6Meta);
    }
    if (data.containsKey('main_skill_7')) {
      context.handle(
        _mainSkill7Meta,
        mainSkill7.isAcceptableOrUnknown(
          data['main_skill_7']!,
          _mainSkill7Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill7Meta);
    }
    if (data.containsKey('main_skill_8')) {
      context.handle(
        _mainSkill8Meta,
        mainSkill8.isAcceptableOrUnknown(
          data['main_skill_8']!,
          _mainSkill8Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill8Meta);
    }
    if (data.containsKey('main_skill_9')) {
      context.handle(
        _mainSkill9Meta,
        mainSkill9.isAcceptableOrUnknown(
          data['main_skill_9']!,
          _mainSkill9Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill9Meta);
    }
    if (data.containsKey('main_skill_10')) {
      context.handle(
        _mainSkill10Meta,
        mainSkill10.isAcceptableOrUnknown(
          data['main_skill_10']!,
          _mainSkill10Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mainSkill10Meta);
    }
    if (data.containsKey('main_skill_evolution_1')) {
      context.handle(
        _mainSkillEvolution1Meta,
        mainSkillEvolution1.isAcceptableOrUnknown(
          data['main_skill_evolution_1']!,
          _mainSkillEvolution1Meta,
        ),
      );
    }
    if (data.containsKey('main_skill_evolution_2')) {
      context.handle(
        _mainSkillEvolution2Meta,
        mainSkillEvolution2.isAcceptableOrUnknown(
          data['main_skill_evolution_2']!,
          _mainSkillEvolution2Meta,
        ),
      );
    }
    if (data.containsKey('ex_skill_1')) {
      context.handle(
        _exSkill1Meta,
        exSkill1.isAcceptableOrUnknown(data['ex_skill_1']!, _exSkill1Meta),
      );
    } else if (isInserting) {
      context.missing(_exSkill1Meta);
    }
    if (data.containsKey('ex_skill_2')) {
      context.handle(
        _exSkill2Meta,
        exSkill2.isAcceptableOrUnknown(data['ex_skill_2']!, _exSkill2Meta),
      );
    } else if (isInserting) {
      context.missing(_exSkill2Meta);
    }
    if (data.containsKey('ex_skill_3')) {
      context.handle(
        _exSkill3Meta,
        exSkill3.isAcceptableOrUnknown(data['ex_skill_3']!, _exSkill3Meta),
      );
    } else if (isInserting) {
      context.missing(_exSkill3Meta);
    }
    if (data.containsKey('ex_skill_4')) {
      context.handle(
        _exSkill4Meta,
        exSkill4.isAcceptableOrUnknown(data['ex_skill_4']!, _exSkill4Meta),
      );
    } else if (isInserting) {
      context.missing(_exSkill4Meta);
    }
    if (data.containsKey('ex_skill_5')) {
      context.handle(
        _exSkill5Meta,
        exSkill5.isAcceptableOrUnknown(data['ex_skill_5']!, _exSkill5Meta),
      );
    } else if (isInserting) {
      context.missing(_exSkill5Meta);
    }
    if (data.containsKey('ex_skill_evolution_1')) {
      context.handle(
        _exSkillEvolution1Meta,
        exSkillEvolution1.isAcceptableOrUnknown(
          data['ex_skill_evolution_1']!,
          _exSkillEvolution1Meta,
        ),
      );
    }
    if (data.containsKey('ex_skill_evolution_2')) {
      context.handle(
        _exSkillEvolution2Meta,
        exSkillEvolution2.isAcceptableOrUnknown(
          data['ex_skill_evolution_2']!,
          _exSkillEvolution2Meta,
        ),
      );
    }
    if (data.containsKey('ex_skill_evolution_3')) {
      context.handle(
        _exSkillEvolution3Meta,
        exSkillEvolution3.isAcceptableOrUnknown(
          data['ex_skill_evolution_3']!,
          _exSkillEvolution3Meta,
        ),
      );
    }
    if (data.containsKey('ex_skill_evolution_4')) {
      context.handle(
        _exSkillEvolution4Meta,
        exSkillEvolution4.isAcceptableOrUnknown(
          data['ex_skill_evolution_4']!,
          _exSkillEvolution4Meta,
        ),
      );
    }
    if (data.containsKey('ex_skill_evolution_5')) {
      context.handle(
        _exSkillEvolution5Meta,
        exSkillEvolution5.isAcceptableOrUnknown(
          data['ex_skill_evolution_5']!,
          _exSkillEvolution5Meta,
        ),
      );
    }
    if (data.containsKey('sp_skill_1')) {
      context.handle(
        _spSkill1Meta,
        spSkill1.isAcceptableOrUnknown(data['sp_skill_1']!, _spSkill1Meta),
      );
    } else if (isInserting) {
      context.missing(_spSkill1Meta);
    }
    if (data.containsKey('sp_skill_2')) {
      context.handle(
        _spSkill2Meta,
        spSkill2.isAcceptableOrUnknown(data['sp_skill_2']!, _spSkill2Meta),
      );
    } else if (isInserting) {
      context.missing(_spSkill2Meta);
    }
    if (data.containsKey('sp_skill_3')) {
      context.handle(
        _spSkill3Meta,
        spSkill3.isAcceptableOrUnknown(data['sp_skill_3']!, _spSkill3Meta),
      );
    } else if (isInserting) {
      context.missing(_spSkill3Meta);
    }
    if (data.containsKey('sp_skill_4')) {
      context.handle(
        _spSkill4Meta,
        spSkill4.isAcceptableOrUnknown(data['sp_skill_4']!, _spSkill4Meta),
      );
    } else if (isInserting) {
      context.missing(_spSkill4Meta);
    }
    if (data.containsKey('sp_skill_5')) {
      context.handle(
        _spSkill5Meta,
        spSkill5.isAcceptableOrUnknown(data['sp_skill_5']!, _spSkill5Meta),
      );
    } else if (isInserting) {
      context.missing(_spSkill5Meta);
    }
    if (data.containsKey('sp_skill_evolution_1')) {
      context.handle(
        _spSkillEvolution1Meta,
        spSkillEvolution1.isAcceptableOrUnknown(
          data['sp_skill_evolution_1']!,
          _spSkillEvolution1Meta,
        ),
      );
    }
    if (data.containsKey('sp_skill_evolution_2')) {
      context.handle(
        _spSkillEvolution2Meta,
        spSkillEvolution2.isAcceptableOrUnknown(
          data['sp_skill_evolution_2']!,
          _spSkillEvolution2Meta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  UnitSkillDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitSkillDataData(
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      unionBurst:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}union_burst'],
          )!,
      spUnionBurst:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_union_burst'],
          )!,
      unionBurstEvolution: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}union_burst_evolution'],
      ),
      mainSkill1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_1'],
          )!,
      mainSkill2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_2'],
          )!,
      mainSkill3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_3'],
          )!,
      mainSkill4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_4'],
          )!,
      mainSkill5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_5'],
          )!,
      mainSkill6:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_6'],
          )!,
      mainSkill7:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_7'],
          )!,
      mainSkill8:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_8'],
          )!,
      mainSkill9:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_9'],
          )!,
      mainSkill10:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}main_skill_10'],
          )!,
      mainSkillEvolution1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}main_skill_evolution_1'],
      ),
      mainSkillEvolution2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}main_skill_evolution_2'],
      ),
      exSkill1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ex_skill_1'],
          )!,
      exSkill2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ex_skill_2'],
          )!,
      exSkill3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ex_skill_3'],
          )!,
      exSkill4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ex_skill_4'],
          )!,
      exSkill5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ex_skill_5'],
          )!,
      exSkillEvolution1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_skill_evolution_1'],
      ),
      exSkillEvolution2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_skill_evolution_2'],
      ),
      exSkillEvolution3: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_skill_evolution_3'],
      ),
      exSkillEvolution4: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_skill_evolution_4'],
      ),
      exSkillEvolution5: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ex_skill_evolution_5'],
      ),
      spSkill1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_skill_1'],
          )!,
      spSkill2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_skill_2'],
          )!,
      spSkill3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_skill_3'],
          )!,
      spSkill4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_skill_4'],
          )!,
      spSkill5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}sp_skill_5'],
          )!,
      spSkillEvolution1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sp_skill_evolution_1'],
      ),
      spSkillEvolution2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sp_skill_evolution_2'],
      ),
    );
  }

  @override
  $UnitSkillDataTable createAlias(String alias) {
    return $UnitSkillDataTable(attachedDatabase, alias);
  }
}

class UnitSkillDataData extends DataClass
    implements Insertable<UnitSkillDataData> {
  final int unitId;
  final int unionBurst;
  final int spUnionBurst;
  final int? unionBurstEvolution;
  final int mainSkill1;
  final int mainSkill2;
  final int mainSkill3;
  final int mainSkill4;
  final int mainSkill5;
  final int mainSkill6;
  final int mainSkill7;
  final int mainSkill8;
  final int mainSkill9;
  final int mainSkill10;
  final int? mainSkillEvolution1;
  final int? mainSkillEvolution2;
  final int exSkill1;
  final int exSkill2;
  final int exSkill3;
  final int exSkill4;
  final int exSkill5;
  final int? exSkillEvolution1;
  final int? exSkillEvolution2;
  final int? exSkillEvolution3;
  final int? exSkillEvolution4;
  final int? exSkillEvolution5;
  final int spSkill1;
  final int spSkill2;
  final int spSkill3;
  final int spSkill4;
  final int spSkill5;
  final int? spSkillEvolution1;
  final int? spSkillEvolution2;
  const UnitSkillDataData({
    required this.unitId,
    required this.unionBurst,
    required this.spUnionBurst,
    this.unionBurstEvolution,
    required this.mainSkill1,
    required this.mainSkill2,
    required this.mainSkill3,
    required this.mainSkill4,
    required this.mainSkill5,
    required this.mainSkill6,
    required this.mainSkill7,
    required this.mainSkill8,
    required this.mainSkill9,
    required this.mainSkill10,
    this.mainSkillEvolution1,
    this.mainSkillEvolution2,
    required this.exSkill1,
    required this.exSkill2,
    required this.exSkill3,
    required this.exSkill4,
    required this.exSkill5,
    this.exSkillEvolution1,
    this.exSkillEvolution2,
    this.exSkillEvolution3,
    this.exSkillEvolution4,
    this.exSkillEvolution5,
    required this.spSkill1,
    required this.spSkill2,
    required this.spSkill3,
    required this.spSkill4,
    required this.spSkill5,
    this.spSkillEvolution1,
    this.spSkillEvolution2,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    map['union_burst'] = Variable<int>(unionBurst);
    map['sp_union_burst'] = Variable<int>(spUnionBurst);
    if (!nullToAbsent || unionBurstEvolution != null) {
      map['union_burst_evolution'] = Variable<int>(unionBurstEvolution);
    }
    map['main_skill_1'] = Variable<int>(mainSkill1);
    map['main_skill_2'] = Variable<int>(mainSkill2);
    map['main_skill_3'] = Variable<int>(mainSkill3);
    map['main_skill_4'] = Variable<int>(mainSkill4);
    map['main_skill_5'] = Variable<int>(mainSkill5);
    map['main_skill_6'] = Variable<int>(mainSkill6);
    map['main_skill_7'] = Variable<int>(mainSkill7);
    map['main_skill_8'] = Variable<int>(mainSkill8);
    map['main_skill_9'] = Variable<int>(mainSkill9);
    map['main_skill_10'] = Variable<int>(mainSkill10);
    if (!nullToAbsent || mainSkillEvolution1 != null) {
      map['main_skill_evolution_1'] = Variable<int>(mainSkillEvolution1);
    }
    if (!nullToAbsent || mainSkillEvolution2 != null) {
      map['main_skill_evolution_2'] = Variable<int>(mainSkillEvolution2);
    }
    map['ex_skill_1'] = Variable<int>(exSkill1);
    map['ex_skill_2'] = Variable<int>(exSkill2);
    map['ex_skill_3'] = Variable<int>(exSkill3);
    map['ex_skill_4'] = Variable<int>(exSkill4);
    map['ex_skill_5'] = Variable<int>(exSkill5);
    if (!nullToAbsent || exSkillEvolution1 != null) {
      map['ex_skill_evolution_1'] = Variable<int>(exSkillEvolution1);
    }
    if (!nullToAbsent || exSkillEvolution2 != null) {
      map['ex_skill_evolution_2'] = Variable<int>(exSkillEvolution2);
    }
    if (!nullToAbsent || exSkillEvolution3 != null) {
      map['ex_skill_evolution_3'] = Variable<int>(exSkillEvolution3);
    }
    if (!nullToAbsent || exSkillEvolution4 != null) {
      map['ex_skill_evolution_4'] = Variable<int>(exSkillEvolution4);
    }
    if (!nullToAbsent || exSkillEvolution5 != null) {
      map['ex_skill_evolution_5'] = Variable<int>(exSkillEvolution5);
    }
    map['sp_skill_1'] = Variable<int>(spSkill1);
    map['sp_skill_2'] = Variable<int>(spSkill2);
    map['sp_skill_3'] = Variable<int>(spSkill3);
    map['sp_skill_4'] = Variable<int>(spSkill4);
    map['sp_skill_5'] = Variable<int>(spSkill5);
    if (!nullToAbsent || spSkillEvolution1 != null) {
      map['sp_skill_evolution_1'] = Variable<int>(spSkillEvolution1);
    }
    if (!nullToAbsent || spSkillEvolution2 != null) {
      map['sp_skill_evolution_2'] = Variable<int>(spSkillEvolution2);
    }
    return map;
  }

  UnitSkillDataCompanion toCompanion(bool nullToAbsent) {
    return UnitSkillDataCompanion(
      unitId: Value(unitId),
      unionBurst: Value(unionBurst),
      spUnionBurst: Value(spUnionBurst),
      unionBurstEvolution:
          unionBurstEvolution == null && nullToAbsent
              ? const Value.absent()
              : Value(unionBurstEvolution),
      mainSkill1: Value(mainSkill1),
      mainSkill2: Value(mainSkill2),
      mainSkill3: Value(mainSkill3),
      mainSkill4: Value(mainSkill4),
      mainSkill5: Value(mainSkill5),
      mainSkill6: Value(mainSkill6),
      mainSkill7: Value(mainSkill7),
      mainSkill8: Value(mainSkill8),
      mainSkill9: Value(mainSkill9),
      mainSkill10: Value(mainSkill10),
      mainSkillEvolution1:
          mainSkillEvolution1 == null && nullToAbsent
              ? const Value.absent()
              : Value(mainSkillEvolution1),
      mainSkillEvolution2:
          mainSkillEvolution2 == null && nullToAbsent
              ? const Value.absent()
              : Value(mainSkillEvolution2),
      exSkill1: Value(exSkill1),
      exSkill2: Value(exSkill2),
      exSkill3: Value(exSkill3),
      exSkill4: Value(exSkill4),
      exSkill5: Value(exSkill5),
      exSkillEvolution1:
          exSkillEvolution1 == null && nullToAbsent
              ? const Value.absent()
              : Value(exSkillEvolution1),
      exSkillEvolution2:
          exSkillEvolution2 == null && nullToAbsent
              ? const Value.absent()
              : Value(exSkillEvolution2),
      exSkillEvolution3:
          exSkillEvolution3 == null && nullToAbsent
              ? const Value.absent()
              : Value(exSkillEvolution3),
      exSkillEvolution4:
          exSkillEvolution4 == null && nullToAbsent
              ? const Value.absent()
              : Value(exSkillEvolution4),
      exSkillEvolution5:
          exSkillEvolution5 == null && nullToAbsent
              ? const Value.absent()
              : Value(exSkillEvolution5),
      spSkill1: Value(spSkill1),
      spSkill2: Value(spSkill2),
      spSkill3: Value(spSkill3),
      spSkill4: Value(spSkill4),
      spSkill5: Value(spSkill5),
      spSkillEvolution1:
          spSkillEvolution1 == null && nullToAbsent
              ? const Value.absent()
              : Value(spSkillEvolution1),
      spSkillEvolution2:
          spSkillEvolution2 == null && nullToAbsent
              ? const Value.absent()
              : Value(spSkillEvolution2),
    );
  }

  factory UnitSkillDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitSkillDataData(
      unitId: serializer.fromJson<int>(json['unitId']),
      unionBurst: serializer.fromJson<int>(json['unionBurst']),
      spUnionBurst: serializer.fromJson<int>(json['spUnionBurst']),
      unionBurstEvolution: serializer.fromJson<int?>(
        json['unionBurstEvolution'],
      ),
      mainSkill1: serializer.fromJson<int>(json['mainSkill1']),
      mainSkill2: serializer.fromJson<int>(json['mainSkill2']),
      mainSkill3: serializer.fromJson<int>(json['mainSkill3']),
      mainSkill4: serializer.fromJson<int>(json['mainSkill4']),
      mainSkill5: serializer.fromJson<int>(json['mainSkill5']),
      mainSkill6: serializer.fromJson<int>(json['mainSkill6']),
      mainSkill7: serializer.fromJson<int>(json['mainSkill7']),
      mainSkill8: serializer.fromJson<int>(json['mainSkill8']),
      mainSkill9: serializer.fromJson<int>(json['mainSkill9']),
      mainSkill10: serializer.fromJson<int>(json['mainSkill10']),
      mainSkillEvolution1: serializer.fromJson<int?>(
        json['mainSkillEvolution1'],
      ),
      mainSkillEvolution2: serializer.fromJson<int?>(
        json['mainSkillEvolution2'],
      ),
      exSkill1: serializer.fromJson<int>(json['exSkill1']),
      exSkill2: serializer.fromJson<int>(json['exSkill2']),
      exSkill3: serializer.fromJson<int>(json['exSkill3']),
      exSkill4: serializer.fromJson<int>(json['exSkill4']),
      exSkill5: serializer.fromJson<int>(json['exSkill5']),
      exSkillEvolution1: serializer.fromJson<int?>(json['exSkillEvolution1']),
      exSkillEvolution2: serializer.fromJson<int?>(json['exSkillEvolution2']),
      exSkillEvolution3: serializer.fromJson<int?>(json['exSkillEvolution3']),
      exSkillEvolution4: serializer.fromJson<int?>(json['exSkillEvolution4']),
      exSkillEvolution5: serializer.fromJson<int?>(json['exSkillEvolution5']),
      spSkill1: serializer.fromJson<int>(json['spSkill1']),
      spSkill2: serializer.fromJson<int>(json['spSkill2']),
      spSkill3: serializer.fromJson<int>(json['spSkill3']),
      spSkill4: serializer.fromJson<int>(json['spSkill4']),
      spSkill5: serializer.fromJson<int>(json['spSkill5']),
      spSkillEvolution1: serializer.fromJson<int?>(json['spSkillEvolution1']),
      spSkillEvolution2: serializer.fromJson<int?>(json['spSkillEvolution2']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'unionBurst': serializer.toJson<int>(unionBurst),
      'spUnionBurst': serializer.toJson<int>(spUnionBurst),
      'unionBurstEvolution': serializer.toJson<int?>(unionBurstEvolution),
      'mainSkill1': serializer.toJson<int>(mainSkill1),
      'mainSkill2': serializer.toJson<int>(mainSkill2),
      'mainSkill3': serializer.toJson<int>(mainSkill3),
      'mainSkill4': serializer.toJson<int>(mainSkill4),
      'mainSkill5': serializer.toJson<int>(mainSkill5),
      'mainSkill6': serializer.toJson<int>(mainSkill6),
      'mainSkill7': serializer.toJson<int>(mainSkill7),
      'mainSkill8': serializer.toJson<int>(mainSkill8),
      'mainSkill9': serializer.toJson<int>(mainSkill9),
      'mainSkill10': serializer.toJson<int>(mainSkill10),
      'mainSkillEvolution1': serializer.toJson<int?>(mainSkillEvolution1),
      'mainSkillEvolution2': serializer.toJson<int?>(mainSkillEvolution2),
      'exSkill1': serializer.toJson<int>(exSkill1),
      'exSkill2': serializer.toJson<int>(exSkill2),
      'exSkill3': serializer.toJson<int>(exSkill3),
      'exSkill4': serializer.toJson<int>(exSkill4),
      'exSkill5': serializer.toJson<int>(exSkill5),
      'exSkillEvolution1': serializer.toJson<int?>(exSkillEvolution1),
      'exSkillEvolution2': serializer.toJson<int?>(exSkillEvolution2),
      'exSkillEvolution3': serializer.toJson<int?>(exSkillEvolution3),
      'exSkillEvolution4': serializer.toJson<int?>(exSkillEvolution4),
      'exSkillEvolution5': serializer.toJson<int?>(exSkillEvolution5),
      'spSkill1': serializer.toJson<int>(spSkill1),
      'spSkill2': serializer.toJson<int>(spSkill2),
      'spSkill3': serializer.toJson<int>(spSkill3),
      'spSkill4': serializer.toJson<int>(spSkill4),
      'spSkill5': serializer.toJson<int>(spSkill5),
      'spSkillEvolution1': serializer.toJson<int?>(spSkillEvolution1),
      'spSkillEvolution2': serializer.toJson<int?>(spSkillEvolution2),
    };
  }

  UnitSkillDataData copyWith({
    int? unitId,
    int? unionBurst,
    int? spUnionBurst,
    Value<int?> unionBurstEvolution = const Value.absent(),
    int? mainSkill1,
    int? mainSkill2,
    int? mainSkill3,
    int? mainSkill4,
    int? mainSkill5,
    int? mainSkill6,
    int? mainSkill7,
    int? mainSkill8,
    int? mainSkill9,
    int? mainSkill10,
    Value<int?> mainSkillEvolution1 = const Value.absent(),
    Value<int?> mainSkillEvolution2 = const Value.absent(),
    int? exSkill1,
    int? exSkill2,
    int? exSkill3,
    int? exSkill4,
    int? exSkill5,
    Value<int?> exSkillEvolution1 = const Value.absent(),
    Value<int?> exSkillEvolution2 = const Value.absent(),
    Value<int?> exSkillEvolution3 = const Value.absent(),
    Value<int?> exSkillEvolution4 = const Value.absent(),
    Value<int?> exSkillEvolution5 = const Value.absent(),
    int? spSkill1,
    int? spSkill2,
    int? spSkill3,
    int? spSkill4,
    int? spSkill5,
    Value<int?> spSkillEvolution1 = const Value.absent(),
    Value<int?> spSkillEvolution2 = const Value.absent(),
  }) => UnitSkillDataData(
    unitId: unitId ?? this.unitId,
    unionBurst: unionBurst ?? this.unionBurst,
    spUnionBurst: spUnionBurst ?? this.spUnionBurst,
    unionBurstEvolution:
        unionBurstEvolution.present
            ? unionBurstEvolution.value
            : this.unionBurstEvolution,
    mainSkill1: mainSkill1 ?? this.mainSkill1,
    mainSkill2: mainSkill2 ?? this.mainSkill2,
    mainSkill3: mainSkill3 ?? this.mainSkill3,
    mainSkill4: mainSkill4 ?? this.mainSkill4,
    mainSkill5: mainSkill5 ?? this.mainSkill5,
    mainSkill6: mainSkill6 ?? this.mainSkill6,
    mainSkill7: mainSkill7 ?? this.mainSkill7,
    mainSkill8: mainSkill8 ?? this.mainSkill8,
    mainSkill9: mainSkill9 ?? this.mainSkill9,
    mainSkill10: mainSkill10 ?? this.mainSkill10,
    mainSkillEvolution1:
        mainSkillEvolution1.present
            ? mainSkillEvolution1.value
            : this.mainSkillEvolution1,
    mainSkillEvolution2:
        mainSkillEvolution2.present
            ? mainSkillEvolution2.value
            : this.mainSkillEvolution2,
    exSkill1: exSkill1 ?? this.exSkill1,
    exSkill2: exSkill2 ?? this.exSkill2,
    exSkill3: exSkill3 ?? this.exSkill3,
    exSkill4: exSkill4 ?? this.exSkill4,
    exSkill5: exSkill5 ?? this.exSkill5,
    exSkillEvolution1:
        exSkillEvolution1.present
            ? exSkillEvolution1.value
            : this.exSkillEvolution1,
    exSkillEvolution2:
        exSkillEvolution2.present
            ? exSkillEvolution2.value
            : this.exSkillEvolution2,
    exSkillEvolution3:
        exSkillEvolution3.present
            ? exSkillEvolution3.value
            : this.exSkillEvolution3,
    exSkillEvolution4:
        exSkillEvolution4.present
            ? exSkillEvolution4.value
            : this.exSkillEvolution4,
    exSkillEvolution5:
        exSkillEvolution5.present
            ? exSkillEvolution5.value
            : this.exSkillEvolution5,
    spSkill1: spSkill1 ?? this.spSkill1,
    spSkill2: spSkill2 ?? this.spSkill2,
    spSkill3: spSkill3 ?? this.spSkill3,
    spSkill4: spSkill4 ?? this.spSkill4,
    spSkill5: spSkill5 ?? this.spSkill5,
    spSkillEvolution1:
        spSkillEvolution1.present
            ? spSkillEvolution1.value
            : this.spSkillEvolution1,
    spSkillEvolution2:
        spSkillEvolution2.present
            ? spSkillEvolution2.value
            : this.spSkillEvolution2,
  );
  UnitSkillDataData copyWithCompanion(UnitSkillDataCompanion data) {
    return UnitSkillDataData(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      unionBurst:
          data.unionBurst.present ? data.unionBurst.value : this.unionBurst,
      spUnionBurst:
          data.spUnionBurst.present
              ? data.spUnionBurst.value
              : this.spUnionBurst,
      unionBurstEvolution:
          data.unionBurstEvolution.present
              ? data.unionBurstEvolution.value
              : this.unionBurstEvolution,
      mainSkill1:
          data.mainSkill1.present ? data.mainSkill1.value : this.mainSkill1,
      mainSkill2:
          data.mainSkill2.present ? data.mainSkill2.value : this.mainSkill2,
      mainSkill3:
          data.mainSkill3.present ? data.mainSkill3.value : this.mainSkill3,
      mainSkill4:
          data.mainSkill4.present ? data.mainSkill4.value : this.mainSkill4,
      mainSkill5:
          data.mainSkill5.present ? data.mainSkill5.value : this.mainSkill5,
      mainSkill6:
          data.mainSkill6.present ? data.mainSkill6.value : this.mainSkill6,
      mainSkill7:
          data.mainSkill7.present ? data.mainSkill7.value : this.mainSkill7,
      mainSkill8:
          data.mainSkill8.present ? data.mainSkill8.value : this.mainSkill8,
      mainSkill9:
          data.mainSkill9.present ? data.mainSkill9.value : this.mainSkill9,
      mainSkill10:
          data.mainSkill10.present ? data.mainSkill10.value : this.mainSkill10,
      mainSkillEvolution1:
          data.mainSkillEvolution1.present
              ? data.mainSkillEvolution1.value
              : this.mainSkillEvolution1,
      mainSkillEvolution2:
          data.mainSkillEvolution2.present
              ? data.mainSkillEvolution2.value
              : this.mainSkillEvolution2,
      exSkill1: data.exSkill1.present ? data.exSkill1.value : this.exSkill1,
      exSkill2: data.exSkill2.present ? data.exSkill2.value : this.exSkill2,
      exSkill3: data.exSkill3.present ? data.exSkill3.value : this.exSkill3,
      exSkill4: data.exSkill4.present ? data.exSkill4.value : this.exSkill4,
      exSkill5: data.exSkill5.present ? data.exSkill5.value : this.exSkill5,
      exSkillEvolution1:
          data.exSkillEvolution1.present
              ? data.exSkillEvolution1.value
              : this.exSkillEvolution1,
      exSkillEvolution2:
          data.exSkillEvolution2.present
              ? data.exSkillEvolution2.value
              : this.exSkillEvolution2,
      exSkillEvolution3:
          data.exSkillEvolution3.present
              ? data.exSkillEvolution3.value
              : this.exSkillEvolution3,
      exSkillEvolution4:
          data.exSkillEvolution4.present
              ? data.exSkillEvolution4.value
              : this.exSkillEvolution4,
      exSkillEvolution5:
          data.exSkillEvolution5.present
              ? data.exSkillEvolution5.value
              : this.exSkillEvolution5,
      spSkill1: data.spSkill1.present ? data.spSkill1.value : this.spSkill1,
      spSkill2: data.spSkill2.present ? data.spSkill2.value : this.spSkill2,
      spSkill3: data.spSkill3.present ? data.spSkill3.value : this.spSkill3,
      spSkill4: data.spSkill4.present ? data.spSkill4.value : this.spSkill4,
      spSkill5: data.spSkill5.present ? data.spSkill5.value : this.spSkill5,
      spSkillEvolution1:
          data.spSkillEvolution1.present
              ? data.spSkillEvolution1.value
              : this.spSkillEvolution1,
      spSkillEvolution2:
          data.spSkillEvolution2.present
              ? data.spSkillEvolution2.value
              : this.spSkillEvolution2,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitSkillDataData(')
          ..write('unitId: $unitId, ')
          ..write('unionBurst: $unionBurst, ')
          ..write('spUnionBurst: $spUnionBurst, ')
          ..write('unionBurstEvolution: $unionBurstEvolution, ')
          ..write('mainSkill1: $mainSkill1, ')
          ..write('mainSkill2: $mainSkill2, ')
          ..write('mainSkill3: $mainSkill3, ')
          ..write('mainSkill4: $mainSkill4, ')
          ..write('mainSkill5: $mainSkill5, ')
          ..write('mainSkill6: $mainSkill6, ')
          ..write('mainSkill7: $mainSkill7, ')
          ..write('mainSkill8: $mainSkill8, ')
          ..write('mainSkill9: $mainSkill9, ')
          ..write('mainSkill10: $mainSkill10, ')
          ..write('mainSkillEvolution1: $mainSkillEvolution1, ')
          ..write('mainSkillEvolution2: $mainSkillEvolution2, ')
          ..write('exSkill1: $exSkill1, ')
          ..write('exSkill2: $exSkill2, ')
          ..write('exSkill3: $exSkill3, ')
          ..write('exSkill4: $exSkill4, ')
          ..write('exSkill5: $exSkill5, ')
          ..write('exSkillEvolution1: $exSkillEvolution1, ')
          ..write('exSkillEvolution2: $exSkillEvolution2, ')
          ..write('exSkillEvolution3: $exSkillEvolution3, ')
          ..write('exSkillEvolution4: $exSkillEvolution4, ')
          ..write('exSkillEvolution5: $exSkillEvolution5, ')
          ..write('spSkill1: $spSkill1, ')
          ..write('spSkill2: $spSkill2, ')
          ..write('spSkill3: $spSkill3, ')
          ..write('spSkill4: $spSkill4, ')
          ..write('spSkill5: $spSkill5, ')
          ..write('spSkillEvolution1: $spSkillEvolution1, ')
          ..write('spSkillEvolution2: $spSkillEvolution2')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    unitId,
    unionBurst,
    spUnionBurst,
    unionBurstEvolution,
    mainSkill1,
    mainSkill2,
    mainSkill3,
    mainSkill4,
    mainSkill5,
    mainSkill6,
    mainSkill7,
    mainSkill8,
    mainSkill9,
    mainSkill10,
    mainSkillEvolution1,
    mainSkillEvolution2,
    exSkill1,
    exSkill2,
    exSkill3,
    exSkill4,
    exSkill5,
    exSkillEvolution1,
    exSkillEvolution2,
    exSkillEvolution3,
    exSkillEvolution4,
    exSkillEvolution5,
    spSkill1,
    spSkill2,
    spSkill3,
    spSkill4,
    spSkill5,
    spSkillEvolution1,
    spSkillEvolution2,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitSkillDataData &&
          other.unitId == this.unitId &&
          other.unionBurst == this.unionBurst &&
          other.spUnionBurst == this.spUnionBurst &&
          other.unionBurstEvolution == this.unionBurstEvolution &&
          other.mainSkill1 == this.mainSkill1 &&
          other.mainSkill2 == this.mainSkill2 &&
          other.mainSkill3 == this.mainSkill3 &&
          other.mainSkill4 == this.mainSkill4 &&
          other.mainSkill5 == this.mainSkill5 &&
          other.mainSkill6 == this.mainSkill6 &&
          other.mainSkill7 == this.mainSkill7 &&
          other.mainSkill8 == this.mainSkill8 &&
          other.mainSkill9 == this.mainSkill9 &&
          other.mainSkill10 == this.mainSkill10 &&
          other.mainSkillEvolution1 == this.mainSkillEvolution1 &&
          other.mainSkillEvolution2 == this.mainSkillEvolution2 &&
          other.exSkill1 == this.exSkill1 &&
          other.exSkill2 == this.exSkill2 &&
          other.exSkill3 == this.exSkill3 &&
          other.exSkill4 == this.exSkill4 &&
          other.exSkill5 == this.exSkill5 &&
          other.exSkillEvolution1 == this.exSkillEvolution1 &&
          other.exSkillEvolution2 == this.exSkillEvolution2 &&
          other.exSkillEvolution3 == this.exSkillEvolution3 &&
          other.exSkillEvolution4 == this.exSkillEvolution4 &&
          other.exSkillEvolution5 == this.exSkillEvolution5 &&
          other.spSkill1 == this.spSkill1 &&
          other.spSkill2 == this.spSkill2 &&
          other.spSkill3 == this.spSkill3 &&
          other.spSkill4 == this.spSkill4 &&
          other.spSkill5 == this.spSkill5 &&
          other.spSkillEvolution1 == this.spSkillEvolution1 &&
          other.spSkillEvolution2 == this.spSkillEvolution2);
}

class UnitSkillDataCompanion extends UpdateCompanion<UnitSkillDataData> {
  final Value<int> unitId;
  final Value<int> unionBurst;
  final Value<int> spUnionBurst;
  final Value<int?> unionBurstEvolution;
  final Value<int> mainSkill1;
  final Value<int> mainSkill2;
  final Value<int> mainSkill3;
  final Value<int> mainSkill4;
  final Value<int> mainSkill5;
  final Value<int> mainSkill6;
  final Value<int> mainSkill7;
  final Value<int> mainSkill8;
  final Value<int> mainSkill9;
  final Value<int> mainSkill10;
  final Value<int?> mainSkillEvolution1;
  final Value<int?> mainSkillEvolution2;
  final Value<int> exSkill1;
  final Value<int> exSkill2;
  final Value<int> exSkill3;
  final Value<int> exSkill4;
  final Value<int> exSkill5;
  final Value<int?> exSkillEvolution1;
  final Value<int?> exSkillEvolution2;
  final Value<int?> exSkillEvolution3;
  final Value<int?> exSkillEvolution4;
  final Value<int?> exSkillEvolution5;
  final Value<int> spSkill1;
  final Value<int> spSkill2;
  final Value<int> spSkill3;
  final Value<int> spSkill4;
  final Value<int> spSkill5;
  final Value<int?> spSkillEvolution1;
  final Value<int?> spSkillEvolution2;
  const UnitSkillDataCompanion({
    this.unitId = const Value.absent(),
    this.unionBurst = const Value.absent(),
    this.spUnionBurst = const Value.absent(),
    this.unionBurstEvolution = const Value.absent(),
    this.mainSkill1 = const Value.absent(),
    this.mainSkill2 = const Value.absent(),
    this.mainSkill3 = const Value.absent(),
    this.mainSkill4 = const Value.absent(),
    this.mainSkill5 = const Value.absent(),
    this.mainSkill6 = const Value.absent(),
    this.mainSkill7 = const Value.absent(),
    this.mainSkill8 = const Value.absent(),
    this.mainSkill9 = const Value.absent(),
    this.mainSkill10 = const Value.absent(),
    this.mainSkillEvolution1 = const Value.absent(),
    this.mainSkillEvolution2 = const Value.absent(),
    this.exSkill1 = const Value.absent(),
    this.exSkill2 = const Value.absent(),
    this.exSkill3 = const Value.absent(),
    this.exSkill4 = const Value.absent(),
    this.exSkill5 = const Value.absent(),
    this.exSkillEvolution1 = const Value.absent(),
    this.exSkillEvolution2 = const Value.absent(),
    this.exSkillEvolution3 = const Value.absent(),
    this.exSkillEvolution4 = const Value.absent(),
    this.exSkillEvolution5 = const Value.absent(),
    this.spSkill1 = const Value.absent(),
    this.spSkill2 = const Value.absent(),
    this.spSkill3 = const Value.absent(),
    this.spSkill4 = const Value.absent(),
    this.spSkill5 = const Value.absent(),
    this.spSkillEvolution1 = const Value.absent(),
    this.spSkillEvolution2 = const Value.absent(),
  });
  UnitSkillDataCompanion.insert({
    this.unitId = const Value.absent(),
    required int unionBurst,
    required int spUnionBurst,
    this.unionBurstEvolution = const Value.absent(),
    required int mainSkill1,
    required int mainSkill2,
    required int mainSkill3,
    required int mainSkill4,
    required int mainSkill5,
    required int mainSkill6,
    required int mainSkill7,
    required int mainSkill8,
    required int mainSkill9,
    required int mainSkill10,
    this.mainSkillEvolution1 = const Value.absent(),
    this.mainSkillEvolution2 = const Value.absent(),
    required int exSkill1,
    required int exSkill2,
    required int exSkill3,
    required int exSkill4,
    required int exSkill5,
    this.exSkillEvolution1 = const Value.absent(),
    this.exSkillEvolution2 = const Value.absent(),
    this.exSkillEvolution3 = const Value.absent(),
    this.exSkillEvolution4 = const Value.absent(),
    this.exSkillEvolution5 = const Value.absent(),
    required int spSkill1,
    required int spSkill2,
    required int spSkill3,
    required int spSkill4,
    required int spSkill5,
    this.spSkillEvolution1 = const Value.absent(),
    this.spSkillEvolution2 = const Value.absent(),
  }) : unionBurst = Value(unionBurst),
       spUnionBurst = Value(spUnionBurst),
       mainSkill1 = Value(mainSkill1),
       mainSkill2 = Value(mainSkill2),
       mainSkill3 = Value(mainSkill3),
       mainSkill4 = Value(mainSkill4),
       mainSkill5 = Value(mainSkill5),
       mainSkill6 = Value(mainSkill6),
       mainSkill7 = Value(mainSkill7),
       mainSkill8 = Value(mainSkill8),
       mainSkill9 = Value(mainSkill9),
       mainSkill10 = Value(mainSkill10),
       exSkill1 = Value(exSkill1),
       exSkill2 = Value(exSkill2),
       exSkill3 = Value(exSkill3),
       exSkill4 = Value(exSkill4),
       exSkill5 = Value(exSkill5),
       spSkill1 = Value(spSkill1),
       spSkill2 = Value(spSkill2),
       spSkill3 = Value(spSkill3),
       spSkill4 = Value(spSkill4),
       spSkill5 = Value(spSkill5);
  static Insertable<UnitSkillDataData> custom({
    Expression<int>? unitId,
    Expression<int>? unionBurst,
    Expression<int>? spUnionBurst,
    Expression<int>? unionBurstEvolution,
    Expression<int>? mainSkill1,
    Expression<int>? mainSkill2,
    Expression<int>? mainSkill3,
    Expression<int>? mainSkill4,
    Expression<int>? mainSkill5,
    Expression<int>? mainSkill6,
    Expression<int>? mainSkill7,
    Expression<int>? mainSkill8,
    Expression<int>? mainSkill9,
    Expression<int>? mainSkill10,
    Expression<int>? mainSkillEvolution1,
    Expression<int>? mainSkillEvolution2,
    Expression<int>? exSkill1,
    Expression<int>? exSkill2,
    Expression<int>? exSkill3,
    Expression<int>? exSkill4,
    Expression<int>? exSkill5,
    Expression<int>? exSkillEvolution1,
    Expression<int>? exSkillEvolution2,
    Expression<int>? exSkillEvolution3,
    Expression<int>? exSkillEvolution4,
    Expression<int>? exSkillEvolution5,
    Expression<int>? spSkill1,
    Expression<int>? spSkill2,
    Expression<int>? spSkill3,
    Expression<int>? spSkill4,
    Expression<int>? spSkill5,
    Expression<int>? spSkillEvolution1,
    Expression<int>? spSkillEvolution2,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (unionBurst != null) 'union_burst': unionBurst,
      if (spUnionBurst != null) 'sp_union_burst': spUnionBurst,
      if (unionBurstEvolution != null)
        'union_burst_evolution': unionBurstEvolution,
      if (mainSkill1 != null) 'main_skill_1': mainSkill1,
      if (mainSkill2 != null) 'main_skill_2': mainSkill2,
      if (mainSkill3 != null) 'main_skill_3': mainSkill3,
      if (mainSkill4 != null) 'main_skill_4': mainSkill4,
      if (mainSkill5 != null) 'main_skill_5': mainSkill5,
      if (mainSkill6 != null) 'main_skill_6': mainSkill6,
      if (mainSkill7 != null) 'main_skill_7': mainSkill7,
      if (mainSkill8 != null) 'main_skill_8': mainSkill8,
      if (mainSkill9 != null) 'main_skill_9': mainSkill9,
      if (mainSkill10 != null) 'main_skill_10': mainSkill10,
      if (mainSkillEvolution1 != null)
        'main_skill_evolution_1': mainSkillEvolution1,
      if (mainSkillEvolution2 != null)
        'main_skill_evolution_2': mainSkillEvolution2,
      if (exSkill1 != null) 'ex_skill_1': exSkill1,
      if (exSkill2 != null) 'ex_skill_2': exSkill2,
      if (exSkill3 != null) 'ex_skill_3': exSkill3,
      if (exSkill4 != null) 'ex_skill_4': exSkill4,
      if (exSkill5 != null) 'ex_skill_5': exSkill5,
      if (exSkillEvolution1 != null) 'ex_skill_evolution_1': exSkillEvolution1,
      if (exSkillEvolution2 != null) 'ex_skill_evolution_2': exSkillEvolution2,
      if (exSkillEvolution3 != null) 'ex_skill_evolution_3': exSkillEvolution3,
      if (exSkillEvolution4 != null) 'ex_skill_evolution_4': exSkillEvolution4,
      if (exSkillEvolution5 != null) 'ex_skill_evolution_5': exSkillEvolution5,
      if (spSkill1 != null) 'sp_skill_1': spSkill1,
      if (spSkill2 != null) 'sp_skill_2': spSkill2,
      if (spSkill3 != null) 'sp_skill_3': spSkill3,
      if (spSkill4 != null) 'sp_skill_4': spSkill4,
      if (spSkill5 != null) 'sp_skill_5': spSkill5,
      if (spSkillEvolution1 != null) 'sp_skill_evolution_1': spSkillEvolution1,
      if (spSkillEvolution2 != null) 'sp_skill_evolution_2': spSkillEvolution2,
    });
  }

  UnitSkillDataCompanion copyWith({
    Value<int>? unitId,
    Value<int>? unionBurst,
    Value<int>? spUnionBurst,
    Value<int?>? unionBurstEvolution,
    Value<int>? mainSkill1,
    Value<int>? mainSkill2,
    Value<int>? mainSkill3,
    Value<int>? mainSkill4,
    Value<int>? mainSkill5,
    Value<int>? mainSkill6,
    Value<int>? mainSkill7,
    Value<int>? mainSkill8,
    Value<int>? mainSkill9,
    Value<int>? mainSkill10,
    Value<int?>? mainSkillEvolution1,
    Value<int?>? mainSkillEvolution2,
    Value<int>? exSkill1,
    Value<int>? exSkill2,
    Value<int>? exSkill3,
    Value<int>? exSkill4,
    Value<int>? exSkill5,
    Value<int?>? exSkillEvolution1,
    Value<int?>? exSkillEvolution2,
    Value<int?>? exSkillEvolution3,
    Value<int?>? exSkillEvolution4,
    Value<int?>? exSkillEvolution5,
    Value<int>? spSkill1,
    Value<int>? spSkill2,
    Value<int>? spSkill3,
    Value<int>? spSkill4,
    Value<int>? spSkill5,
    Value<int?>? spSkillEvolution1,
    Value<int?>? spSkillEvolution2,
  }) {
    return UnitSkillDataCompanion(
      unitId: unitId ?? this.unitId,
      unionBurst: unionBurst ?? this.unionBurst,
      spUnionBurst: spUnionBurst ?? this.spUnionBurst,
      unionBurstEvolution: unionBurstEvolution ?? this.unionBurstEvolution,
      mainSkill1: mainSkill1 ?? this.mainSkill1,
      mainSkill2: mainSkill2 ?? this.mainSkill2,
      mainSkill3: mainSkill3 ?? this.mainSkill3,
      mainSkill4: mainSkill4 ?? this.mainSkill4,
      mainSkill5: mainSkill5 ?? this.mainSkill5,
      mainSkill6: mainSkill6 ?? this.mainSkill6,
      mainSkill7: mainSkill7 ?? this.mainSkill7,
      mainSkill8: mainSkill8 ?? this.mainSkill8,
      mainSkill9: mainSkill9 ?? this.mainSkill9,
      mainSkill10: mainSkill10 ?? this.mainSkill10,
      mainSkillEvolution1: mainSkillEvolution1 ?? this.mainSkillEvolution1,
      mainSkillEvolution2: mainSkillEvolution2 ?? this.mainSkillEvolution2,
      exSkill1: exSkill1 ?? this.exSkill1,
      exSkill2: exSkill2 ?? this.exSkill2,
      exSkill3: exSkill3 ?? this.exSkill3,
      exSkill4: exSkill4 ?? this.exSkill4,
      exSkill5: exSkill5 ?? this.exSkill5,
      exSkillEvolution1: exSkillEvolution1 ?? this.exSkillEvolution1,
      exSkillEvolution2: exSkillEvolution2 ?? this.exSkillEvolution2,
      exSkillEvolution3: exSkillEvolution3 ?? this.exSkillEvolution3,
      exSkillEvolution4: exSkillEvolution4 ?? this.exSkillEvolution4,
      exSkillEvolution5: exSkillEvolution5 ?? this.exSkillEvolution5,
      spSkill1: spSkill1 ?? this.spSkill1,
      spSkill2: spSkill2 ?? this.spSkill2,
      spSkill3: spSkill3 ?? this.spSkill3,
      spSkill4: spSkill4 ?? this.spSkill4,
      spSkill5: spSkill5 ?? this.spSkill5,
      spSkillEvolution1: spSkillEvolution1 ?? this.spSkillEvolution1,
      spSkillEvolution2: spSkillEvolution2 ?? this.spSkillEvolution2,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (unionBurst.present) {
      map['union_burst'] = Variable<int>(unionBurst.value);
    }
    if (spUnionBurst.present) {
      map['sp_union_burst'] = Variable<int>(spUnionBurst.value);
    }
    if (unionBurstEvolution.present) {
      map['union_burst_evolution'] = Variable<int>(unionBurstEvolution.value);
    }
    if (mainSkill1.present) {
      map['main_skill_1'] = Variable<int>(mainSkill1.value);
    }
    if (mainSkill2.present) {
      map['main_skill_2'] = Variable<int>(mainSkill2.value);
    }
    if (mainSkill3.present) {
      map['main_skill_3'] = Variable<int>(mainSkill3.value);
    }
    if (mainSkill4.present) {
      map['main_skill_4'] = Variable<int>(mainSkill4.value);
    }
    if (mainSkill5.present) {
      map['main_skill_5'] = Variable<int>(mainSkill5.value);
    }
    if (mainSkill6.present) {
      map['main_skill_6'] = Variable<int>(mainSkill6.value);
    }
    if (mainSkill7.present) {
      map['main_skill_7'] = Variable<int>(mainSkill7.value);
    }
    if (mainSkill8.present) {
      map['main_skill_8'] = Variable<int>(mainSkill8.value);
    }
    if (mainSkill9.present) {
      map['main_skill_9'] = Variable<int>(mainSkill9.value);
    }
    if (mainSkill10.present) {
      map['main_skill_10'] = Variable<int>(mainSkill10.value);
    }
    if (mainSkillEvolution1.present) {
      map['main_skill_evolution_1'] = Variable<int>(mainSkillEvolution1.value);
    }
    if (mainSkillEvolution2.present) {
      map['main_skill_evolution_2'] = Variable<int>(mainSkillEvolution2.value);
    }
    if (exSkill1.present) {
      map['ex_skill_1'] = Variable<int>(exSkill1.value);
    }
    if (exSkill2.present) {
      map['ex_skill_2'] = Variable<int>(exSkill2.value);
    }
    if (exSkill3.present) {
      map['ex_skill_3'] = Variable<int>(exSkill3.value);
    }
    if (exSkill4.present) {
      map['ex_skill_4'] = Variable<int>(exSkill4.value);
    }
    if (exSkill5.present) {
      map['ex_skill_5'] = Variable<int>(exSkill5.value);
    }
    if (exSkillEvolution1.present) {
      map['ex_skill_evolution_1'] = Variable<int>(exSkillEvolution1.value);
    }
    if (exSkillEvolution2.present) {
      map['ex_skill_evolution_2'] = Variable<int>(exSkillEvolution2.value);
    }
    if (exSkillEvolution3.present) {
      map['ex_skill_evolution_3'] = Variable<int>(exSkillEvolution3.value);
    }
    if (exSkillEvolution4.present) {
      map['ex_skill_evolution_4'] = Variable<int>(exSkillEvolution4.value);
    }
    if (exSkillEvolution5.present) {
      map['ex_skill_evolution_5'] = Variable<int>(exSkillEvolution5.value);
    }
    if (spSkill1.present) {
      map['sp_skill_1'] = Variable<int>(spSkill1.value);
    }
    if (spSkill2.present) {
      map['sp_skill_2'] = Variable<int>(spSkill2.value);
    }
    if (spSkill3.present) {
      map['sp_skill_3'] = Variable<int>(spSkill3.value);
    }
    if (spSkill4.present) {
      map['sp_skill_4'] = Variable<int>(spSkill4.value);
    }
    if (spSkill5.present) {
      map['sp_skill_5'] = Variable<int>(spSkill5.value);
    }
    if (spSkillEvolution1.present) {
      map['sp_skill_evolution_1'] = Variable<int>(spSkillEvolution1.value);
    }
    if (spSkillEvolution2.present) {
      map['sp_skill_evolution_2'] = Variable<int>(spSkillEvolution2.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitSkillDataCompanion(')
          ..write('unitId: $unitId, ')
          ..write('unionBurst: $unionBurst, ')
          ..write('spUnionBurst: $spUnionBurst, ')
          ..write('unionBurstEvolution: $unionBurstEvolution, ')
          ..write('mainSkill1: $mainSkill1, ')
          ..write('mainSkill2: $mainSkill2, ')
          ..write('mainSkill3: $mainSkill3, ')
          ..write('mainSkill4: $mainSkill4, ')
          ..write('mainSkill5: $mainSkill5, ')
          ..write('mainSkill6: $mainSkill6, ')
          ..write('mainSkill7: $mainSkill7, ')
          ..write('mainSkill8: $mainSkill8, ')
          ..write('mainSkill9: $mainSkill9, ')
          ..write('mainSkill10: $mainSkill10, ')
          ..write('mainSkillEvolution1: $mainSkillEvolution1, ')
          ..write('mainSkillEvolution2: $mainSkillEvolution2, ')
          ..write('exSkill1: $exSkill1, ')
          ..write('exSkill2: $exSkill2, ')
          ..write('exSkill3: $exSkill3, ')
          ..write('exSkill4: $exSkill4, ')
          ..write('exSkill5: $exSkill5, ')
          ..write('exSkillEvolution1: $exSkillEvolution1, ')
          ..write('exSkillEvolution2: $exSkillEvolution2, ')
          ..write('exSkillEvolution3: $exSkillEvolution3, ')
          ..write('exSkillEvolution4: $exSkillEvolution4, ')
          ..write('exSkillEvolution5: $exSkillEvolution5, ')
          ..write('spSkill1: $spSkill1, ')
          ..write('spSkill2: $spSkill2, ')
          ..write('spSkill3: $spSkill3, ')
          ..write('spSkill4: $spSkill4, ')
          ..write('spSkill5: $spSkill5, ')
          ..write('spSkillEvolution1: $spSkillEvolution1, ')
          ..write('spSkillEvolution2: $spSkillEvolution2')
          ..write(')'))
        .toString();
  }
}

class $SkillActionTable extends SkillAction
    with TableInfo<$SkillActionTable, SkillActionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillActionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actionIdMeta = const VerificationMeta(
    'actionId',
  );
  @override
  late final GeneratedColumn<int> actionId = GeneratedColumn<int>(
    'action_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  @override
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<int> actionType = GeneratedColumn<int>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDetail1Meta = const VerificationMeta(
    'actionDetail1',
  );
  @override
  late final GeneratedColumn<int> actionDetail1 = GeneratedColumn<int>(
    'action_detail_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDetail2Meta = const VerificationMeta(
    'actionDetail2',
  );
  @override
  late final GeneratedColumn<int> actionDetail2 = GeneratedColumn<int>(
    'action_detail_2',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionDetail3Meta = const VerificationMeta(
    'actionDetail3',
  );
  @override
  late final GeneratedColumn<int> actionDetail3 = GeneratedColumn<int>(
    'action_detail_3',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue1Meta = const VerificationMeta(
    'actionValue1',
  );
  @override
  late final GeneratedColumn<double> actionValue1 = GeneratedColumn<double>(
    'action_value_1',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue2Meta = const VerificationMeta(
    'actionValue2',
  );
  @override
  late final GeneratedColumn<double> actionValue2 = GeneratedColumn<double>(
    'action_value_2',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue3Meta = const VerificationMeta(
    'actionValue3',
  );
  @override
  late final GeneratedColumn<double> actionValue3 = GeneratedColumn<double>(
    'action_value_3',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue4Meta = const VerificationMeta(
    'actionValue4',
  );
  @override
  late final GeneratedColumn<double> actionValue4 = GeneratedColumn<double>(
    'action_value_4',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue5Meta = const VerificationMeta(
    'actionValue5',
  );
  @override
  late final GeneratedColumn<double> actionValue5 = GeneratedColumn<double>(
    'action_value_5',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue6Meta = const VerificationMeta(
    'actionValue6',
  );
  @override
  late final GeneratedColumn<double> actionValue6 = GeneratedColumn<double>(
    'action_value_6',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionValue7Meta = const VerificationMeta(
    'actionValue7',
  );
  @override
  late final GeneratedColumn<double> actionValue7 = GeneratedColumn<double>(
    'action_value_7',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetAssignmentMeta = const VerificationMeta(
    'targetAssignment',
  );
  @override
  late final GeneratedColumn<int> targetAssignment = GeneratedColumn<int>(
    'target_assignment',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetAreaMeta = const VerificationMeta(
    'targetArea',
  );
  @override
  late final GeneratedColumn<int> targetArea = GeneratedColumn<int>(
    'target_area',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetRangeMeta = const VerificationMeta(
    'targetRange',
  );
  @override
  late final GeneratedColumn<int> targetRange = GeneratedColumn<int>(
    'target_range',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetTypeMeta = const VerificationMeta(
    'targetType',
  );
  @override
  late final GeneratedColumn<int> targetType = GeneratedColumn<int>(
    'target_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetNumberMeta = const VerificationMeta(
    'targetNumber',
  );
  @override
  late final GeneratedColumn<int> targetNumber = GeneratedColumn<int>(
    'target_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetCountMeta = const VerificationMeta(
    'targetCount',
  );
  @override
  late final GeneratedColumn<int> targetCount = GeneratedColumn<int>(
    'target_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _levelUpDispMeta = const VerificationMeta(
    'levelUpDisp',
  );
  @override
  late final GeneratedColumn<String> levelUpDisp = GeneratedColumn<String>(
    'level_up_disp',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    actionId,
    classId,
    actionType,
    actionDetail1,
    actionDetail2,
    actionDetail3,
    actionValue1,
    actionValue2,
    actionValue3,
    actionValue4,
    actionValue5,
    actionValue6,
    actionValue7,
    targetAssignment,
    targetArea,
    targetRange,
    targetType,
    targetNumber,
    targetCount,
    description,
    levelUpDisp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skill_action';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillActionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('action_id')) {
      context.handle(
        _actionIdMeta,
        actionId.isAcceptableOrUnknown(data['action_id']!, _actionIdMeta),
      );
    }
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('action_detail_1')) {
      context.handle(
        _actionDetail1Meta,
        actionDetail1.isAcceptableOrUnknown(
          data['action_detail_1']!,
          _actionDetail1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDetail1Meta);
    }
    if (data.containsKey('action_detail_2')) {
      context.handle(
        _actionDetail2Meta,
        actionDetail2.isAcceptableOrUnknown(
          data['action_detail_2']!,
          _actionDetail2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDetail2Meta);
    }
    if (data.containsKey('action_detail_3')) {
      context.handle(
        _actionDetail3Meta,
        actionDetail3.isAcceptableOrUnknown(
          data['action_detail_3']!,
          _actionDetail3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionDetail3Meta);
    }
    if (data.containsKey('action_value_1')) {
      context.handle(
        _actionValue1Meta,
        actionValue1.isAcceptableOrUnknown(
          data['action_value_1']!,
          _actionValue1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue1Meta);
    }
    if (data.containsKey('action_value_2')) {
      context.handle(
        _actionValue2Meta,
        actionValue2.isAcceptableOrUnknown(
          data['action_value_2']!,
          _actionValue2Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue2Meta);
    }
    if (data.containsKey('action_value_3')) {
      context.handle(
        _actionValue3Meta,
        actionValue3.isAcceptableOrUnknown(
          data['action_value_3']!,
          _actionValue3Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue3Meta);
    }
    if (data.containsKey('action_value_4')) {
      context.handle(
        _actionValue4Meta,
        actionValue4.isAcceptableOrUnknown(
          data['action_value_4']!,
          _actionValue4Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue4Meta);
    }
    if (data.containsKey('action_value_5')) {
      context.handle(
        _actionValue5Meta,
        actionValue5.isAcceptableOrUnknown(
          data['action_value_5']!,
          _actionValue5Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue5Meta);
    }
    if (data.containsKey('action_value_6')) {
      context.handle(
        _actionValue6Meta,
        actionValue6.isAcceptableOrUnknown(
          data['action_value_6']!,
          _actionValue6Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue6Meta);
    }
    if (data.containsKey('action_value_7')) {
      context.handle(
        _actionValue7Meta,
        actionValue7.isAcceptableOrUnknown(
          data['action_value_7']!,
          _actionValue7Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actionValue7Meta);
    }
    if (data.containsKey('target_assignment')) {
      context.handle(
        _targetAssignmentMeta,
        targetAssignment.isAcceptableOrUnknown(
          data['target_assignment']!,
          _targetAssignmentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetAssignmentMeta);
    }
    if (data.containsKey('target_area')) {
      context.handle(
        _targetAreaMeta,
        targetArea.isAcceptableOrUnknown(data['target_area']!, _targetAreaMeta),
      );
    } else if (isInserting) {
      context.missing(_targetAreaMeta);
    }
    if (data.containsKey('target_range')) {
      context.handle(
        _targetRangeMeta,
        targetRange.isAcceptableOrUnknown(
          data['target_range']!,
          _targetRangeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetRangeMeta);
    }
    if (data.containsKey('target_type')) {
      context.handle(
        _targetTypeMeta,
        targetType.isAcceptableOrUnknown(data['target_type']!, _targetTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_targetTypeMeta);
    }
    if (data.containsKey('target_number')) {
      context.handle(
        _targetNumberMeta,
        targetNumber.isAcceptableOrUnknown(
          data['target_number']!,
          _targetNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetNumberMeta);
    }
    if (data.containsKey('target_count')) {
      context.handle(
        _targetCountMeta,
        targetCount.isAcceptableOrUnknown(
          data['target_count']!,
          _targetCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetCountMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('level_up_disp')) {
      context.handle(
        _levelUpDispMeta,
        levelUpDisp.isAcceptableOrUnknown(
          data['level_up_disp']!,
          _levelUpDispMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {actionId};
  @override
  SkillActionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillActionData(
      actionId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_id'],
          )!,
      classId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}class_id'],
          )!,
      actionType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_type'],
          )!,
      actionDetail1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_detail_1'],
          )!,
      actionDetail2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_detail_2'],
          )!,
      actionDetail3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}action_detail_3'],
          )!,
      actionValue1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_1'],
          )!,
      actionValue2:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_2'],
          )!,
      actionValue3:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_3'],
          )!,
      actionValue4:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_4'],
          )!,
      actionValue5:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_5'],
          )!,
      actionValue6:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_6'],
          )!,
      actionValue7:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}action_value_7'],
          )!,
      targetAssignment:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_assignment'],
          )!,
      targetArea:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_area'],
          )!,
      targetRange:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_range'],
          )!,
      targetType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_type'],
          )!,
      targetNumber:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_number'],
          )!,
      targetCount:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}target_count'],
          )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      levelUpDisp: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}level_up_disp'],
      ),
    );
  }

  @override
  $SkillActionTable createAlias(String alias) {
    return $SkillActionTable(attachedDatabase, alias);
  }
}

class SkillActionData extends DataClass implements Insertable<SkillActionData> {
  final int actionId;
  final int classId;
  final int actionType;
  final int actionDetail1;
  final int actionDetail2;
  final int actionDetail3;
  final double actionValue1;
  final double actionValue2;
  final double actionValue3;
  final double actionValue4;
  final double actionValue5;
  final double actionValue6;
  final double actionValue7;
  final int targetAssignment;
  final int targetArea;
  final int targetRange;
  final int targetType;
  final int targetNumber;
  final int targetCount;
  final String? description;
  final String? levelUpDisp;
  const SkillActionData({
    required this.actionId,
    required this.classId,
    required this.actionType,
    required this.actionDetail1,
    required this.actionDetail2,
    required this.actionDetail3,
    required this.actionValue1,
    required this.actionValue2,
    required this.actionValue3,
    required this.actionValue4,
    required this.actionValue5,
    required this.actionValue6,
    required this.actionValue7,
    required this.targetAssignment,
    required this.targetArea,
    required this.targetRange,
    required this.targetType,
    required this.targetNumber,
    required this.targetCount,
    this.description,
    this.levelUpDisp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['action_id'] = Variable<int>(actionId);
    map['class_id'] = Variable<int>(classId);
    map['action_type'] = Variable<int>(actionType);
    map['action_detail_1'] = Variable<int>(actionDetail1);
    map['action_detail_2'] = Variable<int>(actionDetail2);
    map['action_detail_3'] = Variable<int>(actionDetail3);
    map['action_value_1'] = Variable<double>(actionValue1);
    map['action_value_2'] = Variable<double>(actionValue2);
    map['action_value_3'] = Variable<double>(actionValue3);
    map['action_value_4'] = Variable<double>(actionValue4);
    map['action_value_5'] = Variable<double>(actionValue5);
    map['action_value_6'] = Variable<double>(actionValue6);
    map['action_value_7'] = Variable<double>(actionValue7);
    map['target_assignment'] = Variable<int>(targetAssignment);
    map['target_area'] = Variable<int>(targetArea);
    map['target_range'] = Variable<int>(targetRange);
    map['target_type'] = Variable<int>(targetType);
    map['target_number'] = Variable<int>(targetNumber);
    map['target_count'] = Variable<int>(targetCount);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || levelUpDisp != null) {
      map['level_up_disp'] = Variable<String>(levelUpDisp);
    }
    return map;
  }

  SkillActionCompanion toCompanion(bool nullToAbsent) {
    return SkillActionCompanion(
      actionId: Value(actionId),
      classId: Value(classId),
      actionType: Value(actionType),
      actionDetail1: Value(actionDetail1),
      actionDetail2: Value(actionDetail2),
      actionDetail3: Value(actionDetail3),
      actionValue1: Value(actionValue1),
      actionValue2: Value(actionValue2),
      actionValue3: Value(actionValue3),
      actionValue4: Value(actionValue4),
      actionValue5: Value(actionValue5),
      actionValue6: Value(actionValue6),
      actionValue7: Value(actionValue7),
      targetAssignment: Value(targetAssignment),
      targetArea: Value(targetArea),
      targetRange: Value(targetRange),
      targetType: Value(targetType),
      targetNumber: Value(targetNumber),
      targetCount: Value(targetCount),
      description:
          description == null && nullToAbsent
              ? const Value.absent()
              : Value(description),
      levelUpDisp:
          levelUpDisp == null && nullToAbsent
              ? const Value.absent()
              : Value(levelUpDisp),
    );
  }

  factory SkillActionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillActionData(
      actionId: serializer.fromJson<int>(json['actionId']),
      classId: serializer.fromJson<int>(json['classId']),
      actionType: serializer.fromJson<int>(json['actionType']),
      actionDetail1: serializer.fromJson<int>(json['actionDetail1']),
      actionDetail2: serializer.fromJson<int>(json['actionDetail2']),
      actionDetail3: serializer.fromJson<int>(json['actionDetail3']),
      actionValue1: serializer.fromJson<double>(json['actionValue1']),
      actionValue2: serializer.fromJson<double>(json['actionValue2']),
      actionValue3: serializer.fromJson<double>(json['actionValue3']),
      actionValue4: serializer.fromJson<double>(json['actionValue4']),
      actionValue5: serializer.fromJson<double>(json['actionValue5']),
      actionValue6: serializer.fromJson<double>(json['actionValue6']),
      actionValue7: serializer.fromJson<double>(json['actionValue7']),
      targetAssignment: serializer.fromJson<int>(json['targetAssignment']),
      targetArea: serializer.fromJson<int>(json['targetArea']),
      targetRange: serializer.fromJson<int>(json['targetRange']),
      targetType: serializer.fromJson<int>(json['targetType']),
      targetNumber: serializer.fromJson<int>(json['targetNumber']),
      targetCount: serializer.fromJson<int>(json['targetCount']),
      description: serializer.fromJson<String?>(json['description']),
      levelUpDisp: serializer.fromJson<String?>(json['levelUpDisp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actionId': serializer.toJson<int>(actionId),
      'classId': serializer.toJson<int>(classId),
      'actionType': serializer.toJson<int>(actionType),
      'actionDetail1': serializer.toJson<int>(actionDetail1),
      'actionDetail2': serializer.toJson<int>(actionDetail2),
      'actionDetail3': serializer.toJson<int>(actionDetail3),
      'actionValue1': serializer.toJson<double>(actionValue1),
      'actionValue2': serializer.toJson<double>(actionValue2),
      'actionValue3': serializer.toJson<double>(actionValue3),
      'actionValue4': serializer.toJson<double>(actionValue4),
      'actionValue5': serializer.toJson<double>(actionValue5),
      'actionValue6': serializer.toJson<double>(actionValue6),
      'actionValue7': serializer.toJson<double>(actionValue7),
      'targetAssignment': serializer.toJson<int>(targetAssignment),
      'targetArea': serializer.toJson<int>(targetArea),
      'targetRange': serializer.toJson<int>(targetRange),
      'targetType': serializer.toJson<int>(targetType),
      'targetNumber': serializer.toJson<int>(targetNumber),
      'targetCount': serializer.toJson<int>(targetCount),
      'description': serializer.toJson<String?>(description),
      'levelUpDisp': serializer.toJson<String?>(levelUpDisp),
    };
  }

  SkillActionData copyWith({
    int? actionId,
    int? classId,
    int? actionType,
    int? actionDetail1,
    int? actionDetail2,
    int? actionDetail3,
    double? actionValue1,
    double? actionValue2,
    double? actionValue3,
    double? actionValue4,
    double? actionValue5,
    double? actionValue6,
    double? actionValue7,
    int? targetAssignment,
    int? targetArea,
    int? targetRange,
    int? targetType,
    int? targetNumber,
    int? targetCount,
    Value<String?> description = const Value.absent(),
    Value<String?> levelUpDisp = const Value.absent(),
  }) => SkillActionData(
    actionId: actionId ?? this.actionId,
    classId: classId ?? this.classId,
    actionType: actionType ?? this.actionType,
    actionDetail1: actionDetail1 ?? this.actionDetail1,
    actionDetail2: actionDetail2 ?? this.actionDetail2,
    actionDetail3: actionDetail3 ?? this.actionDetail3,
    actionValue1: actionValue1 ?? this.actionValue1,
    actionValue2: actionValue2 ?? this.actionValue2,
    actionValue3: actionValue3 ?? this.actionValue3,
    actionValue4: actionValue4 ?? this.actionValue4,
    actionValue5: actionValue5 ?? this.actionValue5,
    actionValue6: actionValue6 ?? this.actionValue6,
    actionValue7: actionValue7 ?? this.actionValue7,
    targetAssignment: targetAssignment ?? this.targetAssignment,
    targetArea: targetArea ?? this.targetArea,
    targetRange: targetRange ?? this.targetRange,
    targetType: targetType ?? this.targetType,
    targetNumber: targetNumber ?? this.targetNumber,
    targetCount: targetCount ?? this.targetCount,
    description: description.present ? description.value : this.description,
    levelUpDisp: levelUpDisp.present ? levelUpDisp.value : this.levelUpDisp,
  );
  SkillActionData copyWithCompanion(SkillActionCompanion data) {
    return SkillActionData(
      actionId: data.actionId.present ? data.actionId.value : this.actionId,
      classId: data.classId.present ? data.classId.value : this.classId,
      actionType:
          data.actionType.present ? data.actionType.value : this.actionType,
      actionDetail1:
          data.actionDetail1.present
              ? data.actionDetail1.value
              : this.actionDetail1,
      actionDetail2:
          data.actionDetail2.present
              ? data.actionDetail2.value
              : this.actionDetail2,
      actionDetail3:
          data.actionDetail3.present
              ? data.actionDetail3.value
              : this.actionDetail3,
      actionValue1:
          data.actionValue1.present
              ? data.actionValue1.value
              : this.actionValue1,
      actionValue2:
          data.actionValue2.present
              ? data.actionValue2.value
              : this.actionValue2,
      actionValue3:
          data.actionValue3.present
              ? data.actionValue3.value
              : this.actionValue3,
      actionValue4:
          data.actionValue4.present
              ? data.actionValue4.value
              : this.actionValue4,
      actionValue5:
          data.actionValue5.present
              ? data.actionValue5.value
              : this.actionValue5,
      actionValue6:
          data.actionValue6.present
              ? data.actionValue6.value
              : this.actionValue6,
      actionValue7:
          data.actionValue7.present
              ? data.actionValue7.value
              : this.actionValue7,
      targetAssignment:
          data.targetAssignment.present
              ? data.targetAssignment.value
              : this.targetAssignment,
      targetArea:
          data.targetArea.present ? data.targetArea.value : this.targetArea,
      targetRange:
          data.targetRange.present ? data.targetRange.value : this.targetRange,
      targetType:
          data.targetType.present ? data.targetType.value : this.targetType,
      targetNumber:
          data.targetNumber.present
              ? data.targetNumber.value
              : this.targetNumber,
      targetCount:
          data.targetCount.present ? data.targetCount.value : this.targetCount,
      description:
          data.description.present ? data.description.value : this.description,
      levelUpDisp:
          data.levelUpDisp.present ? data.levelUpDisp.value : this.levelUpDisp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillActionData(')
          ..write('actionId: $actionId, ')
          ..write('classId: $classId, ')
          ..write('actionType: $actionType, ')
          ..write('actionDetail1: $actionDetail1, ')
          ..write('actionDetail2: $actionDetail2, ')
          ..write('actionDetail3: $actionDetail3, ')
          ..write('actionValue1: $actionValue1, ')
          ..write('actionValue2: $actionValue2, ')
          ..write('actionValue3: $actionValue3, ')
          ..write('actionValue4: $actionValue4, ')
          ..write('actionValue5: $actionValue5, ')
          ..write('actionValue6: $actionValue6, ')
          ..write('actionValue7: $actionValue7, ')
          ..write('targetAssignment: $targetAssignment, ')
          ..write('targetArea: $targetArea, ')
          ..write('targetRange: $targetRange, ')
          ..write('targetType: $targetType, ')
          ..write('targetNumber: $targetNumber, ')
          ..write('targetCount: $targetCount, ')
          ..write('description: $description, ')
          ..write('levelUpDisp: $levelUpDisp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    actionId,
    classId,
    actionType,
    actionDetail1,
    actionDetail2,
    actionDetail3,
    actionValue1,
    actionValue2,
    actionValue3,
    actionValue4,
    actionValue5,
    actionValue6,
    actionValue7,
    targetAssignment,
    targetArea,
    targetRange,
    targetType,
    targetNumber,
    targetCount,
    description,
    levelUpDisp,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillActionData &&
          other.actionId == this.actionId &&
          other.classId == this.classId &&
          other.actionType == this.actionType &&
          other.actionDetail1 == this.actionDetail1 &&
          other.actionDetail2 == this.actionDetail2 &&
          other.actionDetail3 == this.actionDetail3 &&
          other.actionValue1 == this.actionValue1 &&
          other.actionValue2 == this.actionValue2 &&
          other.actionValue3 == this.actionValue3 &&
          other.actionValue4 == this.actionValue4 &&
          other.actionValue5 == this.actionValue5 &&
          other.actionValue6 == this.actionValue6 &&
          other.actionValue7 == this.actionValue7 &&
          other.targetAssignment == this.targetAssignment &&
          other.targetArea == this.targetArea &&
          other.targetRange == this.targetRange &&
          other.targetType == this.targetType &&
          other.targetNumber == this.targetNumber &&
          other.targetCount == this.targetCount &&
          other.description == this.description &&
          other.levelUpDisp == this.levelUpDisp);
}

class SkillActionCompanion extends UpdateCompanion<SkillActionData> {
  final Value<int> actionId;
  final Value<int> classId;
  final Value<int> actionType;
  final Value<int> actionDetail1;
  final Value<int> actionDetail2;
  final Value<int> actionDetail3;
  final Value<double> actionValue1;
  final Value<double> actionValue2;
  final Value<double> actionValue3;
  final Value<double> actionValue4;
  final Value<double> actionValue5;
  final Value<double> actionValue6;
  final Value<double> actionValue7;
  final Value<int> targetAssignment;
  final Value<int> targetArea;
  final Value<int> targetRange;
  final Value<int> targetType;
  final Value<int> targetNumber;
  final Value<int> targetCount;
  final Value<String?> description;
  final Value<String?> levelUpDisp;
  const SkillActionCompanion({
    this.actionId = const Value.absent(),
    this.classId = const Value.absent(),
    this.actionType = const Value.absent(),
    this.actionDetail1 = const Value.absent(),
    this.actionDetail2 = const Value.absent(),
    this.actionDetail3 = const Value.absent(),
    this.actionValue1 = const Value.absent(),
    this.actionValue2 = const Value.absent(),
    this.actionValue3 = const Value.absent(),
    this.actionValue4 = const Value.absent(),
    this.actionValue5 = const Value.absent(),
    this.actionValue6 = const Value.absent(),
    this.actionValue7 = const Value.absent(),
    this.targetAssignment = const Value.absent(),
    this.targetArea = const Value.absent(),
    this.targetRange = const Value.absent(),
    this.targetType = const Value.absent(),
    this.targetNumber = const Value.absent(),
    this.targetCount = const Value.absent(),
    this.description = const Value.absent(),
    this.levelUpDisp = const Value.absent(),
  });
  SkillActionCompanion.insert({
    this.actionId = const Value.absent(),
    required int classId,
    required int actionType,
    required int actionDetail1,
    required int actionDetail2,
    required int actionDetail3,
    required double actionValue1,
    required double actionValue2,
    required double actionValue3,
    required double actionValue4,
    required double actionValue5,
    required double actionValue6,
    required double actionValue7,
    required int targetAssignment,
    required int targetArea,
    required int targetRange,
    required int targetType,
    required int targetNumber,
    required int targetCount,
    this.description = const Value.absent(),
    this.levelUpDisp = const Value.absent(),
  }) : classId = Value(classId),
       actionType = Value(actionType),
       actionDetail1 = Value(actionDetail1),
       actionDetail2 = Value(actionDetail2),
       actionDetail3 = Value(actionDetail3),
       actionValue1 = Value(actionValue1),
       actionValue2 = Value(actionValue2),
       actionValue3 = Value(actionValue3),
       actionValue4 = Value(actionValue4),
       actionValue5 = Value(actionValue5),
       actionValue6 = Value(actionValue6),
       actionValue7 = Value(actionValue7),
       targetAssignment = Value(targetAssignment),
       targetArea = Value(targetArea),
       targetRange = Value(targetRange),
       targetType = Value(targetType),
       targetNumber = Value(targetNumber),
       targetCount = Value(targetCount);
  static Insertable<SkillActionData> custom({
    Expression<int>? actionId,
    Expression<int>? classId,
    Expression<int>? actionType,
    Expression<int>? actionDetail1,
    Expression<int>? actionDetail2,
    Expression<int>? actionDetail3,
    Expression<double>? actionValue1,
    Expression<double>? actionValue2,
    Expression<double>? actionValue3,
    Expression<double>? actionValue4,
    Expression<double>? actionValue5,
    Expression<double>? actionValue6,
    Expression<double>? actionValue7,
    Expression<int>? targetAssignment,
    Expression<int>? targetArea,
    Expression<int>? targetRange,
    Expression<int>? targetType,
    Expression<int>? targetNumber,
    Expression<int>? targetCount,
    Expression<String>? description,
    Expression<String>? levelUpDisp,
  }) {
    return RawValuesInsertable({
      if (actionId != null) 'action_id': actionId,
      if (classId != null) 'class_id': classId,
      if (actionType != null) 'action_type': actionType,
      if (actionDetail1 != null) 'action_detail_1': actionDetail1,
      if (actionDetail2 != null) 'action_detail_2': actionDetail2,
      if (actionDetail3 != null) 'action_detail_3': actionDetail3,
      if (actionValue1 != null) 'action_value_1': actionValue1,
      if (actionValue2 != null) 'action_value_2': actionValue2,
      if (actionValue3 != null) 'action_value_3': actionValue3,
      if (actionValue4 != null) 'action_value_4': actionValue4,
      if (actionValue5 != null) 'action_value_5': actionValue5,
      if (actionValue6 != null) 'action_value_6': actionValue6,
      if (actionValue7 != null) 'action_value_7': actionValue7,
      if (targetAssignment != null) 'target_assignment': targetAssignment,
      if (targetArea != null) 'target_area': targetArea,
      if (targetRange != null) 'target_range': targetRange,
      if (targetType != null) 'target_type': targetType,
      if (targetNumber != null) 'target_number': targetNumber,
      if (targetCount != null) 'target_count': targetCount,
      if (description != null) 'description': description,
      if (levelUpDisp != null) 'level_up_disp': levelUpDisp,
    });
  }

  SkillActionCompanion copyWith({
    Value<int>? actionId,
    Value<int>? classId,
    Value<int>? actionType,
    Value<int>? actionDetail1,
    Value<int>? actionDetail2,
    Value<int>? actionDetail3,
    Value<double>? actionValue1,
    Value<double>? actionValue2,
    Value<double>? actionValue3,
    Value<double>? actionValue4,
    Value<double>? actionValue5,
    Value<double>? actionValue6,
    Value<double>? actionValue7,
    Value<int>? targetAssignment,
    Value<int>? targetArea,
    Value<int>? targetRange,
    Value<int>? targetType,
    Value<int>? targetNumber,
    Value<int>? targetCount,
    Value<String?>? description,
    Value<String?>? levelUpDisp,
  }) {
    return SkillActionCompanion(
      actionId: actionId ?? this.actionId,
      classId: classId ?? this.classId,
      actionType: actionType ?? this.actionType,
      actionDetail1: actionDetail1 ?? this.actionDetail1,
      actionDetail2: actionDetail2 ?? this.actionDetail2,
      actionDetail3: actionDetail3 ?? this.actionDetail3,
      actionValue1: actionValue1 ?? this.actionValue1,
      actionValue2: actionValue2 ?? this.actionValue2,
      actionValue3: actionValue3 ?? this.actionValue3,
      actionValue4: actionValue4 ?? this.actionValue4,
      actionValue5: actionValue5 ?? this.actionValue5,
      actionValue6: actionValue6 ?? this.actionValue6,
      actionValue7: actionValue7 ?? this.actionValue7,
      targetAssignment: targetAssignment ?? this.targetAssignment,
      targetArea: targetArea ?? this.targetArea,
      targetRange: targetRange ?? this.targetRange,
      targetType: targetType ?? this.targetType,
      targetNumber: targetNumber ?? this.targetNumber,
      targetCount: targetCount ?? this.targetCount,
      description: description ?? this.description,
      levelUpDisp: levelUpDisp ?? this.levelUpDisp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actionId.present) {
      map['action_id'] = Variable<int>(actionId.value);
    }
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<int>(actionType.value);
    }
    if (actionDetail1.present) {
      map['action_detail_1'] = Variable<int>(actionDetail1.value);
    }
    if (actionDetail2.present) {
      map['action_detail_2'] = Variable<int>(actionDetail2.value);
    }
    if (actionDetail3.present) {
      map['action_detail_3'] = Variable<int>(actionDetail3.value);
    }
    if (actionValue1.present) {
      map['action_value_1'] = Variable<double>(actionValue1.value);
    }
    if (actionValue2.present) {
      map['action_value_2'] = Variable<double>(actionValue2.value);
    }
    if (actionValue3.present) {
      map['action_value_3'] = Variable<double>(actionValue3.value);
    }
    if (actionValue4.present) {
      map['action_value_4'] = Variable<double>(actionValue4.value);
    }
    if (actionValue5.present) {
      map['action_value_5'] = Variable<double>(actionValue5.value);
    }
    if (actionValue6.present) {
      map['action_value_6'] = Variable<double>(actionValue6.value);
    }
    if (actionValue7.present) {
      map['action_value_7'] = Variable<double>(actionValue7.value);
    }
    if (targetAssignment.present) {
      map['target_assignment'] = Variable<int>(targetAssignment.value);
    }
    if (targetArea.present) {
      map['target_area'] = Variable<int>(targetArea.value);
    }
    if (targetRange.present) {
      map['target_range'] = Variable<int>(targetRange.value);
    }
    if (targetType.present) {
      map['target_type'] = Variable<int>(targetType.value);
    }
    if (targetNumber.present) {
      map['target_number'] = Variable<int>(targetNumber.value);
    }
    if (targetCount.present) {
      map['target_count'] = Variable<int>(targetCount.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (levelUpDisp.present) {
      map['level_up_disp'] = Variable<String>(levelUpDisp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillActionCompanion(')
          ..write('actionId: $actionId, ')
          ..write('classId: $classId, ')
          ..write('actionType: $actionType, ')
          ..write('actionDetail1: $actionDetail1, ')
          ..write('actionDetail2: $actionDetail2, ')
          ..write('actionDetail3: $actionDetail3, ')
          ..write('actionValue1: $actionValue1, ')
          ..write('actionValue2: $actionValue2, ')
          ..write('actionValue3: $actionValue3, ')
          ..write('actionValue4: $actionValue4, ')
          ..write('actionValue5: $actionValue5, ')
          ..write('actionValue6: $actionValue6, ')
          ..write('actionValue7: $actionValue7, ')
          ..write('targetAssignment: $targetAssignment, ')
          ..write('targetArea: $targetArea, ')
          ..write('targetRange: $targetRange, ')
          ..write('targetType: $targetType, ')
          ..write('targetNumber: $targetNumber, ')
          ..write('targetCount: $targetCount, ')
          ..write('description: $description, ')
          ..write('levelUpDisp: $levelUpDisp')
          ..write(')'))
        .toString();
  }
}

class $AilmentDataTable extends AilmentData
    with TableInfo<$AilmentDataTable, AilmentDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AilmentDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ailmentIdMeta = const VerificationMeta(
    'ailmentId',
  );
  @override
  late final GeneratedColumn<int> ailmentId = GeneratedColumn<int>(
    'ailment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ailmentActionMeta = const VerificationMeta(
    'ailmentAction',
  );
  @override
  late final GeneratedColumn<int> ailmentAction = GeneratedColumn<int>(
    'ailment_action',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ailmentDetail1Meta = const VerificationMeta(
    'ailmentDetail1',
  );
  @override
  late final GeneratedColumn<int> ailmentDetail1 = GeneratedColumn<int>(
    'ailment_detail_1',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ailmentNameMeta = const VerificationMeta(
    'ailmentName',
  );
  @override
  late final GeneratedColumn<String> ailmentName = GeneratedColumn<String>(
    'ailment_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    ailmentId,
    ailmentAction,
    ailmentDetail1,
    ailmentName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ailment_data';
  @override
  VerificationContext validateIntegrity(
    Insertable<AilmentDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ailment_id')) {
      context.handle(
        _ailmentIdMeta,
        ailmentId.isAcceptableOrUnknown(data['ailment_id']!, _ailmentIdMeta),
      );
    }
    if (data.containsKey('ailment_action')) {
      context.handle(
        _ailmentActionMeta,
        ailmentAction.isAcceptableOrUnknown(
          data['ailment_action']!,
          _ailmentActionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ailmentActionMeta);
    }
    if (data.containsKey('ailment_detail_1')) {
      context.handle(
        _ailmentDetail1Meta,
        ailmentDetail1.isAcceptableOrUnknown(
          data['ailment_detail_1']!,
          _ailmentDetail1Meta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ailmentDetail1Meta);
    }
    if (data.containsKey('ailment_name')) {
      context.handle(
        _ailmentNameMeta,
        ailmentName.isAcceptableOrUnknown(
          data['ailment_name']!,
          _ailmentNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ailmentId};
  @override
  AilmentDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AilmentDataData(
      ailmentId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ailment_id'],
          )!,
      ailmentAction:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ailment_action'],
          )!,
      ailmentDetail1:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ailment_detail_1'],
          )!,
      ailmentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ailment_name'],
      ),
    );
  }

  @override
  $AilmentDataTable createAlias(String alias) {
    return $AilmentDataTable(attachedDatabase, alias);
  }
}

class AilmentDataData extends DataClass implements Insertable<AilmentDataData> {
  final int ailmentId;
  final int ailmentAction;
  final int ailmentDetail1;
  final String? ailmentName;
  const AilmentDataData({
    required this.ailmentId,
    required this.ailmentAction,
    required this.ailmentDetail1,
    this.ailmentName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ailment_id'] = Variable<int>(ailmentId);
    map['ailment_action'] = Variable<int>(ailmentAction);
    map['ailment_detail_1'] = Variable<int>(ailmentDetail1);
    if (!nullToAbsent || ailmentName != null) {
      map['ailment_name'] = Variable<String>(ailmentName);
    }
    return map;
  }

  AilmentDataCompanion toCompanion(bool nullToAbsent) {
    return AilmentDataCompanion(
      ailmentId: Value(ailmentId),
      ailmentAction: Value(ailmentAction),
      ailmentDetail1: Value(ailmentDetail1),
      ailmentName:
          ailmentName == null && nullToAbsent
              ? const Value.absent()
              : Value(ailmentName),
    );
  }

  factory AilmentDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AilmentDataData(
      ailmentId: serializer.fromJson<int>(json['ailmentId']),
      ailmentAction: serializer.fromJson<int>(json['ailmentAction']),
      ailmentDetail1: serializer.fromJson<int>(json['ailmentDetail1']),
      ailmentName: serializer.fromJson<String?>(json['ailmentName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ailmentId': serializer.toJson<int>(ailmentId),
      'ailmentAction': serializer.toJson<int>(ailmentAction),
      'ailmentDetail1': serializer.toJson<int>(ailmentDetail1),
      'ailmentName': serializer.toJson<String?>(ailmentName),
    };
  }

  AilmentDataData copyWith({
    int? ailmentId,
    int? ailmentAction,
    int? ailmentDetail1,
    Value<String?> ailmentName = const Value.absent(),
  }) => AilmentDataData(
    ailmentId: ailmentId ?? this.ailmentId,
    ailmentAction: ailmentAction ?? this.ailmentAction,
    ailmentDetail1: ailmentDetail1 ?? this.ailmentDetail1,
    ailmentName: ailmentName.present ? ailmentName.value : this.ailmentName,
  );
  AilmentDataData copyWithCompanion(AilmentDataCompanion data) {
    return AilmentDataData(
      ailmentId: data.ailmentId.present ? data.ailmentId.value : this.ailmentId,
      ailmentAction:
          data.ailmentAction.present
              ? data.ailmentAction.value
              : this.ailmentAction,
      ailmentDetail1:
          data.ailmentDetail1.present
              ? data.ailmentDetail1.value
              : this.ailmentDetail1,
      ailmentName:
          data.ailmentName.present ? data.ailmentName.value : this.ailmentName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AilmentDataData(')
          ..write('ailmentId: $ailmentId, ')
          ..write('ailmentAction: $ailmentAction, ')
          ..write('ailmentDetail1: $ailmentDetail1, ')
          ..write('ailmentName: $ailmentName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(ailmentId, ailmentAction, ailmentDetail1, ailmentName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AilmentDataData &&
          other.ailmentId == this.ailmentId &&
          other.ailmentAction == this.ailmentAction &&
          other.ailmentDetail1 == this.ailmentDetail1 &&
          other.ailmentName == this.ailmentName);
}

class AilmentDataCompanion extends UpdateCompanion<AilmentDataData> {
  final Value<int> ailmentId;
  final Value<int> ailmentAction;
  final Value<int> ailmentDetail1;
  final Value<String?> ailmentName;
  const AilmentDataCompanion({
    this.ailmentId = const Value.absent(),
    this.ailmentAction = const Value.absent(),
    this.ailmentDetail1 = const Value.absent(),
    this.ailmentName = const Value.absent(),
  });
  AilmentDataCompanion.insert({
    this.ailmentId = const Value.absent(),
    required int ailmentAction,
    required int ailmentDetail1,
    this.ailmentName = const Value.absent(),
  }) : ailmentAction = Value(ailmentAction),
       ailmentDetail1 = Value(ailmentDetail1);
  static Insertable<AilmentDataData> custom({
    Expression<int>? ailmentId,
    Expression<int>? ailmentAction,
    Expression<int>? ailmentDetail1,
    Expression<String>? ailmentName,
  }) {
    return RawValuesInsertable({
      if (ailmentId != null) 'ailment_id': ailmentId,
      if (ailmentAction != null) 'ailment_action': ailmentAction,
      if (ailmentDetail1 != null) 'ailment_detail_1': ailmentDetail1,
      if (ailmentName != null) 'ailment_name': ailmentName,
    });
  }

  AilmentDataCompanion copyWith({
    Value<int>? ailmentId,
    Value<int>? ailmentAction,
    Value<int>? ailmentDetail1,
    Value<String?>? ailmentName,
  }) {
    return AilmentDataCompanion(
      ailmentId: ailmentId ?? this.ailmentId,
      ailmentAction: ailmentAction ?? this.ailmentAction,
      ailmentDetail1: ailmentDetail1 ?? this.ailmentDetail1,
      ailmentName: ailmentName ?? this.ailmentName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ailmentId.present) {
      map['ailment_id'] = Variable<int>(ailmentId.value);
    }
    if (ailmentAction.present) {
      map['ailment_action'] = Variable<int>(ailmentAction.value);
    }
    if (ailmentDetail1.present) {
      map['ailment_detail_1'] = Variable<int>(ailmentDetail1.value);
    }
    if (ailmentName.present) {
      map['ailment_name'] = Variable<String>(ailmentName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AilmentDataCompanion(')
          ..write('ailmentId: $ailmentId, ')
          ..write('ailmentAction: $ailmentAction, ')
          ..write('ailmentDetail1: $ailmentDetail1, ')
          ..write('ailmentName: $ailmentName')
          ..write(')'))
        .toString();
  }
}

class $UnitAttackPatternTable extends UnitAttackPattern
    with TableInfo<$UnitAttackPatternTable, UnitAttackPatternData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitAttackPatternTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _patternIdMeta = const VerificationMeta(
    'patternId',
  );
  @override
  late final GeneratedColumn<int> patternId = GeneratedColumn<int>(
    'pattern_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loopStartMeta = const VerificationMeta(
    'loopStart',
  );
  @override
  late final GeneratedColumn<int> loopStart = GeneratedColumn<int>(
    'loop_start',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _loopEndMeta = const VerificationMeta(
    'loopEnd',
  );
  @override
  late final GeneratedColumn<int> loopEnd = GeneratedColumn<int>(
    'loop_end',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern1Meta = const VerificationMeta(
    'atkPattern1',
  );
  @override
  late final GeneratedColumn<int> atkPattern1 = GeneratedColumn<int>(
    'atk_pattern_1',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern2Meta = const VerificationMeta(
    'atkPattern2',
  );
  @override
  late final GeneratedColumn<int> atkPattern2 = GeneratedColumn<int>(
    'atk_pattern_2',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern3Meta = const VerificationMeta(
    'atkPattern3',
  );
  @override
  late final GeneratedColumn<int> atkPattern3 = GeneratedColumn<int>(
    'atk_pattern_3',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern4Meta = const VerificationMeta(
    'atkPattern4',
  );
  @override
  late final GeneratedColumn<int> atkPattern4 = GeneratedColumn<int>(
    'atk_pattern_4',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern5Meta = const VerificationMeta(
    'atkPattern5',
  );
  @override
  late final GeneratedColumn<int> atkPattern5 = GeneratedColumn<int>(
    'atk_pattern_5',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern6Meta = const VerificationMeta(
    'atkPattern6',
  );
  @override
  late final GeneratedColumn<int> atkPattern6 = GeneratedColumn<int>(
    'atk_pattern_6',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern7Meta = const VerificationMeta(
    'atkPattern7',
  );
  @override
  late final GeneratedColumn<int> atkPattern7 = GeneratedColumn<int>(
    'atk_pattern_7',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern8Meta = const VerificationMeta(
    'atkPattern8',
  );
  @override
  late final GeneratedColumn<int> atkPattern8 = GeneratedColumn<int>(
    'atk_pattern_8',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern9Meta = const VerificationMeta(
    'atkPattern9',
  );
  @override
  late final GeneratedColumn<int> atkPattern9 = GeneratedColumn<int>(
    'atk_pattern_9',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern10Meta = const VerificationMeta(
    'atkPattern10',
  );
  @override
  late final GeneratedColumn<int> atkPattern10 = GeneratedColumn<int>(
    'atk_pattern_10',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern11Meta = const VerificationMeta(
    'atkPattern11',
  );
  @override
  late final GeneratedColumn<int> atkPattern11 = GeneratedColumn<int>(
    'atk_pattern_11',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern12Meta = const VerificationMeta(
    'atkPattern12',
  );
  @override
  late final GeneratedColumn<int> atkPattern12 = GeneratedColumn<int>(
    'atk_pattern_12',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern13Meta = const VerificationMeta(
    'atkPattern13',
  );
  @override
  late final GeneratedColumn<int> atkPattern13 = GeneratedColumn<int>(
    'atk_pattern_13',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern14Meta = const VerificationMeta(
    'atkPattern14',
  );
  @override
  late final GeneratedColumn<int> atkPattern14 = GeneratedColumn<int>(
    'atk_pattern_14',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern15Meta = const VerificationMeta(
    'atkPattern15',
  );
  @override
  late final GeneratedColumn<int> atkPattern15 = GeneratedColumn<int>(
    'atk_pattern_15',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern16Meta = const VerificationMeta(
    'atkPattern16',
  );
  @override
  late final GeneratedColumn<int> atkPattern16 = GeneratedColumn<int>(
    'atk_pattern_16',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern17Meta = const VerificationMeta(
    'atkPattern17',
  );
  @override
  late final GeneratedColumn<int> atkPattern17 = GeneratedColumn<int>(
    'atk_pattern_17',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern18Meta = const VerificationMeta(
    'atkPattern18',
  );
  @override
  late final GeneratedColumn<int> atkPattern18 = GeneratedColumn<int>(
    'atk_pattern_18',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern19Meta = const VerificationMeta(
    'atkPattern19',
  );
  @override
  late final GeneratedColumn<int> atkPattern19 = GeneratedColumn<int>(
    'atk_pattern_19',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _atkPattern20Meta = const VerificationMeta(
    'atkPattern20',
  );
  @override
  late final GeneratedColumn<int> atkPattern20 = GeneratedColumn<int>(
    'atk_pattern_20',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    patternId,
    unitId,
    loopStart,
    loopEnd,
    atkPattern1,
    atkPattern2,
    atkPattern3,
    atkPattern4,
    atkPattern5,
    atkPattern6,
    atkPattern7,
    atkPattern8,
    atkPattern9,
    atkPattern10,
    atkPattern11,
    atkPattern12,
    atkPattern13,
    atkPattern14,
    atkPattern15,
    atkPattern16,
    atkPattern17,
    atkPattern18,
    atkPattern19,
    atkPattern20,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_attack_pattern';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitAttackPatternData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pattern_id')) {
      context.handle(
        _patternIdMeta,
        patternId.isAcceptableOrUnknown(data['pattern_id']!, _patternIdMeta),
      );
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('loop_start')) {
      context.handle(
        _loopStartMeta,
        loopStart.isAcceptableOrUnknown(data['loop_start']!, _loopStartMeta),
      );
    }
    if (data.containsKey('loop_end')) {
      context.handle(
        _loopEndMeta,
        loopEnd.isAcceptableOrUnknown(data['loop_end']!, _loopEndMeta),
      );
    }
    if (data.containsKey('atk_pattern_1')) {
      context.handle(
        _atkPattern1Meta,
        atkPattern1.isAcceptableOrUnknown(
          data['atk_pattern_1']!,
          _atkPattern1Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_2')) {
      context.handle(
        _atkPattern2Meta,
        atkPattern2.isAcceptableOrUnknown(
          data['atk_pattern_2']!,
          _atkPattern2Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_3')) {
      context.handle(
        _atkPattern3Meta,
        atkPattern3.isAcceptableOrUnknown(
          data['atk_pattern_3']!,
          _atkPattern3Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_4')) {
      context.handle(
        _atkPattern4Meta,
        atkPattern4.isAcceptableOrUnknown(
          data['atk_pattern_4']!,
          _atkPattern4Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_5')) {
      context.handle(
        _atkPattern5Meta,
        atkPattern5.isAcceptableOrUnknown(
          data['atk_pattern_5']!,
          _atkPattern5Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_6')) {
      context.handle(
        _atkPattern6Meta,
        atkPattern6.isAcceptableOrUnknown(
          data['atk_pattern_6']!,
          _atkPattern6Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_7')) {
      context.handle(
        _atkPattern7Meta,
        atkPattern7.isAcceptableOrUnknown(
          data['atk_pattern_7']!,
          _atkPattern7Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_8')) {
      context.handle(
        _atkPattern8Meta,
        atkPattern8.isAcceptableOrUnknown(
          data['atk_pattern_8']!,
          _atkPattern8Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_9')) {
      context.handle(
        _atkPattern9Meta,
        atkPattern9.isAcceptableOrUnknown(
          data['atk_pattern_9']!,
          _atkPattern9Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_10')) {
      context.handle(
        _atkPattern10Meta,
        atkPattern10.isAcceptableOrUnknown(
          data['atk_pattern_10']!,
          _atkPattern10Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_11')) {
      context.handle(
        _atkPattern11Meta,
        atkPattern11.isAcceptableOrUnknown(
          data['atk_pattern_11']!,
          _atkPattern11Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_12')) {
      context.handle(
        _atkPattern12Meta,
        atkPattern12.isAcceptableOrUnknown(
          data['atk_pattern_12']!,
          _atkPattern12Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_13')) {
      context.handle(
        _atkPattern13Meta,
        atkPattern13.isAcceptableOrUnknown(
          data['atk_pattern_13']!,
          _atkPattern13Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_14')) {
      context.handle(
        _atkPattern14Meta,
        atkPattern14.isAcceptableOrUnknown(
          data['atk_pattern_14']!,
          _atkPattern14Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_15')) {
      context.handle(
        _atkPattern15Meta,
        atkPattern15.isAcceptableOrUnknown(
          data['atk_pattern_15']!,
          _atkPattern15Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_16')) {
      context.handle(
        _atkPattern16Meta,
        atkPattern16.isAcceptableOrUnknown(
          data['atk_pattern_16']!,
          _atkPattern16Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_17')) {
      context.handle(
        _atkPattern17Meta,
        atkPattern17.isAcceptableOrUnknown(
          data['atk_pattern_17']!,
          _atkPattern17Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_18')) {
      context.handle(
        _atkPattern18Meta,
        atkPattern18.isAcceptableOrUnknown(
          data['atk_pattern_18']!,
          _atkPattern18Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_19')) {
      context.handle(
        _atkPattern19Meta,
        atkPattern19.isAcceptableOrUnknown(
          data['atk_pattern_19']!,
          _atkPattern19Meta,
        ),
      );
    }
    if (data.containsKey('atk_pattern_20')) {
      context.handle(
        _atkPattern20Meta,
        atkPattern20.isAcceptableOrUnknown(
          data['atk_pattern_20']!,
          _atkPattern20Meta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {patternId};
  @override
  UnitAttackPatternData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitAttackPatternData(
      patternId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}pattern_id'],
          )!,
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      loopStart: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loop_start'],
      ),
      loopEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}loop_end'],
      ),
      atkPattern1: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_1'],
      ),
      atkPattern2: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_2'],
      ),
      atkPattern3: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_3'],
      ),
      atkPattern4: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_4'],
      ),
      atkPattern5: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_5'],
      ),
      atkPattern6: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_6'],
      ),
      atkPattern7: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_7'],
      ),
      atkPattern8: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_8'],
      ),
      atkPattern9: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_9'],
      ),
      atkPattern10: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_10'],
      ),
      atkPattern11: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_11'],
      ),
      atkPattern12: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_12'],
      ),
      atkPattern13: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_13'],
      ),
      atkPattern14: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_14'],
      ),
      atkPattern15: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_15'],
      ),
      atkPattern16: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_16'],
      ),
      atkPattern17: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_17'],
      ),
      atkPattern18: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_18'],
      ),
      atkPattern19: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_19'],
      ),
      atkPattern20: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}atk_pattern_20'],
      ),
    );
  }

  @override
  $UnitAttackPatternTable createAlias(String alias) {
    return $UnitAttackPatternTable(attachedDatabase, alias);
  }
}

class UnitAttackPatternData extends DataClass
    implements Insertable<UnitAttackPatternData> {
  final int patternId;
  final int unitId;
  final int? loopStart;
  final int? loopEnd;
  final int? atkPattern1;
  final int? atkPattern2;
  final int? atkPattern3;
  final int? atkPattern4;
  final int? atkPattern5;
  final int? atkPattern6;
  final int? atkPattern7;
  final int? atkPattern8;
  final int? atkPattern9;
  final int? atkPattern10;
  final int? atkPattern11;
  final int? atkPattern12;
  final int? atkPattern13;
  final int? atkPattern14;
  final int? atkPattern15;
  final int? atkPattern16;
  final int? atkPattern17;
  final int? atkPattern18;
  final int? atkPattern19;
  final int? atkPattern20;
  const UnitAttackPatternData({
    required this.patternId,
    required this.unitId,
    this.loopStart,
    this.loopEnd,
    this.atkPattern1,
    this.atkPattern2,
    this.atkPattern3,
    this.atkPattern4,
    this.atkPattern5,
    this.atkPattern6,
    this.atkPattern7,
    this.atkPattern8,
    this.atkPattern9,
    this.atkPattern10,
    this.atkPattern11,
    this.atkPattern12,
    this.atkPattern13,
    this.atkPattern14,
    this.atkPattern15,
    this.atkPattern16,
    this.atkPattern17,
    this.atkPattern18,
    this.atkPattern19,
    this.atkPattern20,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pattern_id'] = Variable<int>(patternId);
    map['unit_id'] = Variable<int>(unitId);
    if (!nullToAbsent || loopStart != null) {
      map['loop_start'] = Variable<int>(loopStart);
    }
    if (!nullToAbsent || loopEnd != null) {
      map['loop_end'] = Variable<int>(loopEnd);
    }
    if (!nullToAbsent || atkPattern1 != null) {
      map['atk_pattern_1'] = Variable<int>(atkPattern1);
    }
    if (!nullToAbsent || atkPattern2 != null) {
      map['atk_pattern_2'] = Variable<int>(atkPattern2);
    }
    if (!nullToAbsent || atkPattern3 != null) {
      map['atk_pattern_3'] = Variable<int>(atkPattern3);
    }
    if (!nullToAbsent || atkPattern4 != null) {
      map['atk_pattern_4'] = Variable<int>(atkPattern4);
    }
    if (!nullToAbsent || atkPattern5 != null) {
      map['atk_pattern_5'] = Variable<int>(atkPattern5);
    }
    if (!nullToAbsent || atkPattern6 != null) {
      map['atk_pattern_6'] = Variable<int>(atkPattern6);
    }
    if (!nullToAbsent || atkPattern7 != null) {
      map['atk_pattern_7'] = Variable<int>(atkPattern7);
    }
    if (!nullToAbsent || atkPattern8 != null) {
      map['atk_pattern_8'] = Variable<int>(atkPattern8);
    }
    if (!nullToAbsent || atkPattern9 != null) {
      map['atk_pattern_9'] = Variable<int>(atkPattern9);
    }
    if (!nullToAbsent || atkPattern10 != null) {
      map['atk_pattern_10'] = Variable<int>(atkPattern10);
    }
    if (!nullToAbsent || atkPattern11 != null) {
      map['atk_pattern_11'] = Variable<int>(atkPattern11);
    }
    if (!nullToAbsent || atkPattern12 != null) {
      map['atk_pattern_12'] = Variable<int>(atkPattern12);
    }
    if (!nullToAbsent || atkPattern13 != null) {
      map['atk_pattern_13'] = Variable<int>(atkPattern13);
    }
    if (!nullToAbsent || atkPattern14 != null) {
      map['atk_pattern_14'] = Variable<int>(atkPattern14);
    }
    if (!nullToAbsent || atkPattern15 != null) {
      map['atk_pattern_15'] = Variable<int>(atkPattern15);
    }
    if (!nullToAbsent || atkPattern16 != null) {
      map['atk_pattern_16'] = Variable<int>(atkPattern16);
    }
    if (!nullToAbsent || atkPattern17 != null) {
      map['atk_pattern_17'] = Variable<int>(atkPattern17);
    }
    if (!nullToAbsent || atkPattern18 != null) {
      map['atk_pattern_18'] = Variable<int>(atkPattern18);
    }
    if (!nullToAbsent || atkPattern19 != null) {
      map['atk_pattern_19'] = Variable<int>(atkPattern19);
    }
    if (!nullToAbsent || atkPattern20 != null) {
      map['atk_pattern_20'] = Variable<int>(atkPattern20);
    }
    return map;
  }

  UnitAttackPatternCompanion toCompanion(bool nullToAbsent) {
    return UnitAttackPatternCompanion(
      patternId: Value(patternId),
      unitId: Value(unitId),
      loopStart:
          loopStart == null && nullToAbsent
              ? const Value.absent()
              : Value(loopStart),
      loopEnd:
          loopEnd == null && nullToAbsent
              ? const Value.absent()
              : Value(loopEnd),
      atkPattern1:
          atkPattern1 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern1),
      atkPattern2:
          atkPattern2 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern2),
      atkPattern3:
          atkPattern3 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern3),
      atkPattern4:
          atkPattern4 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern4),
      atkPattern5:
          atkPattern5 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern5),
      atkPattern6:
          atkPattern6 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern6),
      atkPattern7:
          atkPattern7 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern7),
      atkPattern8:
          atkPattern8 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern8),
      atkPattern9:
          atkPattern9 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern9),
      atkPattern10:
          atkPattern10 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern10),
      atkPattern11:
          atkPattern11 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern11),
      atkPattern12:
          atkPattern12 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern12),
      atkPattern13:
          atkPattern13 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern13),
      atkPattern14:
          atkPattern14 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern14),
      atkPattern15:
          atkPattern15 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern15),
      atkPattern16:
          atkPattern16 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern16),
      atkPattern17:
          atkPattern17 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern17),
      atkPattern18:
          atkPattern18 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern18),
      atkPattern19:
          atkPattern19 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern19),
      atkPattern20:
          atkPattern20 == null && nullToAbsent
              ? const Value.absent()
              : Value(atkPattern20),
    );
  }

  factory UnitAttackPatternData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitAttackPatternData(
      patternId: serializer.fromJson<int>(json['patternId']),
      unitId: serializer.fromJson<int>(json['unitId']),
      loopStart: serializer.fromJson<int?>(json['loopStart']),
      loopEnd: serializer.fromJson<int?>(json['loopEnd']),
      atkPattern1: serializer.fromJson<int?>(json['atkPattern1']),
      atkPattern2: serializer.fromJson<int?>(json['atkPattern2']),
      atkPattern3: serializer.fromJson<int?>(json['atkPattern3']),
      atkPattern4: serializer.fromJson<int?>(json['atkPattern4']),
      atkPattern5: serializer.fromJson<int?>(json['atkPattern5']),
      atkPattern6: serializer.fromJson<int?>(json['atkPattern6']),
      atkPattern7: serializer.fromJson<int?>(json['atkPattern7']),
      atkPattern8: serializer.fromJson<int?>(json['atkPattern8']),
      atkPattern9: serializer.fromJson<int?>(json['atkPattern9']),
      atkPattern10: serializer.fromJson<int?>(json['atkPattern10']),
      atkPattern11: serializer.fromJson<int?>(json['atkPattern11']),
      atkPattern12: serializer.fromJson<int?>(json['atkPattern12']),
      atkPattern13: serializer.fromJson<int?>(json['atkPattern13']),
      atkPattern14: serializer.fromJson<int?>(json['atkPattern14']),
      atkPattern15: serializer.fromJson<int?>(json['atkPattern15']),
      atkPattern16: serializer.fromJson<int?>(json['atkPattern16']),
      atkPattern17: serializer.fromJson<int?>(json['atkPattern17']),
      atkPattern18: serializer.fromJson<int?>(json['atkPattern18']),
      atkPattern19: serializer.fromJson<int?>(json['atkPattern19']),
      atkPattern20: serializer.fromJson<int?>(json['atkPattern20']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'patternId': serializer.toJson<int>(patternId),
      'unitId': serializer.toJson<int>(unitId),
      'loopStart': serializer.toJson<int?>(loopStart),
      'loopEnd': serializer.toJson<int?>(loopEnd),
      'atkPattern1': serializer.toJson<int?>(atkPattern1),
      'atkPattern2': serializer.toJson<int?>(atkPattern2),
      'atkPattern3': serializer.toJson<int?>(atkPattern3),
      'atkPattern4': serializer.toJson<int?>(atkPattern4),
      'atkPattern5': serializer.toJson<int?>(atkPattern5),
      'atkPattern6': serializer.toJson<int?>(atkPattern6),
      'atkPattern7': serializer.toJson<int?>(atkPattern7),
      'atkPattern8': serializer.toJson<int?>(atkPattern8),
      'atkPattern9': serializer.toJson<int?>(atkPattern9),
      'atkPattern10': serializer.toJson<int?>(atkPattern10),
      'atkPattern11': serializer.toJson<int?>(atkPattern11),
      'atkPattern12': serializer.toJson<int?>(atkPattern12),
      'atkPattern13': serializer.toJson<int?>(atkPattern13),
      'atkPattern14': serializer.toJson<int?>(atkPattern14),
      'atkPattern15': serializer.toJson<int?>(atkPattern15),
      'atkPattern16': serializer.toJson<int?>(atkPattern16),
      'atkPattern17': serializer.toJson<int?>(atkPattern17),
      'atkPattern18': serializer.toJson<int?>(atkPattern18),
      'atkPattern19': serializer.toJson<int?>(atkPattern19),
      'atkPattern20': serializer.toJson<int?>(atkPattern20),
    };
  }

  UnitAttackPatternData copyWith({
    int? patternId,
    int? unitId,
    Value<int?> loopStart = const Value.absent(),
    Value<int?> loopEnd = const Value.absent(),
    Value<int?> atkPattern1 = const Value.absent(),
    Value<int?> atkPattern2 = const Value.absent(),
    Value<int?> atkPattern3 = const Value.absent(),
    Value<int?> atkPattern4 = const Value.absent(),
    Value<int?> atkPattern5 = const Value.absent(),
    Value<int?> atkPattern6 = const Value.absent(),
    Value<int?> atkPattern7 = const Value.absent(),
    Value<int?> atkPattern8 = const Value.absent(),
    Value<int?> atkPattern9 = const Value.absent(),
    Value<int?> atkPattern10 = const Value.absent(),
    Value<int?> atkPattern11 = const Value.absent(),
    Value<int?> atkPattern12 = const Value.absent(),
    Value<int?> atkPattern13 = const Value.absent(),
    Value<int?> atkPattern14 = const Value.absent(),
    Value<int?> atkPattern15 = const Value.absent(),
    Value<int?> atkPattern16 = const Value.absent(),
    Value<int?> atkPattern17 = const Value.absent(),
    Value<int?> atkPattern18 = const Value.absent(),
    Value<int?> atkPattern19 = const Value.absent(),
    Value<int?> atkPattern20 = const Value.absent(),
  }) => UnitAttackPatternData(
    patternId: patternId ?? this.patternId,
    unitId: unitId ?? this.unitId,
    loopStart: loopStart.present ? loopStart.value : this.loopStart,
    loopEnd: loopEnd.present ? loopEnd.value : this.loopEnd,
    atkPattern1: atkPattern1.present ? atkPattern1.value : this.atkPattern1,
    atkPattern2: atkPattern2.present ? atkPattern2.value : this.atkPattern2,
    atkPattern3: atkPattern3.present ? atkPattern3.value : this.atkPattern3,
    atkPattern4: atkPattern4.present ? atkPattern4.value : this.atkPattern4,
    atkPattern5: atkPattern5.present ? atkPattern5.value : this.atkPattern5,
    atkPattern6: atkPattern6.present ? atkPattern6.value : this.atkPattern6,
    atkPattern7: atkPattern7.present ? atkPattern7.value : this.atkPattern7,
    atkPattern8: atkPattern8.present ? atkPattern8.value : this.atkPattern8,
    atkPattern9: atkPattern9.present ? atkPattern9.value : this.atkPattern9,
    atkPattern10: atkPattern10.present ? atkPattern10.value : this.atkPattern10,
    atkPattern11: atkPattern11.present ? atkPattern11.value : this.atkPattern11,
    atkPattern12: atkPattern12.present ? atkPattern12.value : this.atkPattern12,
    atkPattern13: atkPattern13.present ? atkPattern13.value : this.atkPattern13,
    atkPattern14: atkPattern14.present ? atkPattern14.value : this.atkPattern14,
    atkPattern15: atkPattern15.present ? atkPattern15.value : this.atkPattern15,
    atkPattern16: atkPattern16.present ? atkPattern16.value : this.atkPattern16,
    atkPattern17: atkPattern17.present ? atkPattern17.value : this.atkPattern17,
    atkPattern18: atkPattern18.present ? atkPattern18.value : this.atkPattern18,
    atkPattern19: atkPattern19.present ? atkPattern19.value : this.atkPattern19,
    atkPattern20: atkPattern20.present ? atkPattern20.value : this.atkPattern20,
  );
  UnitAttackPatternData copyWithCompanion(UnitAttackPatternCompanion data) {
    return UnitAttackPatternData(
      patternId: data.patternId.present ? data.patternId.value : this.patternId,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      loopStart: data.loopStart.present ? data.loopStart.value : this.loopStart,
      loopEnd: data.loopEnd.present ? data.loopEnd.value : this.loopEnd,
      atkPattern1:
          data.atkPattern1.present ? data.atkPattern1.value : this.atkPattern1,
      atkPattern2:
          data.atkPattern2.present ? data.atkPattern2.value : this.atkPattern2,
      atkPattern3:
          data.atkPattern3.present ? data.atkPattern3.value : this.atkPattern3,
      atkPattern4:
          data.atkPattern4.present ? data.atkPattern4.value : this.atkPattern4,
      atkPattern5:
          data.atkPattern5.present ? data.atkPattern5.value : this.atkPattern5,
      atkPattern6:
          data.atkPattern6.present ? data.atkPattern6.value : this.atkPattern6,
      atkPattern7:
          data.atkPattern7.present ? data.atkPattern7.value : this.atkPattern7,
      atkPattern8:
          data.atkPattern8.present ? data.atkPattern8.value : this.atkPattern8,
      atkPattern9:
          data.atkPattern9.present ? data.atkPattern9.value : this.atkPattern9,
      atkPattern10:
          data.atkPattern10.present
              ? data.atkPattern10.value
              : this.atkPattern10,
      atkPattern11:
          data.atkPattern11.present
              ? data.atkPattern11.value
              : this.atkPattern11,
      atkPattern12:
          data.atkPattern12.present
              ? data.atkPattern12.value
              : this.atkPattern12,
      atkPattern13:
          data.atkPattern13.present
              ? data.atkPattern13.value
              : this.atkPattern13,
      atkPattern14:
          data.atkPattern14.present
              ? data.atkPattern14.value
              : this.atkPattern14,
      atkPattern15:
          data.atkPattern15.present
              ? data.atkPattern15.value
              : this.atkPattern15,
      atkPattern16:
          data.atkPattern16.present
              ? data.atkPattern16.value
              : this.atkPattern16,
      atkPattern17:
          data.atkPattern17.present
              ? data.atkPattern17.value
              : this.atkPattern17,
      atkPattern18:
          data.atkPattern18.present
              ? data.atkPattern18.value
              : this.atkPattern18,
      atkPattern19:
          data.atkPattern19.present
              ? data.atkPattern19.value
              : this.atkPattern19,
      atkPattern20:
          data.atkPattern20.present
              ? data.atkPattern20.value
              : this.atkPattern20,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitAttackPatternData(')
          ..write('patternId: $patternId, ')
          ..write('unitId: $unitId, ')
          ..write('loopStart: $loopStart, ')
          ..write('loopEnd: $loopEnd, ')
          ..write('atkPattern1: $atkPattern1, ')
          ..write('atkPattern2: $atkPattern2, ')
          ..write('atkPattern3: $atkPattern3, ')
          ..write('atkPattern4: $atkPattern4, ')
          ..write('atkPattern5: $atkPattern5, ')
          ..write('atkPattern6: $atkPattern6, ')
          ..write('atkPattern7: $atkPattern7, ')
          ..write('atkPattern8: $atkPattern8, ')
          ..write('atkPattern9: $atkPattern9, ')
          ..write('atkPattern10: $atkPattern10, ')
          ..write('atkPattern11: $atkPattern11, ')
          ..write('atkPattern12: $atkPattern12, ')
          ..write('atkPattern13: $atkPattern13, ')
          ..write('atkPattern14: $atkPattern14, ')
          ..write('atkPattern15: $atkPattern15, ')
          ..write('atkPattern16: $atkPattern16, ')
          ..write('atkPattern17: $atkPattern17, ')
          ..write('atkPattern18: $atkPattern18, ')
          ..write('atkPattern19: $atkPattern19, ')
          ..write('atkPattern20: $atkPattern20')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    patternId,
    unitId,
    loopStart,
    loopEnd,
    atkPattern1,
    atkPattern2,
    atkPattern3,
    atkPattern4,
    atkPattern5,
    atkPattern6,
    atkPattern7,
    atkPattern8,
    atkPattern9,
    atkPattern10,
    atkPattern11,
    atkPattern12,
    atkPattern13,
    atkPattern14,
    atkPattern15,
    atkPattern16,
    atkPattern17,
    atkPattern18,
    atkPattern19,
    atkPattern20,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitAttackPatternData &&
          other.patternId == this.patternId &&
          other.unitId == this.unitId &&
          other.loopStart == this.loopStart &&
          other.loopEnd == this.loopEnd &&
          other.atkPattern1 == this.atkPattern1 &&
          other.atkPattern2 == this.atkPattern2 &&
          other.atkPattern3 == this.atkPattern3 &&
          other.atkPattern4 == this.atkPattern4 &&
          other.atkPattern5 == this.atkPattern5 &&
          other.atkPattern6 == this.atkPattern6 &&
          other.atkPattern7 == this.atkPattern7 &&
          other.atkPattern8 == this.atkPattern8 &&
          other.atkPattern9 == this.atkPattern9 &&
          other.atkPattern10 == this.atkPattern10 &&
          other.atkPattern11 == this.atkPattern11 &&
          other.atkPattern12 == this.atkPattern12 &&
          other.atkPattern13 == this.atkPattern13 &&
          other.atkPattern14 == this.atkPattern14 &&
          other.atkPattern15 == this.atkPattern15 &&
          other.atkPattern16 == this.atkPattern16 &&
          other.atkPattern17 == this.atkPattern17 &&
          other.atkPattern18 == this.atkPattern18 &&
          other.atkPattern19 == this.atkPattern19 &&
          other.atkPattern20 == this.atkPattern20);
}

class UnitAttackPatternCompanion
    extends UpdateCompanion<UnitAttackPatternData> {
  final Value<int> patternId;
  final Value<int> unitId;
  final Value<int?> loopStart;
  final Value<int?> loopEnd;
  final Value<int?> atkPattern1;
  final Value<int?> atkPattern2;
  final Value<int?> atkPattern3;
  final Value<int?> atkPattern4;
  final Value<int?> atkPattern5;
  final Value<int?> atkPattern6;
  final Value<int?> atkPattern7;
  final Value<int?> atkPattern8;
  final Value<int?> atkPattern9;
  final Value<int?> atkPattern10;
  final Value<int?> atkPattern11;
  final Value<int?> atkPattern12;
  final Value<int?> atkPattern13;
  final Value<int?> atkPattern14;
  final Value<int?> atkPattern15;
  final Value<int?> atkPattern16;
  final Value<int?> atkPattern17;
  final Value<int?> atkPattern18;
  final Value<int?> atkPattern19;
  final Value<int?> atkPattern20;
  const UnitAttackPatternCompanion({
    this.patternId = const Value.absent(),
    this.unitId = const Value.absent(),
    this.loopStart = const Value.absent(),
    this.loopEnd = const Value.absent(),
    this.atkPattern1 = const Value.absent(),
    this.atkPattern2 = const Value.absent(),
    this.atkPattern3 = const Value.absent(),
    this.atkPattern4 = const Value.absent(),
    this.atkPattern5 = const Value.absent(),
    this.atkPattern6 = const Value.absent(),
    this.atkPattern7 = const Value.absent(),
    this.atkPattern8 = const Value.absent(),
    this.atkPattern9 = const Value.absent(),
    this.atkPattern10 = const Value.absent(),
    this.atkPattern11 = const Value.absent(),
    this.atkPattern12 = const Value.absent(),
    this.atkPattern13 = const Value.absent(),
    this.atkPattern14 = const Value.absent(),
    this.atkPattern15 = const Value.absent(),
    this.atkPattern16 = const Value.absent(),
    this.atkPattern17 = const Value.absent(),
    this.atkPattern18 = const Value.absent(),
    this.atkPattern19 = const Value.absent(),
    this.atkPattern20 = const Value.absent(),
  });
  UnitAttackPatternCompanion.insert({
    this.patternId = const Value.absent(),
    required int unitId,
    this.loopStart = const Value.absent(),
    this.loopEnd = const Value.absent(),
    this.atkPattern1 = const Value.absent(),
    this.atkPattern2 = const Value.absent(),
    this.atkPattern3 = const Value.absent(),
    this.atkPattern4 = const Value.absent(),
    this.atkPattern5 = const Value.absent(),
    this.atkPattern6 = const Value.absent(),
    this.atkPattern7 = const Value.absent(),
    this.atkPattern8 = const Value.absent(),
    this.atkPattern9 = const Value.absent(),
    this.atkPattern10 = const Value.absent(),
    this.atkPattern11 = const Value.absent(),
    this.atkPattern12 = const Value.absent(),
    this.atkPattern13 = const Value.absent(),
    this.atkPattern14 = const Value.absent(),
    this.atkPattern15 = const Value.absent(),
    this.atkPattern16 = const Value.absent(),
    this.atkPattern17 = const Value.absent(),
    this.atkPattern18 = const Value.absent(),
    this.atkPattern19 = const Value.absent(),
    this.atkPattern20 = const Value.absent(),
  }) : unitId = Value(unitId);
  static Insertable<UnitAttackPatternData> custom({
    Expression<int>? patternId,
    Expression<int>? unitId,
    Expression<int>? loopStart,
    Expression<int>? loopEnd,
    Expression<int>? atkPattern1,
    Expression<int>? atkPattern2,
    Expression<int>? atkPattern3,
    Expression<int>? atkPattern4,
    Expression<int>? atkPattern5,
    Expression<int>? atkPattern6,
    Expression<int>? atkPattern7,
    Expression<int>? atkPattern8,
    Expression<int>? atkPattern9,
    Expression<int>? atkPattern10,
    Expression<int>? atkPattern11,
    Expression<int>? atkPattern12,
    Expression<int>? atkPattern13,
    Expression<int>? atkPattern14,
    Expression<int>? atkPattern15,
    Expression<int>? atkPattern16,
    Expression<int>? atkPattern17,
    Expression<int>? atkPattern18,
    Expression<int>? atkPattern19,
    Expression<int>? atkPattern20,
  }) {
    return RawValuesInsertable({
      if (patternId != null) 'pattern_id': patternId,
      if (unitId != null) 'unit_id': unitId,
      if (loopStart != null) 'loop_start': loopStart,
      if (loopEnd != null) 'loop_end': loopEnd,
      if (atkPattern1 != null) 'atk_pattern_1': atkPattern1,
      if (atkPattern2 != null) 'atk_pattern_2': atkPattern2,
      if (atkPattern3 != null) 'atk_pattern_3': atkPattern3,
      if (atkPattern4 != null) 'atk_pattern_4': atkPattern4,
      if (atkPattern5 != null) 'atk_pattern_5': atkPattern5,
      if (atkPattern6 != null) 'atk_pattern_6': atkPattern6,
      if (atkPattern7 != null) 'atk_pattern_7': atkPattern7,
      if (atkPattern8 != null) 'atk_pattern_8': atkPattern8,
      if (atkPattern9 != null) 'atk_pattern_9': atkPattern9,
      if (atkPattern10 != null) 'atk_pattern_10': atkPattern10,
      if (atkPattern11 != null) 'atk_pattern_11': atkPattern11,
      if (atkPattern12 != null) 'atk_pattern_12': atkPattern12,
      if (atkPattern13 != null) 'atk_pattern_13': atkPattern13,
      if (atkPattern14 != null) 'atk_pattern_14': atkPattern14,
      if (atkPattern15 != null) 'atk_pattern_15': atkPattern15,
      if (atkPattern16 != null) 'atk_pattern_16': atkPattern16,
      if (atkPattern17 != null) 'atk_pattern_17': atkPattern17,
      if (atkPattern18 != null) 'atk_pattern_18': atkPattern18,
      if (atkPattern19 != null) 'atk_pattern_19': atkPattern19,
      if (atkPattern20 != null) 'atk_pattern_20': atkPattern20,
    });
  }

  UnitAttackPatternCompanion copyWith({
    Value<int>? patternId,
    Value<int>? unitId,
    Value<int?>? loopStart,
    Value<int?>? loopEnd,
    Value<int?>? atkPattern1,
    Value<int?>? atkPattern2,
    Value<int?>? atkPattern3,
    Value<int?>? atkPattern4,
    Value<int?>? atkPattern5,
    Value<int?>? atkPattern6,
    Value<int?>? atkPattern7,
    Value<int?>? atkPattern8,
    Value<int?>? atkPattern9,
    Value<int?>? atkPattern10,
    Value<int?>? atkPattern11,
    Value<int?>? atkPattern12,
    Value<int?>? atkPattern13,
    Value<int?>? atkPattern14,
    Value<int?>? atkPattern15,
    Value<int?>? atkPattern16,
    Value<int?>? atkPattern17,
    Value<int?>? atkPattern18,
    Value<int?>? atkPattern19,
    Value<int?>? atkPattern20,
  }) {
    return UnitAttackPatternCompanion(
      patternId: patternId ?? this.patternId,
      unitId: unitId ?? this.unitId,
      loopStart: loopStart ?? this.loopStart,
      loopEnd: loopEnd ?? this.loopEnd,
      atkPattern1: atkPattern1 ?? this.atkPattern1,
      atkPattern2: atkPattern2 ?? this.atkPattern2,
      atkPattern3: atkPattern3 ?? this.atkPattern3,
      atkPattern4: atkPattern4 ?? this.atkPattern4,
      atkPattern5: atkPattern5 ?? this.atkPattern5,
      atkPattern6: atkPattern6 ?? this.atkPattern6,
      atkPattern7: atkPattern7 ?? this.atkPattern7,
      atkPattern8: atkPattern8 ?? this.atkPattern8,
      atkPattern9: atkPattern9 ?? this.atkPattern9,
      atkPattern10: atkPattern10 ?? this.atkPattern10,
      atkPattern11: atkPattern11 ?? this.atkPattern11,
      atkPattern12: atkPattern12 ?? this.atkPattern12,
      atkPattern13: atkPattern13 ?? this.atkPattern13,
      atkPattern14: atkPattern14 ?? this.atkPattern14,
      atkPattern15: atkPattern15 ?? this.atkPattern15,
      atkPattern16: atkPattern16 ?? this.atkPattern16,
      atkPattern17: atkPattern17 ?? this.atkPattern17,
      atkPattern18: atkPattern18 ?? this.atkPattern18,
      atkPattern19: atkPattern19 ?? this.atkPattern19,
      atkPattern20: atkPattern20 ?? this.atkPattern20,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (patternId.present) {
      map['pattern_id'] = Variable<int>(patternId.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (loopStart.present) {
      map['loop_start'] = Variable<int>(loopStart.value);
    }
    if (loopEnd.present) {
      map['loop_end'] = Variable<int>(loopEnd.value);
    }
    if (atkPattern1.present) {
      map['atk_pattern_1'] = Variable<int>(atkPattern1.value);
    }
    if (atkPattern2.present) {
      map['atk_pattern_2'] = Variable<int>(atkPattern2.value);
    }
    if (atkPattern3.present) {
      map['atk_pattern_3'] = Variable<int>(atkPattern3.value);
    }
    if (atkPattern4.present) {
      map['atk_pattern_4'] = Variable<int>(atkPattern4.value);
    }
    if (atkPattern5.present) {
      map['atk_pattern_5'] = Variable<int>(atkPattern5.value);
    }
    if (atkPattern6.present) {
      map['atk_pattern_6'] = Variable<int>(atkPattern6.value);
    }
    if (atkPattern7.present) {
      map['atk_pattern_7'] = Variable<int>(atkPattern7.value);
    }
    if (atkPattern8.present) {
      map['atk_pattern_8'] = Variable<int>(atkPattern8.value);
    }
    if (atkPattern9.present) {
      map['atk_pattern_9'] = Variable<int>(atkPattern9.value);
    }
    if (atkPattern10.present) {
      map['atk_pattern_10'] = Variable<int>(atkPattern10.value);
    }
    if (atkPattern11.present) {
      map['atk_pattern_11'] = Variable<int>(atkPattern11.value);
    }
    if (atkPattern12.present) {
      map['atk_pattern_12'] = Variable<int>(atkPattern12.value);
    }
    if (atkPattern13.present) {
      map['atk_pattern_13'] = Variable<int>(atkPattern13.value);
    }
    if (atkPattern14.present) {
      map['atk_pattern_14'] = Variable<int>(atkPattern14.value);
    }
    if (atkPattern15.present) {
      map['atk_pattern_15'] = Variable<int>(atkPattern15.value);
    }
    if (atkPattern16.present) {
      map['atk_pattern_16'] = Variable<int>(atkPattern16.value);
    }
    if (atkPattern17.present) {
      map['atk_pattern_17'] = Variable<int>(atkPattern17.value);
    }
    if (atkPattern18.present) {
      map['atk_pattern_18'] = Variable<int>(atkPattern18.value);
    }
    if (atkPattern19.present) {
      map['atk_pattern_19'] = Variable<int>(atkPattern19.value);
    }
    if (atkPattern20.present) {
      map['atk_pattern_20'] = Variable<int>(atkPattern20.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitAttackPatternCompanion(')
          ..write('patternId: $patternId, ')
          ..write('unitId: $unitId, ')
          ..write('loopStart: $loopStart, ')
          ..write('loopEnd: $loopEnd, ')
          ..write('atkPattern1: $atkPattern1, ')
          ..write('atkPattern2: $atkPattern2, ')
          ..write('atkPattern3: $atkPattern3, ')
          ..write('atkPattern4: $atkPattern4, ')
          ..write('atkPattern5: $atkPattern5, ')
          ..write('atkPattern6: $atkPattern6, ')
          ..write('atkPattern7: $atkPattern7, ')
          ..write('atkPattern8: $atkPattern8, ')
          ..write('atkPattern9: $atkPattern9, ')
          ..write('atkPattern10: $atkPattern10, ')
          ..write('atkPattern11: $atkPattern11, ')
          ..write('atkPattern12: $atkPattern12, ')
          ..write('atkPattern13: $atkPattern13, ')
          ..write('atkPattern14: $atkPattern14, ')
          ..write('atkPattern15: $atkPattern15, ')
          ..write('atkPattern16: $atkPattern16, ')
          ..write('atkPattern17: $atkPattern17, ')
          ..write('atkPattern18: $atkPattern18, ')
          ..write('atkPattern19: $atkPattern19, ')
          ..write('atkPattern20: $atkPattern20')
          ..write(')'))
        .toString();
  }
}

class $SpSkillLabelDataTable extends SpSkillLabelData
    with TableInfo<$SpSkillLabelDataTable, SpSkillLabelDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpSkillLabelDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _normalLabelTextMeta = const VerificationMeta(
    'normalLabelText',
  );
  @override
  late final GeneratedColumn<String> normalLabelText = GeneratedColumn<String>(
    'normal_label_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _spLabelTextMeta = const VerificationMeta(
    'spLabelText',
  );
  @override
  late final GeneratedColumn<String> spLabelText = GeneratedColumn<String>(
    'sp_label_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [unitId, normalLabelText, spLabelText];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sp_skill_label';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpSkillLabelDataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    }
    if (data.containsKey('normal_label_text')) {
      context.handle(
        _normalLabelTextMeta,
        normalLabelText.isAcceptableOrUnknown(
          data['normal_label_text']!,
          _normalLabelTextMeta,
        ),
      );
    }
    if (data.containsKey('sp_label_text')) {
      context.handle(
        _spLabelTextMeta,
        spLabelText.isAcceptableOrUnknown(
          data['sp_label_text']!,
          _spLabelTextMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {unitId};
  @override
  SpSkillLabelDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpSkillLabelDataData(
      unitId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}unit_id'],
          )!,
      normalLabelText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}normal_label_text'],
      ),
      spLabelText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sp_label_text'],
      ),
    );
  }

  @override
  $SpSkillLabelDataTable createAlias(String alias) {
    return $SpSkillLabelDataTable(attachedDatabase, alias);
  }
}

class SpSkillLabelDataData extends DataClass
    implements Insertable<SpSkillLabelDataData> {
  final int unitId;
  final String? normalLabelText;
  final String? spLabelText;
  const SpSkillLabelDataData({
    required this.unitId,
    this.normalLabelText,
    this.spLabelText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['unit_id'] = Variable<int>(unitId);
    if (!nullToAbsent || normalLabelText != null) {
      map['normal_label_text'] = Variable<String>(normalLabelText);
    }
    if (!nullToAbsent || spLabelText != null) {
      map['sp_label_text'] = Variable<String>(spLabelText);
    }
    return map;
  }

  SpSkillLabelDataCompanion toCompanion(bool nullToAbsent) {
    return SpSkillLabelDataCompanion(
      unitId: Value(unitId),
      normalLabelText:
          normalLabelText == null && nullToAbsent
              ? const Value.absent()
              : Value(normalLabelText),
      spLabelText:
          spLabelText == null && nullToAbsent
              ? const Value.absent()
              : Value(spLabelText),
    );
  }

  factory SpSkillLabelDataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpSkillLabelDataData(
      unitId: serializer.fromJson<int>(json['unitId']),
      normalLabelText: serializer.fromJson<String?>(json['normalLabelText']),
      spLabelText: serializer.fromJson<String?>(json['spLabelText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'unitId': serializer.toJson<int>(unitId),
      'normalLabelText': serializer.toJson<String?>(normalLabelText),
      'spLabelText': serializer.toJson<String?>(spLabelText),
    };
  }

  SpSkillLabelDataData copyWith({
    int? unitId,
    Value<String?> normalLabelText = const Value.absent(),
    Value<String?> spLabelText = const Value.absent(),
  }) => SpSkillLabelDataData(
    unitId: unitId ?? this.unitId,
    normalLabelText:
        normalLabelText.present ? normalLabelText.value : this.normalLabelText,
    spLabelText: spLabelText.present ? spLabelText.value : this.spLabelText,
  );
  SpSkillLabelDataData copyWithCompanion(SpSkillLabelDataCompanion data) {
    return SpSkillLabelDataData(
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      normalLabelText:
          data.normalLabelText.present
              ? data.normalLabelText.value
              : this.normalLabelText,
      spLabelText:
          data.spLabelText.present ? data.spLabelText.value : this.spLabelText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpSkillLabelDataData(')
          ..write('unitId: $unitId, ')
          ..write('normalLabelText: $normalLabelText, ')
          ..write('spLabelText: $spLabelText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(unitId, normalLabelText, spLabelText);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpSkillLabelDataData &&
          other.unitId == this.unitId &&
          other.normalLabelText == this.normalLabelText &&
          other.spLabelText == this.spLabelText);
}

class SpSkillLabelDataCompanion extends UpdateCompanion<SpSkillLabelDataData> {
  final Value<int> unitId;
  final Value<String?> normalLabelText;
  final Value<String?> spLabelText;
  const SpSkillLabelDataCompanion({
    this.unitId = const Value.absent(),
    this.normalLabelText = const Value.absent(),
    this.spLabelText = const Value.absent(),
  });
  SpSkillLabelDataCompanion.insert({
    this.unitId = const Value.absent(),
    this.normalLabelText = const Value.absent(),
    this.spLabelText = const Value.absent(),
  });
  static Insertable<SpSkillLabelDataData> custom({
    Expression<int>? unitId,
    Expression<String>? normalLabelText,
    Expression<String>? spLabelText,
  }) {
    return RawValuesInsertable({
      if (unitId != null) 'unit_id': unitId,
      if (normalLabelText != null) 'normal_label_text': normalLabelText,
      if (spLabelText != null) 'sp_label_text': spLabelText,
    });
  }

  SpSkillLabelDataCompanion copyWith({
    Value<int>? unitId,
    Value<String?>? normalLabelText,
    Value<String?>? spLabelText,
  }) {
    return SpSkillLabelDataCompanion(
      unitId: unitId ?? this.unitId,
      normalLabelText: normalLabelText ?? this.normalLabelText,
      spLabelText: spLabelText ?? this.spLabelText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (normalLabelText.present) {
      map['normal_label_text'] = Variable<String>(normalLabelText.value);
    }
    if (spLabelText.present) {
      map['sp_label_text'] = Variable<String>(spLabelText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpSkillLabelDataCompanion(')
          ..write('unitId: $unitId, ')
          ..write('normalLabelText: $normalLabelText, ')
          ..write('spLabelText: $spLabelText')
          ..write(')'))
        .toString();
  }
}

class $UnitSkillDataRFTable extends UnitSkillDataRF
    with TableInfo<$UnitSkillDataRFTable, UnitSkillDataRFData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitSkillDataRFTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skillIdMeta = const VerificationMeta(
    'skillId',
  );
  @override
  late final GeneratedColumn<int> skillId = GeneratedColumn<int>(
    'skill_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rfSkillIdMeta = const VerificationMeta(
    'rfSkillId',
  );
  @override
  late final GeneratedColumn<int> rfSkillId = GeneratedColumn<int>(
    'rf_skill_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minLvMeta = const VerificationMeta('minLv');
  @override
  late final GeneratedColumn<int> minLv = GeneratedColumn<int>(
    'min_lv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxLvMeta = const VerificationMeta('maxLv');
  @override
  late final GeneratedColumn<int> maxLv = GeneratedColumn<int>(
    'max_lv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, skillId, rfSkillId, minLv, maxLv];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_skill_data_rf';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitSkillDataRFData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('skill_id')) {
      context.handle(
        _skillIdMeta,
        skillId.isAcceptableOrUnknown(data['skill_id']!, _skillIdMeta),
      );
    } else if (isInserting) {
      context.missing(_skillIdMeta);
    }
    if (data.containsKey('rf_skill_id')) {
      context.handle(
        _rfSkillIdMeta,
        rfSkillId.isAcceptableOrUnknown(data['rf_skill_id']!, _rfSkillIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rfSkillIdMeta);
    }
    if (data.containsKey('min_lv')) {
      context.handle(
        _minLvMeta,
        minLv.isAcceptableOrUnknown(data['min_lv']!, _minLvMeta),
      );
    } else if (isInserting) {
      context.missing(_minLvMeta);
    }
    if (data.containsKey('max_lv')) {
      context.handle(
        _maxLvMeta,
        maxLv.isAcceptableOrUnknown(data['max_lv']!, _maxLvMeta),
      );
    } else if (isInserting) {
      context.missing(_maxLvMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitSkillDataRFData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitSkillDataRFData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      skillId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}skill_id'],
          )!,
      rfSkillId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}rf_skill_id'],
          )!,
      minLv:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}min_lv'],
          )!,
      maxLv:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}max_lv'],
          )!,
    );
  }

  @override
  $UnitSkillDataRFTable createAlias(String alias) {
    return $UnitSkillDataRFTable(attachedDatabase, alias);
  }
}

class UnitSkillDataRFData extends DataClass
    implements Insertable<UnitSkillDataRFData> {
  final int id;
  final int skillId;
  final int rfSkillId;
  final int minLv;
  final int maxLv;
  const UnitSkillDataRFData({
    required this.id,
    required this.skillId,
    required this.rfSkillId,
    required this.minLv,
    required this.maxLv,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['skill_id'] = Variable<int>(skillId);
    map['rf_skill_id'] = Variable<int>(rfSkillId);
    map['min_lv'] = Variable<int>(minLv);
    map['max_lv'] = Variable<int>(maxLv);
    return map;
  }

  UnitSkillDataRFCompanion toCompanion(bool nullToAbsent) {
    return UnitSkillDataRFCompanion(
      id: Value(id),
      skillId: Value(skillId),
      rfSkillId: Value(rfSkillId),
      minLv: Value(minLv),
      maxLv: Value(maxLv),
    );
  }

  factory UnitSkillDataRFData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitSkillDataRFData(
      id: serializer.fromJson<int>(json['id']),
      skillId: serializer.fromJson<int>(json['skillId']),
      rfSkillId: serializer.fromJson<int>(json['rfSkillId']),
      minLv: serializer.fromJson<int>(json['minLv']),
      maxLv: serializer.fromJson<int>(json['maxLv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'skillId': serializer.toJson<int>(skillId),
      'rfSkillId': serializer.toJson<int>(rfSkillId),
      'minLv': serializer.toJson<int>(minLv),
      'maxLv': serializer.toJson<int>(maxLv),
    };
  }

  UnitSkillDataRFData copyWith({
    int? id,
    int? skillId,
    int? rfSkillId,
    int? minLv,
    int? maxLv,
  }) => UnitSkillDataRFData(
    id: id ?? this.id,
    skillId: skillId ?? this.skillId,
    rfSkillId: rfSkillId ?? this.rfSkillId,
    minLv: minLv ?? this.minLv,
    maxLv: maxLv ?? this.maxLv,
  );
  UnitSkillDataRFData copyWithCompanion(UnitSkillDataRFCompanion data) {
    return UnitSkillDataRFData(
      id: data.id.present ? data.id.value : this.id,
      skillId: data.skillId.present ? data.skillId.value : this.skillId,
      rfSkillId: data.rfSkillId.present ? data.rfSkillId.value : this.rfSkillId,
      minLv: data.minLv.present ? data.minLv.value : this.minLv,
      maxLv: data.maxLv.present ? data.maxLv.value : this.maxLv,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitSkillDataRFData(')
          ..write('id: $id, ')
          ..write('skillId: $skillId, ')
          ..write('rfSkillId: $rfSkillId, ')
          ..write('minLv: $minLv, ')
          ..write('maxLv: $maxLv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, skillId, rfSkillId, minLv, maxLv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitSkillDataRFData &&
          other.id == this.id &&
          other.skillId == this.skillId &&
          other.rfSkillId == this.rfSkillId &&
          other.minLv == this.minLv &&
          other.maxLv == this.maxLv);
}

class UnitSkillDataRFCompanion extends UpdateCompanion<UnitSkillDataRFData> {
  final Value<int> id;
  final Value<int> skillId;
  final Value<int> rfSkillId;
  final Value<int> minLv;
  final Value<int> maxLv;
  const UnitSkillDataRFCompanion({
    this.id = const Value.absent(),
    this.skillId = const Value.absent(),
    this.rfSkillId = const Value.absent(),
    this.minLv = const Value.absent(),
    this.maxLv = const Value.absent(),
  });
  UnitSkillDataRFCompanion.insert({
    this.id = const Value.absent(),
    required int skillId,
    required int rfSkillId,
    required int minLv,
    required int maxLv,
  }) : skillId = Value(skillId),
       rfSkillId = Value(rfSkillId),
       minLv = Value(minLv),
       maxLv = Value(maxLv);
  static Insertable<UnitSkillDataRFData> custom({
    Expression<int>? id,
    Expression<int>? skillId,
    Expression<int>? rfSkillId,
    Expression<int>? minLv,
    Expression<int>? maxLv,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (skillId != null) 'skill_id': skillId,
      if (rfSkillId != null) 'rf_skill_id': rfSkillId,
      if (minLv != null) 'min_lv': minLv,
      if (maxLv != null) 'max_lv': maxLv,
    });
  }

  UnitSkillDataRFCompanion copyWith({
    Value<int>? id,
    Value<int>? skillId,
    Value<int>? rfSkillId,
    Value<int>? minLv,
    Value<int>? maxLv,
  }) {
    return UnitSkillDataRFCompanion(
      id: id ?? this.id,
      skillId: skillId ?? this.skillId,
      rfSkillId: rfSkillId ?? this.rfSkillId,
      minLv: minLv ?? this.minLv,
      maxLv: maxLv ?? this.maxLv,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (skillId.present) {
      map['skill_id'] = Variable<int>(skillId.value);
    }
    if (rfSkillId.present) {
      map['rf_skill_id'] = Variable<int>(rfSkillId.value);
    }
    if (minLv.present) {
      map['min_lv'] = Variable<int>(minLv.value);
    }
    if (maxLv.present) {
      map['max_lv'] = Variable<int>(maxLv.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitSkillDataRFCompanion(')
          ..write('id: $id, ')
          ..write('skillId: $skillId, ')
          ..write('rfSkillId: $rfSkillId, ')
          ..write('minLv: $minLv, ')
          ..write('maxLv: $maxLv')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $UnitProfileTable unitProfile = $UnitProfileTable(this);
  late final $RedeemUnitTable redeemUnit = $RedeemUnitTable(this);
  late final $UnitDataTable unitData = $UnitDataTable(this);
  late final $UniqueEquipmentEnhanceDataTable uniqueEquipmentEnhanceData =
      $UniqueEquipmentEnhanceDataTable(this);
  late final $ActualUnitBackgroundTable actualUnitBackground =
      $ActualUnitBackgroundTable(this);
  late final $Rarity6QuestDataTable rarity6QuestData = $Rarity6QuestDataTable(
    this,
  );
  late final $SkillDataTable skillData = $SkillDataTable(this);
  late final $UnitSkillDataTable unitSkillData = $UnitSkillDataTable(this);
  late final $SkillActionTable skillAction = $SkillActionTable(this);
  late final $AilmentDataTable ailmentData = $AilmentDataTable(this);
  late final $UnitAttackPatternTable unitAttackPattern =
      $UnitAttackPatternTable(this);
  late final $SpSkillLabelDataTable spSkillLabelData = $SpSkillLabelDataTable(
    this,
  );
  late final $UnitSkillDataRFTable unitSkillDataRF = $UnitSkillDataRFTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    unitProfile,
    redeemUnit,
    unitData,
    uniqueEquipmentEnhanceData,
    actualUnitBackground,
    rarity6QuestData,
    skillData,
    unitSkillData,
    skillAction,
    ailmentData,
    unitAttackPattern,
    spSkillLabelData,
    unitSkillDataRF,
  ];
}

typedef $$UnitProfileTableCreateCompanionBuilder =
    UnitProfileCompanion Function({
      Value<int> unitId,
      required String unitName,
      Value<String?> age,
      Value<String?> guild,
      Value<String?> race,
      Value<String?> height,
      Value<String?> weight,
      Value<String?> birthMonth,
      Value<String?> birthDay,
      Value<String?> bloodType,
      Value<String?> favorite,
      Value<String?> voice,
      Value<int?> voiceId,
      Value<String?> catchCopy,
      Value<String?> selfText,
      Value<String?> guildId,
    });
typedef $$UnitProfileTableUpdateCompanionBuilder =
    UnitProfileCompanion Function({
      Value<int> unitId,
      Value<String> unitName,
      Value<String?> age,
      Value<String?> guild,
      Value<String?> race,
      Value<String?> height,
      Value<String?> weight,
      Value<String?> birthMonth,
      Value<String?> birthDay,
      Value<String?> bloodType,
      Value<String?> favorite,
      Value<String?> voice,
      Value<int?> voiceId,
      Value<String?> catchCopy,
      Value<String?> selfText,
      Value<String?> guildId,
    });

class $$UnitProfileTableFilterComposer
    extends Composer<_$AppDb, $UnitProfileTable> {
  $$UnitProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthDay => $composableBuilder(
    column: $table.birthDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voice => $composableBuilder(
    column: $table.voice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get voiceId => $composableBuilder(
    column: $table.voiceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catchCopy => $composableBuilder(
    column: $table.catchCopy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selfText => $composableBuilder(
    column: $table.selfText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitProfileTableOrderingComposer
    extends Composer<_$AppDb, $UnitProfileTable> {
  $$UnitProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthDay => $composableBuilder(
    column: $table.birthDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get favorite => $composableBuilder(
    column: $table.favorite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voice => $composableBuilder(
    column: $table.voice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get voiceId => $composableBuilder(
    column: $table.voiceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catchCopy => $composableBuilder(
    column: $table.catchCopy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selfText => $composableBuilder(
    column: $table.selfText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitProfileTableAnnotationComposer
    extends Composer<_$AppDb, $UnitProfileTable> {
  $$UnitProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<String> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get guild =>
      $composableBuilder(column: $table.guild, builder: (column) => column);

  GeneratedColumn<String> get race =>
      $composableBuilder(column: $table.race, builder: (column) => column);

  GeneratedColumn<String> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get birthMonth => $composableBuilder(
    column: $table.birthMonth,
    builder: (column) => column,
  );

  GeneratedColumn<String> get birthDay =>
      $composableBuilder(column: $table.birthDay, builder: (column) => column);

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<String> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<String> get voice =>
      $composableBuilder(column: $table.voice, builder: (column) => column);

  GeneratedColumn<int> get voiceId =>
      $composableBuilder(column: $table.voiceId, builder: (column) => column);

  GeneratedColumn<String> get catchCopy =>
      $composableBuilder(column: $table.catchCopy, builder: (column) => column);

  GeneratedColumn<String> get selfText =>
      $composableBuilder(column: $table.selfText, builder: (column) => column);

  GeneratedColumn<String> get guildId =>
      $composableBuilder(column: $table.guildId, builder: (column) => column);
}

class $$UnitProfileTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UnitProfileTable,
          UnitProfileData,
          $$UnitProfileTableFilterComposer,
          $$UnitProfileTableOrderingComposer,
          $$UnitProfileTableAnnotationComposer,
          $$UnitProfileTableCreateCompanionBuilder,
          $$UnitProfileTableUpdateCompanionBuilder,
          (
            UnitProfileData,
            BaseReferences<_$AppDb, $UnitProfileTable, UnitProfileData>,
          ),
          UnitProfileData,
          PrefetchHooks Function()
        > {
  $$UnitProfileTableTableManager(_$AppDb db, $UnitProfileTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UnitProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UnitProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$UnitProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<String?> age = const Value.absent(),
                Value<String?> guild = const Value.absent(),
                Value<String?> race = const Value.absent(),
                Value<String?> height = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> birthMonth = const Value.absent(),
                Value<String?> birthDay = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<String?> favorite = const Value.absent(),
                Value<String?> voice = const Value.absent(),
                Value<int?> voiceId = const Value.absent(),
                Value<String?> catchCopy = const Value.absent(),
                Value<String?> selfText = const Value.absent(),
                Value<String?> guildId = const Value.absent(),
              }) => UnitProfileCompanion(
                unitId: unitId,
                unitName: unitName,
                age: age,
                guild: guild,
                race: race,
                height: height,
                weight: weight,
                birthMonth: birthMonth,
                birthDay: birthDay,
                bloodType: bloodType,
                favorite: favorite,
                voice: voice,
                voiceId: voiceId,
                catchCopy: catchCopy,
                selfText: selfText,
                guildId: guildId,
              ),
          createCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                required String unitName,
                Value<String?> age = const Value.absent(),
                Value<String?> guild = const Value.absent(),
                Value<String?> race = const Value.absent(),
                Value<String?> height = const Value.absent(),
                Value<String?> weight = const Value.absent(),
                Value<String?> birthMonth = const Value.absent(),
                Value<String?> birthDay = const Value.absent(),
                Value<String?> bloodType = const Value.absent(),
                Value<String?> favorite = const Value.absent(),
                Value<String?> voice = const Value.absent(),
                Value<int?> voiceId = const Value.absent(),
                Value<String?> catchCopy = const Value.absent(),
                Value<String?> selfText = const Value.absent(),
                Value<String?> guildId = const Value.absent(),
              }) => UnitProfileCompanion.insert(
                unitId: unitId,
                unitName: unitName,
                age: age,
                guild: guild,
                race: race,
                height: height,
                weight: weight,
                birthMonth: birthMonth,
                birthDay: birthDay,
                bloodType: bloodType,
                favorite: favorite,
                voice: voice,
                voiceId: voiceId,
                catchCopy: catchCopy,
                selfText: selfText,
                guildId: guildId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UnitProfileTable,
      UnitProfileData,
      $$UnitProfileTableFilterComposer,
      $$UnitProfileTableOrderingComposer,
      $$UnitProfileTableAnnotationComposer,
      $$UnitProfileTableCreateCompanionBuilder,
      $$UnitProfileTableUpdateCompanionBuilder,
      (
        UnitProfileData,
        BaseReferences<_$AppDb, $UnitProfileTable, UnitProfileData>,
      ),
      UnitProfileData,
      PrefetchHooks Function()
    >;
typedef $$RedeemUnitTableCreateCompanionBuilder =
    RedeemUnitCompanion Function({
      Value<int> id,
      required int unitId,
      required int slotId,
      required int conditionCategory,
      required int conditionId,
      required String consumeNum,
    });
typedef $$RedeemUnitTableUpdateCompanionBuilder =
    RedeemUnitCompanion Function({
      Value<int> id,
      Value<int> unitId,
      Value<int> slotId,
      Value<int> conditionCategory,
      Value<int> conditionId,
      Value<String> consumeNum,
    });

class $$RedeemUnitTableFilterComposer
    extends Composer<_$AppDb, $RedeemUnitTable> {
  $$RedeemUnitTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get slotId => $composableBuilder(
    column: $table.slotId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conditionCategory => $composableBuilder(
    column: $table.conditionCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conditionId => $composableBuilder(
    column: $table.conditionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consumeNum => $composableBuilder(
    column: $table.consumeNum,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RedeemUnitTableOrderingComposer
    extends Composer<_$AppDb, $RedeemUnitTable> {
  $$RedeemUnitTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get slotId => $composableBuilder(
    column: $table.slotId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conditionCategory => $composableBuilder(
    column: $table.conditionCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conditionId => $composableBuilder(
    column: $table.conditionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consumeNum => $composableBuilder(
    column: $table.consumeNum,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RedeemUnitTableAnnotationComposer
    extends Composer<_$AppDb, $RedeemUnitTable> {
  $$RedeemUnitTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<int> get slotId =>
      $composableBuilder(column: $table.slotId, builder: (column) => column);

  GeneratedColumn<int> get conditionCategory => $composableBuilder(
    column: $table.conditionCategory,
    builder: (column) => column,
  );

  GeneratedColumn<int> get conditionId => $composableBuilder(
    column: $table.conditionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get consumeNum => $composableBuilder(
    column: $table.consumeNum,
    builder: (column) => column,
  );
}

class $$RedeemUnitTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $RedeemUnitTable,
          RedeemUnitData,
          $$RedeemUnitTableFilterComposer,
          $$RedeemUnitTableOrderingComposer,
          $$RedeemUnitTableAnnotationComposer,
          $$RedeemUnitTableCreateCompanionBuilder,
          $$RedeemUnitTableUpdateCompanionBuilder,
          (
            RedeemUnitData,
            BaseReferences<_$AppDb, $RedeemUnitTable, RedeemUnitData>,
          ),
          RedeemUnitData,
          PrefetchHooks Function()
        > {
  $$RedeemUnitTableTableManager(_$AppDb db, $RedeemUnitTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RedeemUnitTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RedeemUnitTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RedeemUnitTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> unitId = const Value.absent(),
                Value<int> slotId = const Value.absent(),
                Value<int> conditionCategory = const Value.absent(),
                Value<int> conditionId = const Value.absent(),
                Value<String> consumeNum = const Value.absent(),
              }) => RedeemUnitCompanion(
                id: id,
                unitId: unitId,
                slotId: slotId,
                conditionCategory: conditionCategory,
                conditionId: conditionId,
                consumeNum: consumeNum,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int unitId,
                required int slotId,
                required int conditionCategory,
                required int conditionId,
                required String consumeNum,
              }) => RedeemUnitCompanion.insert(
                id: id,
                unitId: unitId,
                slotId: slotId,
                conditionCategory: conditionCategory,
                conditionId: conditionId,
                consumeNum: consumeNum,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RedeemUnitTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $RedeemUnitTable,
      RedeemUnitData,
      $$RedeemUnitTableFilterComposer,
      $$RedeemUnitTableOrderingComposer,
      $$RedeemUnitTableAnnotationComposer,
      $$RedeemUnitTableCreateCompanionBuilder,
      $$RedeemUnitTableUpdateCompanionBuilder,
      (
        RedeemUnitData,
        BaseReferences<_$AppDb, $RedeemUnitTable, RedeemUnitData>,
      ),
      RedeemUnitData,
      PrefetchHooks Function()
    >;
typedef $$UnitDataTableCreateCompanionBuilder =
    UnitDataCompanion Function({
      Value<int> unitId,
      required String unitName,
      Value<String?> kana,
      Value<int?> prefabId,
      Value<int?> prefabIdBattle,
      Value<int?> isLimited,
      Value<int?> rarity,
      Value<int?> motionType,
      Value<int?> seType,
      Value<int?> moveSpeed,
      Value<int?> searchAreaWidth,
      Value<int?> atkType,
      Value<double?> normalAtkCastTime,
      Value<int?> cutin1,
      Value<int?> cutin2,
      Value<int?> cutin1Star6,
      Value<int?> cutin2Star6,
      Value<int?> guildId,
      Value<int?> exskillDisplay,
      Value<String?> comment,
      Value<int?> onlyDispOwned,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int?> originalUnitId,
    });
typedef $$UnitDataTableUpdateCompanionBuilder =
    UnitDataCompanion Function({
      Value<int> unitId,
      Value<String> unitName,
      Value<String?> kana,
      Value<int?> prefabId,
      Value<int?> prefabIdBattle,
      Value<int?> isLimited,
      Value<int?> rarity,
      Value<int?> motionType,
      Value<int?> seType,
      Value<int?> moveSpeed,
      Value<int?> searchAreaWidth,
      Value<int?> atkType,
      Value<double?> normalAtkCastTime,
      Value<int?> cutin1,
      Value<int?> cutin2,
      Value<int?> cutin1Star6,
      Value<int?> cutin2Star6,
      Value<int?> guildId,
      Value<int?> exskillDisplay,
      Value<String?> comment,
      Value<int?> onlyDispOwned,
      Value<String?> startTime,
      Value<String?> endTime,
      Value<int?> originalUnitId,
    });

class $$UnitDataTableFilterComposer extends Composer<_$AppDb, $UnitDataTable> {
  $$UnitDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kana => $composableBuilder(
    column: $table.kana,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prefabId => $composableBuilder(
    column: $table.prefabId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prefabIdBattle => $composableBuilder(
    column: $table.prefabIdBattle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isLimited => $composableBuilder(
    column: $table.isLimited,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get motionType => $composableBuilder(
    column: $table.motionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seType => $composableBuilder(
    column: $table.seType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moveSpeed => $composableBuilder(
    column: $table.moveSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get searchAreaWidth => $composableBuilder(
    column: $table.searchAreaWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkType => $composableBuilder(
    column: $table.atkType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get normalAtkCastTime => $composableBuilder(
    column: $table.normalAtkCastTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cutin1 => $composableBuilder(
    column: $table.cutin1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cutin2 => $composableBuilder(
    column: $table.cutin2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cutin1Star6 => $composableBuilder(
    column: $table.cutin1Star6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cutin2Star6 => $composableBuilder(
    column: $table.cutin2Star6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exskillDisplay => $composableBuilder(
    column: $table.exskillDisplay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get onlyDispOwned => $composableBuilder(
    column: $table.onlyDispOwned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get originalUnitId => $composableBuilder(
    column: $table.originalUnitId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitDataTableOrderingComposer
    extends Composer<_$AppDb, $UnitDataTable> {
  $$UnitDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kana => $composableBuilder(
    column: $table.kana,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prefabId => $composableBuilder(
    column: $table.prefabId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prefabIdBattle => $composableBuilder(
    column: $table.prefabIdBattle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isLimited => $composableBuilder(
    column: $table.isLimited,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rarity => $composableBuilder(
    column: $table.rarity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get motionType => $composableBuilder(
    column: $table.motionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seType => $composableBuilder(
    column: $table.seType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moveSpeed => $composableBuilder(
    column: $table.moveSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get searchAreaWidth => $composableBuilder(
    column: $table.searchAreaWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkType => $composableBuilder(
    column: $table.atkType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get normalAtkCastTime => $composableBuilder(
    column: $table.normalAtkCastTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cutin1 => $composableBuilder(
    column: $table.cutin1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cutin2 => $composableBuilder(
    column: $table.cutin2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cutin1Star6 => $composableBuilder(
    column: $table.cutin1Star6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cutin2Star6 => $composableBuilder(
    column: $table.cutin2Star6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get guildId => $composableBuilder(
    column: $table.guildId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exskillDisplay => $composableBuilder(
    column: $table.exskillDisplay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get onlyDispOwned => $composableBuilder(
    column: $table.onlyDispOwned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get originalUnitId => $composableBuilder(
    column: $table.originalUnitId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitDataTableAnnotationComposer
    extends Composer<_$AppDb, $UnitDataTable> {
  $$UnitDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<String> get kana =>
      $composableBuilder(column: $table.kana, builder: (column) => column);

  GeneratedColumn<int> get prefabId =>
      $composableBuilder(column: $table.prefabId, builder: (column) => column);

  GeneratedColumn<int> get prefabIdBattle => $composableBuilder(
    column: $table.prefabIdBattle,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isLimited =>
      $composableBuilder(column: $table.isLimited, builder: (column) => column);

  GeneratedColumn<int> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<int> get motionType => $composableBuilder(
    column: $table.motionType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seType =>
      $composableBuilder(column: $table.seType, builder: (column) => column);

  GeneratedColumn<int> get moveSpeed =>
      $composableBuilder(column: $table.moveSpeed, builder: (column) => column);

  GeneratedColumn<int> get searchAreaWidth => $composableBuilder(
    column: $table.searchAreaWidth,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkType =>
      $composableBuilder(column: $table.atkType, builder: (column) => column);

  GeneratedColumn<double> get normalAtkCastTime => $composableBuilder(
    column: $table.normalAtkCastTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cutin1 =>
      $composableBuilder(column: $table.cutin1, builder: (column) => column);

  GeneratedColumn<int> get cutin2 =>
      $composableBuilder(column: $table.cutin2, builder: (column) => column);

  GeneratedColumn<int> get cutin1Star6 => $composableBuilder(
    column: $table.cutin1Star6,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cutin2Star6 => $composableBuilder(
    column: $table.cutin2Star6,
    builder: (column) => column,
  );

  GeneratedColumn<int> get guildId =>
      $composableBuilder(column: $table.guildId, builder: (column) => column);

  GeneratedColumn<int> get exskillDisplay => $composableBuilder(
    column: $table.exskillDisplay,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get onlyDispOwned => $composableBuilder(
    column: $table.onlyDispOwned,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get originalUnitId => $composableBuilder(
    column: $table.originalUnitId,
    builder: (column) => column,
  );
}

class $$UnitDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UnitDataTable,
          UnitDataData,
          $$UnitDataTableFilterComposer,
          $$UnitDataTableOrderingComposer,
          $$UnitDataTableAnnotationComposer,
          $$UnitDataTableCreateCompanionBuilder,
          $$UnitDataTableUpdateCompanionBuilder,
          (UnitDataData, BaseReferences<_$AppDb, $UnitDataTable, UnitDataData>),
          UnitDataData,
          PrefetchHooks Function()
        > {
  $$UnitDataTableTableManager(_$AppDb db, $UnitDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UnitDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UnitDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UnitDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String> unitName = const Value.absent(),
                Value<String?> kana = const Value.absent(),
                Value<int?> prefabId = const Value.absent(),
                Value<int?> prefabIdBattle = const Value.absent(),
                Value<int?> isLimited = const Value.absent(),
                Value<int?> rarity = const Value.absent(),
                Value<int?> motionType = const Value.absent(),
                Value<int?> seType = const Value.absent(),
                Value<int?> moveSpeed = const Value.absent(),
                Value<int?> searchAreaWidth = const Value.absent(),
                Value<int?> atkType = const Value.absent(),
                Value<double?> normalAtkCastTime = const Value.absent(),
                Value<int?> cutin1 = const Value.absent(),
                Value<int?> cutin2 = const Value.absent(),
                Value<int?> cutin1Star6 = const Value.absent(),
                Value<int?> cutin2Star6 = const Value.absent(),
                Value<int?> guildId = const Value.absent(),
                Value<int?> exskillDisplay = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int?> onlyDispOwned = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int?> originalUnitId = const Value.absent(),
              }) => UnitDataCompanion(
                unitId: unitId,
                unitName: unitName,
                kana: kana,
                prefabId: prefabId,
                prefabIdBattle: prefabIdBattle,
                isLimited: isLimited,
                rarity: rarity,
                motionType: motionType,
                seType: seType,
                moveSpeed: moveSpeed,
                searchAreaWidth: searchAreaWidth,
                atkType: atkType,
                normalAtkCastTime: normalAtkCastTime,
                cutin1: cutin1,
                cutin2: cutin2,
                cutin1Star6: cutin1Star6,
                cutin2Star6: cutin2Star6,
                guildId: guildId,
                exskillDisplay: exskillDisplay,
                comment: comment,
                onlyDispOwned: onlyDispOwned,
                startTime: startTime,
                endTime: endTime,
                originalUnitId: originalUnitId,
              ),
          createCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                required String unitName,
                Value<String?> kana = const Value.absent(),
                Value<int?> prefabId = const Value.absent(),
                Value<int?> prefabIdBattle = const Value.absent(),
                Value<int?> isLimited = const Value.absent(),
                Value<int?> rarity = const Value.absent(),
                Value<int?> motionType = const Value.absent(),
                Value<int?> seType = const Value.absent(),
                Value<int?> moveSpeed = const Value.absent(),
                Value<int?> searchAreaWidth = const Value.absent(),
                Value<int?> atkType = const Value.absent(),
                Value<double?> normalAtkCastTime = const Value.absent(),
                Value<int?> cutin1 = const Value.absent(),
                Value<int?> cutin2 = const Value.absent(),
                Value<int?> cutin1Star6 = const Value.absent(),
                Value<int?> cutin2Star6 = const Value.absent(),
                Value<int?> guildId = const Value.absent(),
                Value<int?> exskillDisplay = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int?> onlyDispOwned = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> endTime = const Value.absent(),
                Value<int?> originalUnitId = const Value.absent(),
              }) => UnitDataCompanion.insert(
                unitId: unitId,
                unitName: unitName,
                kana: kana,
                prefabId: prefabId,
                prefabIdBattle: prefabIdBattle,
                isLimited: isLimited,
                rarity: rarity,
                motionType: motionType,
                seType: seType,
                moveSpeed: moveSpeed,
                searchAreaWidth: searchAreaWidth,
                atkType: atkType,
                normalAtkCastTime: normalAtkCastTime,
                cutin1: cutin1,
                cutin2: cutin2,
                cutin1Star6: cutin1Star6,
                cutin2Star6: cutin2Star6,
                guildId: guildId,
                exskillDisplay: exskillDisplay,
                comment: comment,
                onlyDispOwned: onlyDispOwned,
                startTime: startTime,
                endTime: endTime,
                originalUnitId: originalUnitId,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UnitDataTable,
      UnitDataData,
      $$UnitDataTableFilterComposer,
      $$UnitDataTableOrderingComposer,
      $$UnitDataTableAnnotationComposer,
      $$UnitDataTableCreateCompanionBuilder,
      $$UnitDataTableUpdateCompanionBuilder,
      (UnitDataData, BaseReferences<_$AppDb, $UnitDataTable, UnitDataData>),
      UnitDataData,
      PrefetchHooks Function()
    >;
typedef $$UniqueEquipmentEnhanceDataTableCreateCompanionBuilder =
    UniqueEquipmentEnhanceDataCompanion Function({
      required int equipSlot,
      required int enhanceLevel,
      Value<int?> neededPoint,
      Value<int?> totalPoint,
      Value<int?> neededMana,
      Value<int?> rank,
      Value<int> rowid,
    });
typedef $$UniqueEquipmentEnhanceDataTableUpdateCompanionBuilder =
    UniqueEquipmentEnhanceDataCompanion Function({
      Value<int> equipSlot,
      Value<int> enhanceLevel,
      Value<int?> neededPoint,
      Value<int?> totalPoint,
      Value<int?> neededMana,
      Value<int?> rank,
      Value<int> rowid,
    });

class $$UniqueEquipmentEnhanceDataTableFilterComposer
    extends Composer<_$AppDb, $UniqueEquipmentEnhanceDataTable> {
  $$UniqueEquipmentEnhanceDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get equipSlot => $composableBuilder(
    column: $table.equipSlot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enhanceLevel => $composableBuilder(
    column: $table.enhanceLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get neededPoint => $composableBuilder(
    column: $table.neededPoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPoint => $composableBuilder(
    column: $table.totalPoint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get neededMana => $composableBuilder(
    column: $table.neededMana,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UniqueEquipmentEnhanceDataTableOrderingComposer
    extends Composer<_$AppDb, $UniqueEquipmentEnhanceDataTable> {
  $$UniqueEquipmentEnhanceDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get equipSlot => $composableBuilder(
    column: $table.equipSlot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enhanceLevel => $composableBuilder(
    column: $table.enhanceLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get neededPoint => $composableBuilder(
    column: $table.neededPoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPoint => $composableBuilder(
    column: $table.totalPoint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get neededMana => $composableBuilder(
    column: $table.neededMana,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UniqueEquipmentEnhanceDataTableAnnotationComposer
    extends Composer<_$AppDb, $UniqueEquipmentEnhanceDataTable> {
  $$UniqueEquipmentEnhanceDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get equipSlot =>
      $composableBuilder(column: $table.equipSlot, builder: (column) => column);

  GeneratedColumn<int> get enhanceLevel => $composableBuilder(
    column: $table.enhanceLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get neededPoint => $composableBuilder(
    column: $table.neededPoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalPoint => $composableBuilder(
    column: $table.totalPoint,
    builder: (column) => column,
  );

  GeneratedColumn<int> get neededMana => $composableBuilder(
    column: $table.neededMana,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);
}

class $$UniqueEquipmentEnhanceDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UniqueEquipmentEnhanceDataTable,
          UniqueEquipmentEnhanceDataData,
          $$UniqueEquipmentEnhanceDataTableFilterComposer,
          $$UniqueEquipmentEnhanceDataTableOrderingComposer,
          $$UniqueEquipmentEnhanceDataTableAnnotationComposer,
          $$UniqueEquipmentEnhanceDataTableCreateCompanionBuilder,
          $$UniqueEquipmentEnhanceDataTableUpdateCompanionBuilder,
          (
            UniqueEquipmentEnhanceDataData,
            BaseReferences<
              _$AppDb,
              $UniqueEquipmentEnhanceDataTable,
              UniqueEquipmentEnhanceDataData
            >,
          ),
          UniqueEquipmentEnhanceDataData,
          PrefetchHooks Function()
        > {
  $$UniqueEquipmentEnhanceDataTableTableManager(
    _$AppDb db,
    $UniqueEquipmentEnhanceDataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UniqueEquipmentEnhanceDataTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$UniqueEquipmentEnhanceDataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$UniqueEquipmentEnhanceDataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> equipSlot = const Value.absent(),
                Value<int> enhanceLevel = const Value.absent(),
                Value<int?> neededPoint = const Value.absent(),
                Value<int?> totalPoint = const Value.absent(),
                Value<int?> neededMana = const Value.absent(),
                Value<int?> rank = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UniqueEquipmentEnhanceDataCompanion(
                equipSlot: equipSlot,
                enhanceLevel: enhanceLevel,
                neededPoint: neededPoint,
                totalPoint: totalPoint,
                neededMana: neededMana,
                rank: rank,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int equipSlot,
                required int enhanceLevel,
                Value<int?> neededPoint = const Value.absent(),
                Value<int?> totalPoint = const Value.absent(),
                Value<int?> neededMana = const Value.absent(),
                Value<int?> rank = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UniqueEquipmentEnhanceDataCompanion.insert(
                equipSlot: equipSlot,
                enhanceLevel: enhanceLevel,
                neededPoint: neededPoint,
                totalPoint: totalPoint,
                neededMana: neededMana,
                rank: rank,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UniqueEquipmentEnhanceDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UniqueEquipmentEnhanceDataTable,
      UniqueEquipmentEnhanceDataData,
      $$UniqueEquipmentEnhanceDataTableFilterComposer,
      $$UniqueEquipmentEnhanceDataTableOrderingComposer,
      $$UniqueEquipmentEnhanceDataTableAnnotationComposer,
      $$UniqueEquipmentEnhanceDataTableCreateCompanionBuilder,
      $$UniqueEquipmentEnhanceDataTableUpdateCompanionBuilder,
      (
        UniqueEquipmentEnhanceDataData,
        BaseReferences<
          _$AppDb,
          $UniqueEquipmentEnhanceDataTable,
          UniqueEquipmentEnhanceDataData
        >,
      ),
      UniqueEquipmentEnhanceDataData,
      PrefetchHooks Function()
    >;
typedef $$ActualUnitBackgroundTableCreateCompanionBuilder =
    ActualUnitBackgroundCompanion Function({
      Value<int> unitId,
      Value<String?> unitName,
      Value<int?> bgId,
      Value<int?> faceType,
    });
typedef $$ActualUnitBackgroundTableUpdateCompanionBuilder =
    ActualUnitBackgroundCompanion Function({
      Value<int> unitId,
      Value<String?> unitName,
      Value<int?> bgId,
      Value<int?> faceType,
    });

class $$ActualUnitBackgroundTableFilterComposer
    extends Composer<_$AppDb, $ActualUnitBackgroundTable> {
  $$ActualUnitBackgroundTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bgId => $composableBuilder(
    column: $table.bgId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get faceType => $composableBuilder(
    column: $table.faceType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ActualUnitBackgroundTableOrderingComposer
    extends Composer<_$AppDb, $ActualUnitBackgroundTable> {
  $$ActualUnitBackgroundTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitName => $composableBuilder(
    column: $table.unitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bgId => $composableBuilder(
    column: $table.bgId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get faceType => $composableBuilder(
    column: $table.faceType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActualUnitBackgroundTableAnnotationComposer
    extends Composer<_$AppDb, $ActualUnitBackgroundTable> {
  $$ActualUnitBackgroundTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get unitName =>
      $composableBuilder(column: $table.unitName, builder: (column) => column);

  GeneratedColumn<int> get bgId =>
      $composableBuilder(column: $table.bgId, builder: (column) => column);

  GeneratedColumn<int> get faceType =>
      $composableBuilder(column: $table.faceType, builder: (column) => column);
}

class $$ActualUnitBackgroundTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ActualUnitBackgroundTable,
          ActualUnitBackgroundData,
          $$ActualUnitBackgroundTableFilterComposer,
          $$ActualUnitBackgroundTableOrderingComposer,
          $$ActualUnitBackgroundTableAnnotationComposer,
          $$ActualUnitBackgroundTableCreateCompanionBuilder,
          $$ActualUnitBackgroundTableUpdateCompanionBuilder,
          (
            ActualUnitBackgroundData,
            BaseReferences<
              _$AppDb,
              $ActualUnitBackgroundTable,
              ActualUnitBackgroundData
            >,
          ),
          ActualUnitBackgroundData,
          PrefetchHooks Function()
        > {
  $$ActualUnitBackgroundTableTableManager(
    _$AppDb db,
    $ActualUnitBackgroundTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ActualUnitBackgroundTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$ActualUnitBackgroundTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$ActualUnitBackgroundTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String?> unitName = const Value.absent(),
                Value<int?> bgId = const Value.absent(),
                Value<int?> faceType = const Value.absent(),
              }) => ActualUnitBackgroundCompanion(
                unitId: unitId,
                unitName: unitName,
                bgId: bgId,
                faceType: faceType,
              ),
          createCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String?> unitName = const Value.absent(),
                Value<int?> bgId = const Value.absent(),
                Value<int?> faceType = const Value.absent(),
              }) => ActualUnitBackgroundCompanion.insert(
                unitId: unitId,
                unitName: unitName,
                bgId: bgId,
                faceType: faceType,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ActualUnitBackgroundTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ActualUnitBackgroundTable,
      ActualUnitBackgroundData,
      $$ActualUnitBackgroundTableFilterComposer,
      $$ActualUnitBackgroundTableOrderingComposer,
      $$ActualUnitBackgroundTableAnnotationComposer,
      $$ActualUnitBackgroundTableCreateCompanionBuilder,
      $$ActualUnitBackgroundTableUpdateCompanionBuilder,
      (
        ActualUnitBackgroundData,
        BaseReferences<
          _$AppDb,
          $ActualUnitBackgroundTable,
          ActualUnitBackgroundData
        >,
      ),
      ActualUnitBackgroundData,
      PrefetchHooks Function()
    >;
typedef $$Rarity6QuestDataTableCreateCompanionBuilder =
    Rarity6QuestDataCompanion Function({
      required int rarity6QuestId,
      Value<int> unitId,
      required String questName,
      required int limitTime,
      required int recommendedLevel,
      required int rewardGroupId,
      required int treasureType,
      required int rewardImage1,
      required int rewardCount1,
      required int rewardImage2,
      required int rewardCount2,
      required int rewardImage3,
      required int rewardCount3,
      required int rewardImage4,
      required int rewardCount4,
      required int rewardImage5,
      required int rewardCount5,
      required int background,
      required int bgPosition,
      required int waveGroupId,
      required int enemyPositionX1,
      required int enemyLocalPositionY1,
      required double enemySize1,
      required int enemyPositionX2,
      required int enemyLocalPositionY2,
      required double enemySize2,
      required int enemyPositionX3,
      required int enemyLocalPositionY3,
      required double enemySize3,
      required int enemyPositionX4,
      required int enemyLocalPositionY4,
      required double enemySize4,
      required int enemyPositionX5,
      required int enemyLocalPositionY5,
      required double enemySize5,
      required String waveBgm,
    });
typedef $$Rarity6QuestDataTableUpdateCompanionBuilder =
    Rarity6QuestDataCompanion Function({
      Value<int> rarity6QuestId,
      Value<int> unitId,
      Value<String> questName,
      Value<int> limitTime,
      Value<int> recommendedLevel,
      Value<int> rewardGroupId,
      Value<int> treasureType,
      Value<int> rewardImage1,
      Value<int> rewardCount1,
      Value<int> rewardImage2,
      Value<int> rewardCount2,
      Value<int> rewardImage3,
      Value<int> rewardCount3,
      Value<int> rewardImage4,
      Value<int> rewardCount4,
      Value<int> rewardImage5,
      Value<int> rewardCount5,
      Value<int> background,
      Value<int> bgPosition,
      Value<int> waveGroupId,
      Value<int> enemyPositionX1,
      Value<int> enemyLocalPositionY1,
      Value<double> enemySize1,
      Value<int> enemyPositionX2,
      Value<int> enemyLocalPositionY2,
      Value<double> enemySize2,
      Value<int> enemyPositionX3,
      Value<int> enemyLocalPositionY3,
      Value<double> enemySize3,
      Value<int> enemyPositionX4,
      Value<int> enemyLocalPositionY4,
      Value<double> enemySize4,
      Value<int> enemyPositionX5,
      Value<int> enemyLocalPositionY5,
      Value<double> enemySize5,
      Value<String> waveBgm,
    });

class $$Rarity6QuestDataTableFilterComposer
    extends Composer<_$AppDb, $Rarity6QuestDataTable> {
  $$Rarity6QuestDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get rarity6QuestId => $composableBuilder(
    column: $table.rarity6QuestId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questName => $composableBuilder(
    column: $table.questName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get limitTime => $composableBuilder(
    column: $table.limitTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get recommendedLevel => $composableBuilder(
    column: $table.recommendedLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardGroupId => $composableBuilder(
    column: $table.rewardGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get treasureType => $composableBuilder(
    column: $table.treasureType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardImage1 => $composableBuilder(
    column: $table.rewardImage1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardCount1 => $composableBuilder(
    column: $table.rewardCount1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardImage2 => $composableBuilder(
    column: $table.rewardImage2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardCount2 => $composableBuilder(
    column: $table.rewardCount2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardImage3 => $composableBuilder(
    column: $table.rewardImage3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardCount3 => $composableBuilder(
    column: $table.rewardCount3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardImage4 => $composableBuilder(
    column: $table.rewardImage4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardCount4 => $composableBuilder(
    column: $table.rewardCount4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardImage5 => $composableBuilder(
    column: $table.rewardImage5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rewardCount5 => $composableBuilder(
    column: $table.rewardCount5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bgPosition => $composableBuilder(
    column: $table.bgPosition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waveGroupId => $composableBuilder(
    column: $table.waveGroupId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyPositionX1 => $composableBuilder(
    column: $table.enemyPositionX1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyLocalPositionY1 => $composableBuilder(
    column: $table.enemyLocalPositionY1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enemySize1 => $composableBuilder(
    column: $table.enemySize1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyPositionX2 => $composableBuilder(
    column: $table.enemyPositionX2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyLocalPositionY2 => $composableBuilder(
    column: $table.enemyLocalPositionY2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enemySize2 => $composableBuilder(
    column: $table.enemySize2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyPositionX3 => $composableBuilder(
    column: $table.enemyPositionX3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyLocalPositionY3 => $composableBuilder(
    column: $table.enemyLocalPositionY3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enemySize3 => $composableBuilder(
    column: $table.enemySize3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyPositionX4 => $composableBuilder(
    column: $table.enemyPositionX4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyLocalPositionY4 => $composableBuilder(
    column: $table.enemyLocalPositionY4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enemySize4 => $composableBuilder(
    column: $table.enemySize4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyPositionX5 => $composableBuilder(
    column: $table.enemyPositionX5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get enemyLocalPositionY5 => $composableBuilder(
    column: $table.enemyLocalPositionY5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get enemySize5 => $composableBuilder(
    column: $table.enemySize5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get waveBgm => $composableBuilder(
    column: $table.waveBgm,
    builder: (column) => ColumnFilters(column),
  );
}

class $$Rarity6QuestDataTableOrderingComposer
    extends Composer<_$AppDb, $Rarity6QuestDataTable> {
  $$Rarity6QuestDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get rarity6QuestId => $composableBuilder(
    column: $table.rarity6QuestId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questName => $composableBuilder(
    column: $table.questName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get limitTime => $composableBuilder(
    column: $table.limitTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recommendedLevel => $composableBuilder(
    column: $table.recommendedLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardGroupId => $composableBuilder(
    column: $table.rewardGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get treasureType => $composableBuilder(
    column: $table.treasureType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardImage1 => $composableBuilder(
    column: $table.rewardImage1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardCount1 => $composableBuilder(
    column: $table.rewardCount1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardImage2 => $composableBuilder(
    column: $table.rewardImage2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardCount2 => $composableBuilder(
    column: $table.rewardCount2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardImage3 => $composableBuilder(
    column: $table.rewardImage3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardCount3 => $composableBuilder(
    column: $table.rewardCount3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardImage4 => $composableBuilder(
    column: $table.rewardImage4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardCount4 => $composableBuilder(
    column: $table.rewardCount4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardImage5 => $composableBuilder(
    column: $table.rewardImage5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rewardCount5 => $composableBuilder(
    column: $table.rewardCount5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bgPosition => $composableBuilder(
    column: $table.bgPosition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waveGroupId => $composableBuilder(
    column: $table.waveGroupId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyPositionX1 => $composableBuilder(
    column: $table.enemyPositionX1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyLocalPositionY1 => $composableBuilder(
    column: $table.enemyLocalPositionY1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enemySize1 => $composableBuilder(
    column: $table.enemySize1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyPositionX2 => $composableBuilder(
    column: $table.enemyPositionX2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyLocalPositionY2 => $composableBuilder(
    column: $table.enemyLocalPositionY2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enemySize2 => $composableBuilder(
    column: $table.enemySize2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyPositionX3 => $composableBuilder(
    column: $table.enemyPositionX3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyLocalPositionY3 => $composableBuilder(
    column: $table.enemyLocalPositionY3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enemySize3 => $composableBuilder(
    column: $table.enemySize3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyPositionX4 => $composableBuilder(
    column: $table.enemyPositionX4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyLocalPositionY4 => $composableBuilder(
    column: $table.enemyLocalPositionY4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enemySize4 => $composableBuilder(
    column: $table.enemySize4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyPositionX5 => $composableBuilder(
    column: $table.enemyPositionX5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get enemyLocalPositionY5 => $composableBuilder(
    column: $table.enemyLocalPositionY5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get enemySize5 => $composableBuilder(
    column: $table.enemySize5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get waveBgm => $composableBuilder(
    column: $table.waveBgm,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$Rarity6QuestDataTableAnnotationComposer
    extends Composer<_$AppDb, $Rarity6QuestDataTable> {
  $$Rarity6QuestDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get rarity6QuestId => $composableBuilder(
    column: $table.rarity6QuestId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get questName =>
      $composableBuilder(column: $table.questName, builder: (column) => column);

  GeneratedColumn<int> get limitTime =>
      $composableBuilder(column: $table.limitTime, builder: (column) => column);

  GeneratedColumn<int> get recommendedLevel => $composableBuilder(
    column: $table.recommendedLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardGroupId => $composableBuilder(
    column: $table.rewardGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get treasureType => $composableBuilder(
    column: $table.treasureType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardImage1 => $composableBuilder(
    column: $table.rewardImage1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardCount1 => $composableBuilder(
    column: $table.rewardCount1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardImage2 => $composableBuilder(
    column: $table.rewardImage2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardCount2 => $composableBuilder(
    column: $table.rewardCount2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardImage3 => $composableBuilder(
    column: $table.rewardImage3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardCount3 => $composableBuilder(
    column: $table.rewardCount3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardImage4 => $composableBuilder(
    column: $table.rewardImage4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardCount4 => $composableBuilder(
    column: $table.rewardCount4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardImage5 => $composableBuilder(
    column: $table.rewardImage5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get rewardCount5 => $composableBuilder(
    column: $table.rewardCount5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get background => $composableBuilder(
    column: $table.background,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bgPosition => $composableBuilder(
    column: $table.bgPosition,
    builder: (column) => column,
  );

  GeneratedColumn<int> get waveGroupId => $composableBuilder(
    column: $table.waveGroupId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyPositionX1 => $composableBuilder(
    column: $table.enemyPositionX1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyLocalPositionY1 => $composableBuilder(
    column: $table.enemyLocalPositionY1,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enemySize1 => $composableBuilder(
    column: $table.enemySize1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyPositionX2 => $composableBuilder(
    column: $table.enemyPositionX2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyLocalPositionY2 => $composableBuilder(
    column: $table.enemyLocalPositionY2,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enemySize2 => $composableBuilder(
    column: $table.enemySize2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyPositionX3 => $composableBuilder(
    column: $table.enemyPositionX3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyLocalPositionY3 => $composableBuilder(
    column: $table.enemyLocalPositionY3,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enemySize3 => $composableBuilder(
    column: $table.enemySize3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyPositionX4 => $composableBuilder(
    column: $table.enemyPositionX4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyLocalPositionY4 => $composableBuilder(
    column: $table.enemyLocalPositionY4,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enemySize4 => $composableBuilder(
    column: $table.enemySize4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyPositionX5 => $composableBuilder(
    column: $table.enemyPositionX5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get enemyLocalPositionY5 => $composableBuilder(
    column: $table.enemyLocalPositionY5,
    builder: (column) => column,
  );

  GeneratedColumn<double> get enemySize5 => $composableBuilder(
    column: $table.enemySize5,
    builder: (column) => column,
  );

  GeneratedColumn<String> get waveBgm =>
      $composableBuilder(column: $table.waveBgm, builder: (column) => column);
}

class $$Rarity6QuestDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $Rarity6QuestDataTable,
          Rarity6QuestDataData,
          $$Rarity6QuestDataTableFilterComposer,
          $$Rarity6QuestDataTableOrderingComposer,
          $$Rarity6QuestDataTableAnnotationComposer,
          $$Rarity6QuestDataTableCreateCompanionBuilder,
          $$Rarity6QuestDataTableUpdateCompanionBuilder,
          (
            Rarity6QuestDataData,
            BaseReferences<
              _$AppDb,
              $Rarity6QuestDataTable,
              Rarity6QuestDataData
            >,
          ),
          Rarity6QuestDataData,
          PrefetchHooks Function()
        > {
  $$Rarity6QuestDataTableTableManager(_$AppDb db, $Rarity6QuestDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$Rarity6QuestDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$Rarity6QuestDataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$Rarity6QuestDataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> rarity6QuestId = const Value.absent(),
                Value<int> unitId = const Value.absent(),
                Value<String> questName = const Value.absent(),
                Value<int> limitTime = const Value.absent(),
                Value<int> recommendedLevel = const Value.absent(),
                Value<int> rewardGroupId = const Value.absent(),
                Value<int> treasureType = const Value.absent(),
                Value<int> rewardImage1 = const Value.absent(),
                Value<int> rewardCount1 = const Value.absent(),
                Value<int> rewardImage2 = const Value.absent(),
                Value<int> rewardCount2 = const Value.absent(),
                Value<int> rewardImage3 = const Value.absent(),
                Value<int> rewardCount3 = const Value.absent(),
                Value<int> rewardImage4 = const Value.absent(),
                Value<int> rewardCount4 = const Value.absent(),
                Value<int> rewardImage5 = const Value.absent(),
                Value<int> rewardCount5 = const Value.absent(),
                Value<int> background = const Value.absent(),
                Value<int> bgPosition = const Value.absent(),
                Value<int> waveGroupId = const Value.absent(),
                Value<int> enemyPositionX1 = const Value.absent(),
                Value<int> enemyLocalPositionY1 = const Value.absent(),
                Value<double> enemySize1 = const Value.absent(),
                Value<int> enemyPositionX2 = const Value.absent(),
                Value<int> enemyLocalPositionY2 = const Value.absent(),
                Value<double> enemySize2 = const Value.absent(),
                Value<int> enemyPositionX3 = const Value.absent(),
                Value<int> enemyLocalPositionY3 = const Value.absent(),
                Value<double> enemySize3 = const Value.absent(),
                Value<int> enemyPositionX4 = const Value.absent(),
                Value<int> enemyLocalPositionY4 = const Value.absent(),
                Value<double> enemySize4 = const Value.absent(),
                Value<int> enemyPositionX5 = const Value.absent(),
                Value<int> enemyLocalPositionY5 = const Value.absent(),
                Value<double> enemySize5 = const Value.absent(),
                Value<String> waveBgm = const Value.absent(),
              }) => Rarity6QuestDataCompanion(
                rarity6QuestId: rarity6QuestId,
                unitId: unitId,
                questName: questName,
                limitTime: limitTime,
                recommendedLevel: recommendedLevel,
                rewardGroupId: rewardGroupId,
                treasureType: treasureType,
                rewardImage1: rewardImage1,
                rewardCount1: rewardCount1,
                rewardImage2: rewardImage2,
                rewardCount2: rewardCount2,
                rewardImage3: rewardImage3,
                rewardCount3: rewardCount3,
                rewardImage4: rewardImage4,
                rewardCount4: rewardCount4,
                rewardImage5: rewardImage5,
                rewardCount5: rewardCount5,
                background: background,
                bgPosition: bgPosition,
                waveGroupId: waveGroupId,
                enemyPositionX1: enemyPositionX1,
                enemyLocalPositionY1: enemyLocalPositionY1,
                enemySize1: enemySize1,
                enemyPositionX2: enemyPositionX2,
                enemyLocalPositionY2: enemyLocalPositionY2,
                enemySize2: enemySize2,
                enemyPositionX3: enemyPositionX3,
                enemyLocalPositionY3: enemyLocalPositionY3,
                enemySize3: enemySize3,
                enemyPositionX4: enemyPositionX4,
                enemyLocalPositionY4: enemyLocalPositionY4,
                enemySize4: enemySize4,
                enemyPositionX5: enemyPositionX5,
                enemyLocalPositionY5: enemyLocalPositionY5,
                enemySize5: enemySize5,
                waveBgm: waveBgm,
              ),
          createCompanionCallback:
              ({
                required int rarity6QuestId,
                Value<int> unitId = const Value.absent(),
                required String questName,
                required int limitTime,
                required int recommendedLevel,
                required int rewardGroupId,
                required int treasureType,
                required int rewardImage1,
                required int rewardCount1,
                required int rewardImage2,
                required int rewardCount2,
                required int rewardImage3,
                required int rewardCount3,
                required int rewardImage4,
                required int rewardCount4,
                required int rewardImage5,
                required int rewardCount5,
                required int background,
                required int bgPosition,
                required int waveGroupId,
                required int enemyPositionX1,
                required int enemyLocalPositionY1,
                required double enemySize1,
                required int enemyPositionX2,
                required int enemyLocalPositionY2,
                required double enemySize2,
                required int enemyPositionX3,
                required int enemyLocalPositionY3,
                required double enemySize3,
                required int enemyPositionX4,
                required int enemyLocalPositionY4,
                required double enemySize4,
                required int enemyPositionX5,
                required int enemyLocalPositionY5,
                required double enemySize5,
                required String waveBgm,
              }) => Rarity6QuestDataCompanion.insert(
                rarity6QuestId: rarity6QuestId,
                unitId: unitId,
                questName: questName,
                limitTime: limitTime,
                recommendedLevel: recommendedLevel,
                rewardGroupId: rewardGroupId,
                treasureType: treasureType,
                rewardImage1: rewardImage1,
                rewardCount1: rewardCount1,
                rewardImage2: rewardImage2,
                rewardCount2: rewardCount2,
                rewardImage3: rewardImage3,
                rewardCount3: rewardCount3,
                rewardImage4: rewardImage4,
                rewardCount4: rewardCount4,
                rewardImage5: rewardImage5,
                rewardCount5: rewardCount5,
                background: background,
                bgPosition: bgPosition,
                waveGroupId: waveGroupId,
                enemyPositionX1: enemyPositionX1,
                enemyLocalPositionY1: enemyLocalPositionY1,
                enemySize1: enemySize1,
                enemyPositionX2: enemyPositionX2,
                enemyLocalPositionY2: enemyLocalPositionY2,
                enemySize2: enemySize2,
                enemyPositionX3: enemyPositionX3,
                enemyLocalPositionY3: enemyLocalPositionY3,
                enemySize3: enemySize3,
                enemyPositionX4: enemyPositionX4,
                enemyLocalPositionY4: enemyLocalPositionY4,
                enemySize4: enemySize4,
                enemyPositionX5: enemyPositionX5,
                enemyLocalPositionY5: enemyLocalPositionY5,
                enemySize5: enemySize5,
                waveBgm: waveBgm,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$Rarity6QuestDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $Rarity6QuestDataTable,
      Rarity6QuestDataData,
      $$Rarity6QuestDataTableFilterComposer,
      $$Rarity6QuestDataTableOrderingComposer,
      $$Rarity6QuestDataTableAnnotationComposer,
      $$Rarity6QuestDataTableCreateCompanionBuilder,
      $$Rarity6QuestDataTableUpdateCompanionBuilder,
      (
        Rarity6QuestDataData,
        BaseReferences<_$AppDb, $Rarity6QuestDataTable, Rarity6QuestDataData>,
      ),
      Rarity6QuestDataData,
      PrefetchHooks Function()
    >;
typedef $$SkillDataTableCreateCompanionBuilder =
    SkillDataCompanion Function({
      Value<int> skillId,
      required String name,
      required int skillType,
      required int skillAreaWidth,
      required double skillCastTime,
      Value<double?> bossUbCoolTime,
      required int action1,
      required int action2,
      required int action3,
      required int action4,
      required int action5,
      required int action6,
      required int action7,
      required int action8,
      required int action9,
      required int action10,
      required int actionDepend1,
      required int actionDepend2,
      required int actionDepend3,
      required int actionDepend4,
      required int actionDepend5,
      required int actionDepend6,
      required int actionDepend7,
      required int actionDepend8,
      required int actionDepend9,
      required int actionDepend10,
      Value<String?> description,
      Value<int?> iconType,
    });
typedef $$SkillDataTableUpdateCompanionBuilder =
    SkillDataCompanion Function({
      Value<int> skillId,
      Value<String> name,
      Value<int> skillType,
      Value<int> skillAreaWidth,
      Value<double> skillCastTime,
      Value<double?> bossUbCoolTime,
      Value<int> action1,
      Value<int> action2,
      Value<int> action3,
      Value<int> action4,
      Value<int> action5,
      Value<int> action6,
      Value<int> action7,
      Value<int> action8,
      Value<int> action9,
      Value<int> action10,
      Value<int> actionDepend1,
      Value<int> actionDepend2,
      Value<int> actionDepend3,
      Value<int> actionDepend4,
      Value<int> actionDepend5,
      Value<int> actionDepend6,
      Value<int> actionDepend7,
      Value<int> actionDepend8,
      Value<int> actionDepend9,
      Value<int> actionDepend10,
      Value<String?> description,
      Value<int?> iconType,
    });

class $$SkillDataTableFilterComposer
    extends Composer<_$AppDb, $SkillDataTable> {
  $$SkillDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skillType => $composableBuilder(
    column: $table.skillType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skillAreaWidth => $composableBuilder(
    column: $table.skillAreaWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get skillCastTime => $composableBuilder(
    column: $table.skillCastTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get bossUbCoolTime => $composableBuilder(
    column: $table.bossUbCoolTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action1 => $composableBuilder(
    column: $table.action1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action2 => $composableBuilder(
    column: $table.action2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action3 => $composableBuilder(
    column: $table.action3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action4 => $composableBuilder(
    column: $table.action4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action5 => $composableBuilder(
    column: $table.action5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action6 => $composableBuilder(
    column: $table.action6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action7 => $composableBuilder(
    column: $table.action7,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action8 => $composableBuilder(
    column: $table.action8,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action9 => $composableBuilder(
    column: $table.action9,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get action10 => $composableBuilder(
    column: $table.action10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend1 => $composableBuilder(
    column: $table.actionDepend1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend2 => $composableBuilder(
    column: $table.actionDepend2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend3 => $composableBuilder(
    column: $table.actionDepend3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend4 => $composableBuilder(
    column: $table.actionDepend4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend5 => $composableBuilder(
    column: $table.actionDepend5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend6 => $composableBuilder(
    column: $table.actionDepend6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend7 => $composableBuilder(
    column: $table.actionDepend7,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend8 => $composableBuilder(
    column: $table.actionDepend8,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend9 => $composableBuilder(
    column: $table.actionDepend9,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDepend10 => $composableBuilder(
    column: $table.actionDepend10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get iconType => $composableBuilder(
    column: $table.iconType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkillDataTableOrderingComposer
    extends Composer<_$AppDb, $SkillDataTable> {
  $$SkillDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skillType => $composableBuilder(
    column: $table.skillType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skillAreaWidth => $composableBuilder(
    column: $table.skillAreaWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get skillCastTime => $composableBuilder(
    column: $table.skillCastTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get bossUbCoolTime => $composableBuilder(
    column: $table.bossUbCoolTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action1 => $composableBuilder(
    column: $table.action1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action2 => $composableBuilder(
    column: $table.action2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action3 => $composableBuilder(
    column: $table.action3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action4 => $composableBuilder(
    column: $table.action4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action5 => $composableBuilder(
    column: $table.action5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action6 => $composableBuilder(
    column: $table.action6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action7 => $composableBuilder(
    column: $table.action7,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action8 => $composableBuilder(
    column: $table.action8,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action9 => $composableBuilder(
    column: $table.action9,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get action10 => $composableBuilder(
    column: $table.action10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend1 => $composableBuilder(
    column: $table.actionDepend1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend2 => $composableBuilder(
    column: $table.actionDepend2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend3 => $composableBuilder(
    column: $table.actionDepend3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend4 => $composableBuilder(
    column: $table.actionDepend4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend5 => $composableBuilder(
    column: $table.actionDepend5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend6 => $composableBuilder(
    column: $table.actionDepend6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend7 => $composableBuilder(
    column: $table.actionDepend7,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend8 => $composableBuilder(
    column: $table.actionDepend8,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend9 => $composableBuilder(
    column: $table.actionDepend9,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDepend10 => $composableBuilder(
    column: $table.actionDepend10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get iconType => $composableBuilder(
    column: $table.iconType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkillDataTableAnnotationComposer
    extends Composer<_$AppDb, $SkillDataTable> {
  $$SkillDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get skillId =>
      $composableBuilder(column: $table.skillId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get skillType =>
      $composableBuilder(column: $table.skillType, builder: (column) => column);

  GeneratedColumn<int> get skillAreaWidth => $composableBuilder(
    column: $table.skillAreaWidth,
    builder: (column) => column,
  );

  GeneratedColumn<double> get skillCastTime => $composableBuilder(
    column: $table.skillCastTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get bossUbCoolTime => $composableBuilder(
    column: $table.bossUbCoolTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get action1 =>
      $composableBuilder(column: $table.action1, builder: (column) => column);

  GeneratedColumn<int> get action2 =>
      $composableBuilder(column: $table.action2, builder: (column) => column);

  GeneratedColumn<int> get action3 =>
      $composableBuilder(column: $table.action3, builder: (column) => column);

  GeneratedColumn<int> get action4 =>
      $composableBuilder(column: $table.action4, builder: (column) => column);

  GeneratedColumn<int> get action5 =>
      $composableBuilder(column: $table.action5, builder: (column) => column);

  GeneratedColumn<int> get action6 =>
      $composableBuilder(column: $table.action6, builder: (column) => column);

  GeneratedColumn<int> get action7 =>
      $composableBuilder(column: $table.action7, builder: (column) => column);

  GeneratedColumn<int> get action8 =>
      $composableBuilder(column: $table.action8, builder: (column) => column);

  GeneratedColumn<int> get action9 =>
      $composableBuilder(column: $table.action9, builder: (column) => column);

  GeneratedColumn<int> get action10 =>
      $composableBuilder(column: $table.action10, builder: (column) => column);

  GeneratedColumn<int> get actionDepend1 => $composableBuilder(
    column: $table.actionDepend1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend2 => $composableBuilder(
    column: $table.actionDepend2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend3 => $composableBuilder(
    column: $table.actionDepend3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend4 => $composableBuilder(
    column: $table.actionDepend4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend5 => $composableBuilder(
    column: $table.actionDepend5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend6 => $composableBuilder(
    column: $table.actionDepend6,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend7 => $composableBuilder(
    column: $table.actionDepend7,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend8 => $composableBuilder(
    column: $table.actionDepend8,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend9 => $composableBuilder(
    column: $table.actionDepend9,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDepend10 => $composableBuilder(
    column: $table.actionDepend10,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get iconType =>
      $composableBuilder(column: $table.iconType, builder: (column) => column);
}

class $$SkillDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SkillDataTable,
          SkillDataData,
          $$SkillDataTableFilterComposer,
          $$SkillDataTableOrderingComposer,
          $$SkillDataTableAnnotationComposer,
          $$SkillDataTableCreateCompanionBuilder,
          $$SkillDataTableUpdateCompanionBuilder,
          (
            SkillDataData,
            BaseReferences<_$AppDb, $SkillDataTable, SkillDataData>,
          ),
          SkillDataData,
          PrefetchHooks Function()
        > {
  $$SkillDataTableTableManager(_$AppDb db, $SkillDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SkillDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SkillDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SkillDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> skillId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> skillType = const Value.absent(),
                Value<int> skillAreaWidth = const Value.absent(),
                Value<double> skillCastTime = const Value.absent(),
                Value<double?> bossUbCoolTime = const Value.absent(),
                Value<int> action1 = const Value.absent(),
                Value<int> action2 = const Value.absent(),
                Value<int> action3 = const Value.absent(),
                Value<int> action4 = const Value.absent(),
                Value<int> action5 = const Value.absent(),
                Value<int> action6 = const Value.absent(),
                Value<int> action7 = const Value.absent(),
                Value<int> action8 = const Value.absent(),
                Value<int> action9 = const Value.absent(),
                Value<int> action10 = const Value.absent(),
                Value<int> actionDepend1 = const Value.absent(),
                Value<int> actionDepend2 = const Value.absent(),
                Value<int> actionDepend3 = const Value.absent(),
                Value<int> actionDepend4 = const Value.absent(),
                Value<int> actionDepend5 = const Value.absent(),
                Value<int> actionDepend6 = const Value.absent(),
                Value<int> actionDepend7 = const Value.absent(),
                Value<int> actionDepend8 = const Value.absent(),
                Value<int> actionDepend9 = const Value.absent(),
                Value<int> actionDepend10 = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> iconType = const Value.absent(),
              }) => SkillDataCompanion(
                skillId: skillId,
                name: name,
                skillType: skillType,
                skillAreaWidth: skillAreaWidth,
                skillCastTime: skillCastTime,
                bossUbCoolTime: bossUbCoolTime,
                action1: action1,
                action2: action2,
                action3: action3,
                action4: action4,
                action5: action5,
                action6: action6,
                action7: action7,
                action8: action8,
                action9: action9,
                action10: action10,
                actionDepend1: actionDepend1,
                actionDepend2: actionDepend2,
                actionDepend3: actionDepend3,
                actionDepend4: actionDepend4,
                actionDepend5: actionDepend5,
                actionDepend6: actionDepend6,
                actionDepend7: actionDepend7,
                actionDepend8: actionDepend8,
                actionDepend9: actionDepend9,
                actionDepend10: actionDepend10,
                description: description,
                iconType: iconType,
              ),
          createCompanionCallback:
              ({
                Value<int> skillId = const Value.absent(),
                required String name,
                required int skillType,
                required int skillAreaWidth,
                required double skillCastTime,
                Value<double?> bossUbCoolTime = const Value.absent(),
                required int action1,
                required int action2,
                required int action3,
                required int action4,
                required int action5,
                required int action6,
                required int action7,
                required int action8,
                required int action9,
                required int action10,
                required int actionDepend1,
                required int actionDepend2,
                required int actionDepend3,
                required int actionDepend4,
                required int actionDepend5,
                required int actionDepend6,
                required int actionDepend7,
                required int actionDepend8,
                required int actionDepend9,
                required int actionDepend10,
                Value<String?> description = const Value.absent(),
                Value<int?> iconType = const Value.absent(),
              }) => SkillDataCompanion.insert(
                skillId: skillId,
                name: name,
                skillType: skillType,
                skillAreaWidth: skillAreaWidth,
                skillCastTime: skillCastTime,
                bossUbCoolTime: bossUbCoolTime,
                action1: action1,
                action2: action2,
                action3: action3,
                action4: action4,
                action5: action5,
                action6: action6,
                action7: action7,
                action8: action8,
                action9: action9,
                action10: action10,
                actionDepend1: actionDepend1,
                actionDepend2: actionDepend2,
                actionDepend3: actionDepend3,
                actionDepend4: actionDepend4,
                actionDepend5: actionDepend5,
                actionDepend6: actionDepend6,
                actionDepend7: actionDepend7,
                actionDepend8: actionDepend8,
                actionDepend9: actionDepend9,
                actionDepend10: actionDepend10,
                description: description,
                iconType: iconType,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkillDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SkillDataTable,
      SkillDataData,
      $$SkillDataTableFilterComposer,
      $$SkillDataTableOrderingComposer,
      $$SkillDataTableAnnotationComposer,
      $$SkillDataTableCreateCompanionBuilder,
      $$SkillDataTableUpdateCompanionBuilder,
      (SkillDataData, BaseReferences<_$AppDb, $SkillDataTable, SkillDataData>),
      SkillDataData,
      PrefetchHooks Function()
    >;
typedef $$UnitSkillDataTableCreateCompanionBuilder =
    UnitSkillDataCompanion Function({
      Value<int> unitId,
      required int unionBurst,
      required int spUnionBurst,
      Value<int?> unionBurstEvolution,
      required int mainSkill1,
      required int mainSkill2,
      required int mainSkill3,
      required int mainSkill4,
      required int mainSkill5,
      required int mainSkill6,
      required int mainSkill7,
      required int mainSkill8,
      required int mainSkill9,
      required int mainSkill10,
      Value<int?> mainSkillEvolution1,
      Value<int?> mainSkillEvolution2,
      required int exSkill1,
      required int exSkill2,
      required int exSkill3,
      required int exSkill4,
      required int exSkill5,
      Value<int?> exSkillEvolution1,
      Value<int?> exSkillEvolution2,
      Value<int?> exSkillEvolution3,
      Value<int?> exSkillEvolution4,
      Value<int?> exSkillEvolution5,
      required int spSkill1,
      required int spSkill2,
      required int spSkill3,
      required int spSkill4,
      required int spSkill5,
      Value<int?> spSkillEvolution1,
      Value<int?> spSkillEvolution2,
    });
typedef $$UnitSkillDataTableUpdateCompanionBuilder =
    UnitSkillDataCompanion Function({
      Value<int> unitId,
      Value<int> unionBurst,
      Value<int> spUnionBurst,
      Value<int?> unionBurstEvolution,
      Value<int> mainSkill1,
      Value<int> mainSkill2,
      Value<int> mainSkill3,
      Value<int> mainSkill4,
      Value<int> mainSkill5,
      Value<int> mainSkill6,
      Value<int> mainSkill7,
      Value<int> mainSkill8,
      Value<int> mainSkill9,
      Value<int> mainSkill10,
      Value<int?> mainSkillEvolution1,
      Value<int?> mainSkillEvolution2,
      Value<int> exSkill1,
      Value<int> exSkill2,
      Value<int> exSkill3,
      Value<int> exSkill4,
      Value<int> exSkill5,
      Value<int?> exSkillEvolution1,
      Value<int?> exSkillEvolution2,
      Value<int?> exSkillEvolution3,
      Value<int?> exSkillEvolution4,
      Value<int?> exSkillEvolution5,
      Value<int> spSkill1,
      Value<int> spSkill2,
      Value<int> spSkill3,
      Value<int> spSkill4,
      Value<int> spSkill5,
      Value<int?> spSkillEvolution1,
      Value<int?> spSkillEvolution2,
    });

class $$UnitSkillDataTableFilterComposer
    extends Composer<_$AppDb, $UnitSkillDataTable> {
  $$UnitSkillDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unionBurst => $composableBuilder(
    column: $table.unionBurst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spUnionBurst => $composableBuilder(
    column: $table.spUnionBurst,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unionBurstEvolution => $composableBuilder(
    column: $table.unionBurstEvolution,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill1 => $composableBuilder(
    column: $table.mainSkill1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill2 => $composableBuilder(
    column: $table.mainSkill2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill3 => $composableBuilder(
    column: $table.mainSkill3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill4 => $composableBuilder(
    column: $table.mainSkill4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill5 => $composableBuilder(
    column: $table.mainSkill5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill6 => $composableBuilder(
    column: $table.mainSkill6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill7 => $composableBuilder(
    column: $table.mainSkill7,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill8 => $composableBuilder(
    column: $table.mainSkill8,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill9 => $composableBuilder(
    column: $table.mainSkill9,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkill10 => $composableBuilder(
    column: $table.mainSkill10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkillEvolution1 => $composableBuilder(
    column: $table.mainSkillEvolution1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mainSkillEvolution2 => $composableBuilder(
    column: $table.mainSkillEvolution2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkill1 => $composableBuilder(
    column: $table.exSkill1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkill2 => $composableBuilder(
    column: $table.exSkill2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkill3 => $composableBuilder(
    column: $table.exSkill3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkill4 => $composableBuilder(
    column: $table.exSkill4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkill5 => $composableBuilder(
    column: $table.exSkill5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkillEvolution1 => $composableBuilder(
    column: $table.exSkillEvolution1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkillEvolution2 => $composableBuilder(
    column: $table.exSkillEvolution2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkillEvolution3 => $composableBuilder(
    column: $table.exSkillEvolution3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkillEvolution4 => $composableBuilder(
    column: $table.exSkillEvolution4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exSkillEvolution5 => $composableBuilder(
    column: $table.exSkillEvolution5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkill1 => $composableBuilder(
    column: $table.spSkill1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkill2 => $composableBuilder(
    column: $table.spSkill2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkill3 => $composableBuilder(
    column: $table.spSkill3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkill4 => $composableBuilder(
    column: $table.spSkill4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkill5 => $composableBuilder(
    column: $table.spSkill5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkillEvolution1 => $composableBuilder(
    column: $table.spSkillEvolution1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get spSkillEvolution2 => $composableBuilder(
    column: $table.spSkillEvolution2,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitSkillDataTableOrderingComposer
    extends Composer<_$AppDb, $UnitSkillDataTable> {
  $$UnitSkillDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unionBurst => $composableBuilder(
    column: $table.unionBurst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spUnionBurst => $composableBuilder(
    column: $table.spUnionBurst,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unionBurstEvolution => $composableBuilder(
    column: $table.unionBurstEvolution,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill1 => $composableBuilder(
    column: $table.mainSkill1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill2 => $composableBuilder(
    column: $table.mainSkill2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill3 => $composableBuilder(
    column: $table.mainSkill3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill4 => $composableBuilder(
    column: $table.mainSkill4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill5 => $composableBuilder(
    column: $table.mainSkill5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill6 => $composableBuilder(
    column: $table.mainSkill6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill7 => $composableBuilder(
    column: $table.mainSkill7,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill8 => $composableBuilder(
    column: $table.mainSkill8,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill9 => $composableBuilder(
    column: $table.mainSkill9,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkill10 => $composableBuilder(
    column: $table.mainSkill10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkillEvolution1 => $composableBuilder(
    column: $table.mainSkillEvolution1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mainSkillEvolution2 => $composableBuilder(
    column: $table.mainSkillEvolution2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkill1 => $composableBuilder(
    column: $table.exSkill1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkill2 => $composableBuilder(
    column: $table.exSkill2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkill3 => $composableBuilder(
    column: $table.exSkill3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkill4 => $composableBuilder(
    column: $table.exSkill4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkill5 => $composableBuilder(
    column: $table.exSkill5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkillEvolution1 => $composableBuilder(
    column: $table.exSkillEvolution1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkillEvolution2 => $composableBuilder(
    column: $table.exSkillEvolution2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkillEvolution3 => $composableBuilder(
    column: $table.exSkillEvolution3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkillEvolution4 => $composableBuilder(
    column: $table.exSkillEvolution4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exSkillEvolution5 => $composableBuilder(
    column: $table.exSkillEvolution5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkill1 => $composableBuilder(
    column: $table.spSkill1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkill2 => $composableBuilder(
    column: $table.spSkill2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkill3 => $composableBuilder(
    column: $table.spSkill3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkill4 => $composableBuilder(
    column: $table.spSkill4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkill5 => $composableBuilder(
    column: $table.spSkill5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkillEvolution1 => $composableBuilder(
    column: $table.spSkillEvolution1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get spSkillEvolution2 => $composableBuilder(
    column: $table.spSkillEvolution2,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitSkillDataTableAnnotationComposer
    extends Composer<_$AppDb, $UnitSkillDataTable> {
  $$UnitSkillDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<int> get unionBurst => $composableBuilder(
    column: $table.unionBurst,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spUnionBurst => $composableBuilder(
    column: $table.spUnionBurst,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unionBurstEvolution => $composableBuilder(
    column: $table.unionBurstEvolution,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill1 => $composableBuilder(
    column: $table.mainSkill1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill2 => $composableBuilder(
    column: $table.mainSkill2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill3 => $composableBuilder(
    column: $table.mainSkill3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill4 => $composableBuilder(
    column: $table.mainSkill4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill5 => $composableBuilder(
    column: $table.mainSkill5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill6 => $composableBuilder(
    column: $table.mainSkill6,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill7 => $composableBuilder(
    column: $table.mainSkill7,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill8 => $composableBuilder(
    column: $table.mainSkill8,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill9 => $composableBuilder(
    column: $table.mainSkill9,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkill10 => $composableBuilder(
    column: $table.mainSkill10,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkillEvolution1 => $composableBuilder(
    column: $table.mainSkillEvolution1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mainSkillEvolution2 => $composableBuilder(
    column: $table.mainSkillEvolution2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exSkill1 =>
      $composableBuilder(column: $table.exSkill1, builder: (column) => column);

  GeneratedColumn<int> get exSkill2 =>
      $composableBuilder(column: $table.exSkill2, builder: (column) => column);

  GeneratedColumn<int> get exSkill3 =>
      $composableBuilder(column: $table.exSkill3, builder: (column) => column);

  GeneratedColumn<int> get exSkill4 =>
      $composableBuilder(column: $table.exSkill4, builder: (column) => column);

  GeneratedColumn<int> get exSkill5 =>
      $composableBuilder(column: $table.exSkill5, builder: (column) => column);

  GeneratedColumn<int> get exSkillEvolution1 => $composableBuilder(
    column: $table.exSkillEvolution1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exSkillEvolution2 => $composableBuilder(
    column: $table.exSkillEvolution2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exSkillEvolution3 => $composableBuilder(
    column: $table.exSkillEvolution3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exSkillEvolution4 => $composableBuilder(
    column: $table.exSkillEvolution4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exSkillEvolution5 => $composableBuilder(
    column: $table.exSkillEvolution5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spSkill1 =>
      $composableBuilder(column: $table.spSkill1, builder: (column) => column);

  GeneratedColumn<int> get spSkill2 =>
      $composableBuilder(column: $table.spSkill2, builder: (column) => column);

  GeneratedColumn<int> get spSkill3 =>
      $composableBuilder(column: $table.spSkill3, builder: (column) => column);

  GeneratedColumn<int> get spSkill4 =>
      $composableBuilder(column: $table.spSkill4, builder: (column) => column);

  GeneratedColumn<int> get spSkill5 =>
      $composableBuilder(column: $table.spSkill5, builder: (column) => column);

  GeneratedColumn<int> get spSkillEvolution1 => $composableBuilder(
    column: $table.spSkillEvolution1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get spSkillEvolution2 => $composableBuilder(
    column: $table.spSkillEvolution2,
    builder: (column) => column,
  );
}

class $$UnitSkillDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UnitSkillDataTable,
          UnitSkillDataData,
          $$UnitSkillDataTableFilterComposer,
          $$UnitSkillDataTableOrderingComposer,
          $$UnitSkillDataTableAnnotationComposer,
          $$UnitSkillDataTableCreateCompanionBuilder,
          $$UnitSkillDataTableUpdateCompanionBuilder,
          (
            UnitSkillDataData,
            BaseReferences<_$AppDb, $UnitSkillDataTable, UnitSkillDataData>,
          ),
          UnitSkillDataData,
          PrefetchHooks Function()
        > {
  $$UnitSkillDataTableTableManager(_$AppDb db, $UnitSkillDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UnitSkillDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$UnitSkillDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UnitSkillDataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<int> unionBurst = const Value.absent(),
                Value<int> spUnionBurst = const Value.absent(),
                Value<int?> unionBurstEvolution = const Value.absent(),
                Value<int> mainSkill1 = const Value.absent(),
                Value<int> mainSkill2 = const Value.absent(),
                Value<int> mainSkill3 = const Value.absent(),
                Value<int> mainSkill4 = const Value.absent(),
                Value<int> mainSkill5 = const Value.absent(),
                Value<int> mainSkill6 = const Value.absent(),
                Value<int> mainSkill7 = const Value.absent(),
                Value<int> mainSkill8 = const Value.absent(),
                Value<int> mainSkill9 = const Value.absent(),
                Value<int> mainSkill10 = const Value.absent(),
                Value<int?> mainSkillEvolution1 = const Value.absent(),
                Value<int?> mainSkillEvolution2 = const Value.absent(),
                Value<int> exSkill1 = const Value.absent(),
                Value<int> exSkill2 = const Value.absent(),
                Value<int> exSkill3 = const Value.absent(),
                Value<int> exSkill4 = const Value.absent(),
                Value<int> exSkill5 = const Value.absent(),
                Value<int?> exSkillEvolution1 = const Value.absent(),
                Value<int?> exSkillEvolution2 = const Value.absent(),
                Value<int?> exSkillEvolution3 = const Value.absent(),
                Value<int?> exSkillEvolution4 = const Value.absent(),
                Value<int?> exSkillEvolution5 = const Value.absent(),
                Value<int> spSkill1 = const Value.absent(),
                Value<int> spSkill2 = const Value.absent(),
                Value<int> spSkill3 = const Value.absent(),
                Value<int> spSkill4 = const Value.absent(),
                Value<int> spSkill5 = const Value.absent(),
                Value<int?> spSkillEvolution1 = const Value.absent(),
                Value<int?> spSkillEvolution2 = const Value.absent(),
              }) => UnitSkillDataCompanion(
                unitId: unitId,
                unionBurst: unionBurst,
                spUnionBurst: spUnionBurst,
                unionBurstEvolution: unionBurstEvolution,
                mainSkill1: mainSkill1,
                mainSkill2: mainSkill2,
                mainSkill3: mainSkill3,
                mainSkill4: mainSkill4,
                mainSkill5: mainSkill5,
                mainSkill6: mainSkill6,
                mainSkill7: mainSkill7,
                mainSkill8: mainSkill8,
                mainSkill9: mainSkill9,
                mainSkill10: mainSkill10,
                mainSkillEvolution1: mainSkillEvolution1,
                mainSkillEvolution2: mainSkillEvolution2,
                exSkill1: exSkill1,
                exSkill2: exSkill2,
                exSkill3: exSkill3,
                exSkill4: exSkill4,
                exSkill5: exSkill5,
                exSkillEvolution1: exSkillEvolution1,
                exSkillEvolution2: exSkillEvolution2,
                exSkillEvolution3: exSkillEvolution3,
                exSkillEvolution4: exSkillEvolution4,
                exSkillEvolution5: exSkillEvolution5,
                spSkill1: spSkill1,
                spSkill2: spSkill2,
                spSkill3: spSkill3,
                spSkill4: spSkill4,
                spSkill5: spSkill5,
                spSkillEvolution1: spSkillEvolution1,
                spSkillEvolution2: spSkillEvolution2,
              ),
          createCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                required int unionBurst,
                required int spUnionBurst,
                Value<int?> unionBurstEvolution = const Value.absent(),
                required int mainSkill1,
                required int mainSkill2,
                required int mainSkill3,
                required int mainSkill4,
                required int mainSkill5,
                required int mainSkill6,
                required int mainSkill7,
                required int mainSkill8,
                required int mainSkill9,
                required int mainSkill10,
                Value<int?> mainSkillEvolution1 = const Value.absent(),
                Value<int?> mainSkillEvolution2 = const Value.absent(),
                required int exSkill1,
                required int exSkill2,
                required int exSkill3,
                required int exSkill4,
                required int exSkill5,
                Value<int?> exSkillEvolution1 = const Value.absent(),
                Value<int?> exSkillEvolution2 = const Value.absent(),
                Value<int?> exSkillEvolution3 = const Value.absent(),
                Value<int?> exSkillEvolution4 = const Value.absent(),
                Value<int?> exSkillEvolution5 = const Value.absent(),
                required int spSkill1,
                required int spSkill2,
                required int spSkill3,
                required int spSkill4,
                required int spSkill5,
                Value<int?> spSkillEvolution1 = const Value.absent(),
                Value<int?> spSkillEvolution2 = const Value.absent(),
              }) => UnitSkillDataCompanion.insert(
                unitId: unitId,
                unionBurst: unionBurst,
                spUnionBurst: spUnionBurst,
                unionBurstEvolution: unionBurstEvolution,
                mainSkill1: mainSkill1,
                mainSkill2: mainSkill2,
                mainSkill3: mainSkill3,
                mainSkill4: mainSkill4,
                mainSkill5: mainSkill5,
                mainSkill6: mainSkill6,
                mainSkill7: mainSkill7,
                mainSkill8: mainSkill8,
                mainSkill9: mainSkill9,
                mainSkill10: mainSkill10,
                mainSkillEvolution1: mainSkillEvolution1,
                mainSkillEvolution2: mainSkillEvolution2,
                exSkill1: exSkill1,
                exSkill2: exSkill2,
                exSkill3: exSkill3,
                exSkill4: exSkill4,
                exSkill5: exSkill5,
                exSkillEvolution1: exSkillEvolution1,
                exSkillEvolution2: exSkillEvolution2,
                exSkillEvolution3: exSkillEvolution3,
                exSkillEvolution4: exSkillEvolution4,
                exSkillEvolution5: exSkillEvolution5,
                spSkill1: spSkill1,
                spSkill2: spSkill2,
                spSkill3: spSkill3,
                spSkill4: spSkill4,
                spSkill5: spSkill5,
                spSkillEvolution1: spSkillEvolution1,
                spSkillEvolution2: spSkillEvolution2,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitSkillDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UnitSkillDataTable,
      UnitSkillDataData,
      $$UnitSkillDataTableFilterComposer,
      $$UnitSkillDataTableOrderingComposer,
      $$UnitSkillDataTableAnnotationComposer,
      $$UnitSkillDataTableCreateCompanionBuilder,
      $$UnitSkillDataTableUpdateCompanionBuilder,
      (
        UnitSkillDataData,
        BaseReferences<_$AppDb, $UnitSkillDataTable, UnitSkillDataData>,
      ),
      UnitSkillDataData,
      PrefetchHooks Function()
    >;
typedef $$SkillActionTableCreateCompanionBuilder =
    SkillActionCompanion Function({
      Value<int> actionId,
      required int classId,
      required int actionType,
      required int actionDetail1,
      required int actionDetail2,
      required int actionDetail3,
      required double actionValue1,
      required double actionValue2,
      required double actionValue3,
      required double actionValue4,
      required double actionValue5,
      required double actionValue6,
      required double actionValue7,
      required int targetAssignment,
      required int targetArea,
      required int targetRange,
      required int targetType,
      required int targetNumber,
      required int targetCount,
      Value<String?> description,
      Value<String?> levelUpDisp,
    });
typedef $$SkillActionTableUpdateCompanionBuilder =
    SkillActionCompanion Function({
      Value<int> actionId,
      Value<int> classId,
      Value<int> actionType,
      Value<int> actionDetail1,
      Value<int> actionDetail2,
      Value<int> actionDetail3,
      Value<double> actionValue1,
      Value<double> actionValue2,
      Value<double> actionValue3,
      Value<double> actionValue4,
      Value<double> actionValue5,
      Value<double> actionValue6,
      Value<double> actionValue7,
      Value<int> targetAssignment,
      Value<int> targetArea,
      Value<int> targetRange,
      Value<int> targetType,
      Value<int> targetNumber,
      Value<int> targetCount,
      Value<String?> description,
      Value<String?> levelUpDisp,
    });

class $$SkillActionTableFilterComposer
    extends Composer<_$AppDb, $SkillActionTable> {
  $$SkillActionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDetail1 => $composableBuilder(
    column: $table.actionDetail1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDetail2 => $composableBuilder(
    column: $table.actionDetail2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get actionDetail3 => $composableBuilder(
    column: $table.actionDetail3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue1 => $composableBuilder(
    column: $table.actionValue1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue2 => $composableBuilder(
    column: $table.actionValue2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue3 => $composableBuilder(
    column: $table.actionValue3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue4 => $composableBuilder(
    column: $table.actionValue4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue5 => $composableBuilder(
    column: $table.actionValue5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue6 => $composableBuilder(
    column: $table.actionValue6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get actionValue7 => $composableBuilder(
    column: $table.actionValue7,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetAssignment => $composableBuilder(
    column: $table.targetAssignment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetArea => $composableBuilder(
    column: $table.targetArea,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetRange => $composableBuilder(
    column: $table.targetRange,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetNumber => $composableBuilder(
    column: $table.targetNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get levelUpDisp => $composableBuilder(
    column: $table.levelUpDisp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SkillActionTableOrderingComposer
    extends Composer<_$AppDb, $SkillActionTable> {
  $$SkillActionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get actionId => $composableBuilder(
    column: $table.actionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDetail1 => $composableBuilder(
    column: $table.actionDetail1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDetail2 => $composableBuilder(
    column: $table.actionDetail2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get actionDetail3 => $composableBuilder(
    column: $table.actionDetail3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue1 => $composableBuilder(
    column: $table.actionValue1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue2 => $composableBuilder(
    column: $table.actionValue2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue3 => $composableBuilder(
    column: $table.actionValue3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue4 => $composableBuilder(
    column: $table.actionValue4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue5 => $composableBuilder(
    column: $table.actionValue5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue6 => $composableBuilder(
    column: $table.actionValue6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get actionValue7 => $composableBuilder(
    column: $table.actionValue7,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetAssignment => $composableBuilder(
    column: $table.targetAssignment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetArea => $composableBuilder(
    column: $table.targetArea,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetRange => $composableBuilder(
    column: $table.targetRange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetNumber => $composableBuilder(
    column: $table.targetNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get levelUpDisp => $composableBuilder(
    column: $table.levelUpDisp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SkillActionTableAnnotationComposer
    extends Composer<_$AppDb, $SkillActionTable> {
  $$SkillActionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get actionId =>
      $composableBuilder(column: $table.actionId, builder: (column) => column);

  GeneratedColumn<int> get classId =>
      $composableBuilder(column: $table.classId, builder: (column) => column);

  GeneratedColumn<int> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDetail1 => $composableBuilder(
    column: $table.actionDetail1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDetail2 => $composableBuilder(
    column: $table.actionDetail2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get actionDetail3 => $composableBuilder(
    column: $table.actionDetail3,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue1 => $composableBuilder(
    column: $table.actionValue1,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue2 => $composableBuilder(
    column: $table.actionValue2,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue3 => $composableBuilder(
    column: $table.actionValue3,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue4 => $composableBuilder(
    column: $table.actionValue4,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue5 => $composableBuilder(
    column: $table.actionValue5,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue6 => $composableBuilder(
    column: $table.actionValue6,
    builder: (column) => column,
  );

  GeneratedColumn<double> get actionValue7 => $composableBuilder(
    column: $table.actionValue7,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetAssignment => $composableBuilder(
    column: $table.targetAssignment,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetArea => $composableBuilder(
    column: $table.targetArea,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetRange => $composableBuilder(
    column: $table.targetRange,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetType => $composableBuilder(
    column: $table.targetType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetNumber => $composableBuilder(
    column: $table.targetNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetCount => $composableBuilder(
    column: $table.targetCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get levelUpDisp => $composableBuilder(
    column: $table.levelUpDisp,
    builder: (column) => column,
  );
}

class $$SkillActionTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SkillActionTable,
          SkillActionData,
          $$SkillActionTableFilterComposer,
          $$SkillActionTableOrderingComposer,
          $$SkillActionTableAnnotationComposer,
          $$SkillActionTableCreateCompanionBuilder,
          $$SkillActionTableUpdateCompanionBuilder,
          (
            SkillActionData,
            BaseReferences<_$AppDb, $SkillActionTable, SkillActionData>,
          ),
          SkillActionData,
          PrefetchHooks Function()
        > {
  $$SkillActionTableTableManager(_$AppDb db, $SkillActionTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SkillActionTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SkillActionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SkillActionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> actionId = const Value.absent(),
                Value<int> classId = const Value.absent(),
                Value<int> actionType = const Value.absent(),
                Value<int> actionDetail1 = const Value.absent(),
                Value<int> actionDetail2 = const Value.absent(),
                Value<int> actionDetail3 = const Value.absent(),
                Value<double> actionValue1 = const Value.absent(),
                Value<double> actionValue2 = const Value.absent(),
                Value<double> actionValue3 = const Value.absent(),
                Value<double> actionValue4 = const Value.absent(),
                Value<double> actionValue5 = const Value.absent(),
                Value<double> actionValue6 = const Value.absent(),
                Value<double> actionValue7 = const Value.absent(),
                Value<int> targetAssignment = const Value.absent(),
                Value<int> targetArea = const Value.absent(),
                Value<int> targetRange = const Value.absent(),
                Value<int> targetType = const Value.absent(),
                Value<int> targetNumber = const Value.absent(),
                Value<int> targetCount = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> levelUpDisp = const Value.absent(),
              }) => SkillActionCompanion(
                actionId: actionId,
                classId: classId,
                actionType: actionType,
                actionDetail1: actionDetail1,
                actionDetail2: actionDetail2,
                actionDetail3: actionDetail3,
                actionValue1: actionValue1,
                actionValue2: actionValue2,
                actionValue3: actionValue3,
                actionValue4: actionValue4,
                actionValue5: actionValue5,
                actionValue6: actionValue6,
                actionValue7: actionValue7,
                targetAssignment: targetAssignment,
                targetArea: targetArea,
                targetRange: targetRange,
                targetType: targetType,
                targetNumber: targetNumber,
                targetCount: targetCount,
                description: description,
                levelUpDisp: levelUpDisp,
              ),
          createCompanionCallback:
              ({
                Value<int> actionId = const Value.absent(),
                required int classId,
                required int actionType,
                required int actionDetail1,
                required int actionDetail2,
                required int actionDetail3,
                required double actionValue1,
                required double actionValue2,
                required double actionValue3,
                required double actionValue4,
                required double actionValue5,
                required double actionValue6,
                required double actionValue7,
                required int targetAssignment,
                required int targetArea,
                required int targetRange,
                required int targetType,
                required int targetNumber,
                required int targetCount,
                Value<String?> description = const Value.absent(),
                Value<String?> levelUpDisp = const Value.absent(),
              }) => SkillActionCompanion.insert(
                actionId: actionId,
                classId: classId,
                actionType: actionType,
                actionDetail1: actionDetail1,
                actionDetail2: actionDetail2,
                actionDetail3: actionDetail3,
                actionValue1: actionValue1,
                actionValue2: actionValue2,
                actionValue3: actionValue3,
                actionValue4: actionValue4,
                actionValue5: actionValue5,
                actionValue6: actionValue6,
                actionValue7: actionValue7,
                targetAssignment: targetAssignment,
                targetArea: targetArea,
                targetRange: targetRange,
                targetType: targetType,
                targetNumber: targetNumber,
                targetCount: targetCount,
                description: description,
                levelUpDisp: levelUpDisp,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SkillActionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SkillActionTable,
      SkillActionData,
      $$SkillActionTableFilterComposer,
      $$SkillActionTableOrderingComposer,
      $$SkillActionTableAnnotationComposer,
      $$SkillActionTableCreateCompanionBuilder,
      $$SkillActionTableUpdateCompanionBuilder,
      (
        SkillActionData,
        BaseReferences<_$AppDb, $SkillActionTable, SkillActionData>,
      ),
      SkillActionData,
      PrefetchHooks Function()
    >;
typedef $$AilmentDataTableCreateCompanionBuilder =
    AilmentDataCompanion Function({
      Value<int> ailmentId,
      required int ailmentAction,
      required int ailmentDetail1,
      Value<String?> ailmentName,
    });
typedef $$AilmentDataTableUpdateCompanionBuilder =
    AilmentDataCompanion Function({
      Value<int> ailmentId,
      Value<int> ailmentAction,
      Value<int> ailmentDetail1,
      Value<String?> ailmentName,
    });

class $$AilmentDataTableFilterComposer
    extends Composer<_$AppDb, $AilmentDataTable> {
  $$AilmentDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ailmentId => $composableBuilder(
    column: $table.ailmentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ailmentAction => $composableBuilder(
    column: $table.ailmentAction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ailmentDetail1 => $composableBuilder(
    column: $table.ailmentDetail1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ailmentName => $composableBuilder(
    column: $table.ailmentName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AilmentDataTableOrderingComposer
    extends Composer<_$AppDb, $AilmentDataTable> {
  $$AilmentDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ailmentId => $composableBuilder(
    column: $table.ailmentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ailmentAction => $composableBuilder(
    column: $table.ailmentAction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ailmentDetail1 => $composableBuilder(
    column: $table.ailmentDetail1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ailmentName => $composableBuilder(
    column: $table.ailmentName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AilmentDataTableAnnotationComposer
    extends Composer<_$AppDb, $AilmentDataTable> {
  $$AilmentDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ailmentId =>
      $composableBuilder(column: $table.ailmentId, builder: (column) => column);

  GeneratedColumn<int> get ailmentAction => $composableBuilder(
    column: $table.ailmentAction,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ailmentDetail1 => $composableBuilder(
    column: $table.ailmentDetail1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ailmentName => $composableBuilder(
    column: $table.ailmentName,
    builder: (column) => column,
  );
}

class $$AilmentDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AilmentDataTable,
          AilmentDataData,
          $$AilmentDataTableFilterComposer,
          $$AilmentDataTableOrderingComposer,
          $$AilmentDataTableAnnotationComposer,
          $$AilmentDataTableCreateCompanionBuilder,
          $$AilmentDataTableUpdateCompanionBuilder,
          (
            AilmentDataData,
            BaseReferences<_$AppDb, $AilmentDataTable, AilmentDataData>,
          ),
          AilmentDataData,
          PrefetchHooks Function()
        > {
  $$AilmentDataTableTableManager(_$AppDb db, $AilmentDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AilmentDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AilmentDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$AilmentDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> ailmentId = const Value.absent(),
                Value<int> ailmentAction = const Value.absent(),
                Value<int> ailmentDetail1 = const Value.absent(),
                Value<String?> ailmentName = const Value.absent(),
              }) => AilmentDataCompanion(
                ailmentId: ailmentId,
                ailmentAction: ailmentAction,
                ailmentDetail1: ailmentDetail1,
                ailmentName: ailmentName,
              ),
          createCompanionCallback:
              ({
                Value<int> ailmentId = const Value.absent(),
                required int ailmentAction,
                required int ailmentDetail1,
                Value<String?> ailmentName = const Value.absent(),
              }) => AilmentDataCompanion.insert(
                ailmentId: ailmentId,
                ailmentAction: ailmentAction,
                ailmentDetail1: ailmentDetail1,
                ailmentName: ailmentName,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AilmentDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AilmentDataTable,
      AilmentDataData,
      $$AilmentDataTableFilterComposer,
      $$AilmentDataTableOrderingComposer,
      $$AilmentDataTableAnnotationComposer,
      $$AilmentDataTableCreateCompanionBuilder,
      $$AilmentDataTableUpdateCompanionBuilder,
      (
        AilmentDataData,
        BaseReferences<_$AppDb, $AilmentDataTable, AilmentDataData>,
      ),
      AilmentDataData,
      PrefetchHooks Function()
    >;
typedef $$UnitAttackPatternTableCreateCompanionBuilder =
    UnitAttackPatternCompanion Function({
      Value<int> patternId,
      required int unitId,
      Value<int?> loopStart,
      Value<int?> loopEnd,
      Value<int?> atkPattern1,
      Value<int?> atkPattern2,
      Value<int?> atkPattern3,
      Value<int?> atkPattern4,
      Value<int?> atkPattern5,
      Value<int?> atkPattern6,
      Value<int?> atkPattern7,
      Value<int?> atkPattern8,
      Value<int?> atkPattern9,
      Value<int?> atkPattern10,
      Value<int?> atkPattern11,
      Value<int?> atkPattern12,
      Value<int?> atkPattern13,
      Value<int?> atkPattern14,
      Value<int?> atkPattern15,
      Value<int?> atkPattern16,
      Value<int?> atkPattern17,
      Value<int?> atkPattern18,
      Value<int?> atkPattern19,
      Value<int?> atkPattern20,
    });
typedef $$UnitAttackPatternTableUpdateCompanionBuilder =
    UnitAttackPatternCompanion Function({
      Value<int> patternId,
      Value<int> unitId,
      Value<int?> loopStart,
      Value<int?> loopEnd,
      Value<int?> atkPattern1,
      Value<int?> atkPattern2,
      Value<int?> atkPattern3,
      Value<int?> atkPattern4,
      Value<int?> atkPattern5,
      Value<int?> atkPattern6,
      Value<int?> atkPattern7,
      Value<int?> atkPattern8,
      Value<int?> atkPattern9,
      Value<int?> atkPattern10,
      Value<int?> atkPattern11,
      Value<int?> atkPattern12,
      Value<int?> atkPattern13,
      Value<int?> atkPattern14,
      Value<int?> atkPattern15,
      Value<int?> atkPattern16,
      Value<int?> atkPattern17,
      Value<int?> atkPattern18,
      Value<int?> atkPattern19,
      Value<int?> atkPattern20,
    });

class $$UnitAttackPatternTableFilterComposer
    extends Composer<_$AppDb, $UnitAttackPatternTable> {
  $$UnitAttackPatternTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get patternId => $composableBuilder(
    column: $table.patternId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get loopStart => $composableBuilder(
    column: $table.loopStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get loopEnd => $composableBuilder(
    column: $table.loopEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern1 => $composableBuilder(
    column: $table.atkPattern1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern2 => $composableBuilder(
    column: $table.atkPattern2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern3 => $composableBuilder(
    column: $table.atkPattern3,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern4 => $composableBuilder(
    column: $table.atkPattern4,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern5 => $composableBuilder(
    column: $table.atkPattern5,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern6 => $composableBuilder(
    column: $table.atkPattern6,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern7 => $composableBuilder(
    column: $table.atkPattern7,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern8 => $composableBuilder(
    column: $table.atkPattern8,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern9 => $composableBuilder(
    column: $table.atkPattern9,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern10 => $composableBuilder(
    column: $table.atkPattern10,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern11 => $composableBuilder(
    column: $table.atkPattern11,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern12 => $composableBuilder(
    column: $table.atkPattern12,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern13 => $composableBuilder(
    column: $table.atkPattern13,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern14 => $composableBuilder(
    column: $table.atkPattern14,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern15 => $composableBuilder(
    column: $table.atkPattern15,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern16 => $composableBuilder(
    column: $table.atkPattern16,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern17 => $composableBuilder(
    column: $table.atkPattern17,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern18 => $composableBuilder(
    column: $table.atkPattern18,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern19 => $composableBuilder(
    column: $table.atkPattern19,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get atkPattern20 => $composableBuilder(
    column: $table.atkPattern20,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitAttackPatternTableOrderingComposer
    extends Composer<_$AppDb, $UnitAttackPatternTable> {
  $$UnitAttackPatternTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get patternId => $composableBuilder(
    column: $table.patternId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get loopStart => $composableBuilder(
    column: $table.loopStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get loopEnd => $composableBuilder(
    column: $table.loopEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern1 => $composableBuilder(
    column: $table.atkPattern1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern2 => $composableBuilder(
    column: $table.atkPattern2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern3 => $composableBuilder(
    column: $table.atkPattern3,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern4 => $composableBuilder(
    column: $table.atkPattern4,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern5 => $composableBuilder(
    column: $table.atkPattern5,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern6 => $composableBuilder(
    column: $table.atkPattern6,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern7 => $composableBuilder(
    column: $table.atkPattern7,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern8 => $composableBuilder(
    column: $table.atkPattern8,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern9 => $composableBuilder(
    column: $table.atkPattern9,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern10 => $composableBuilder(
    column: $table.atkPattern10,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern11 => $composableBuilder(
    column: $table.atkPattern11,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern12 => $composableBuilder(
    column: $table.atkPattern12,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern13 => $composableBuilder(
    column: $table.atkPattern13,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern14 => $composableBuilder(
    column: $table.atkPattern14,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern15 => $composableBuilder(
    column: $table.atkPattern15,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern16 => $composableBuilder(
    column: $table.atkPattern16,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern17 => $composableBuilder(
    column: $table.atkPattern17,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern18 => $composableBuilder(
    column: $table.atkPattern18,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern19 => $composableBuilder(
    column: $table.atkPattern19,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get atkPattern20 => $composableBuilder(
    column: $table.atkPattern20,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitAttackPatternTableAnnotationComposer
    extends Composer<_$AppDb, $UnitAttackPatternTable> {
  $$UnitAttackPatternTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get patternId =>
      $composableBuilder(column: $table.patternId, builder: (column) => column);

  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<int> get loopStart =>
      $composableBuilder(column: $table.loopStart, builder: (column) => column);

  GeneratedColumn<int> get loopEnd =>
      $composableBuilder(column: $table.loopEnd, builder: (column) => column);

  GeneratedColumn<int> get atkPattern1 => $composableBuilder(
    column: $table.atkPattern1,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern2 => $composableBuilder(
    column: $table.atkPattern2,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern3 => $composableBuilder(
    column: $table.atkPattern3,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern4 => $composableBuilder(
    column: $table.atkPattern4,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern5 => $composableBuilder(
    column: $table.atkPattern5,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern6 => $composableBuilder(
    column: $table.atkPattern6,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern7 => $composableBuilder(
    column: $table.atkPattern7,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern8 => $composableBuilder(
    column: $table.atkPattern8,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern9 => $composableBuilder(
    column: $table.atkPattern9,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern10 => $composableBuilder(
    column: $table.atkPattern10,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern11 => $composableBuilder(
    column: $table.atkPattern11,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern12 => $composableBuilder(
    column: $table.atkPattern12,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern13 => $composableBuilder(
    column: $table.atkPattern13,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern14 => $composableBuilder(
    column: $table.atkPattern14,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern15 => $composableBuilder(
    column: $table.atkPattern15,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern16 => $composableBuilder(
    column: $table.atkPattern16,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern17 => $composableBuilder(
    column: $table.atkPattern17,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern18 => $composableBuilder(
    column: $table.atkPattern18,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern19 => $composableBuilder(
    column: $table.atkPattern19,
    builder: (column) => column,
  );

  GeneratedColumn<int> get atkPattern20 => $composableBuilder(
    column: $table.atkPattern20,
    builder: (column) => column,
  );
}

class $$UnitAttackPatternTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UnitAttackPatternTable,
          UnitAttackPatternData,
          $$UnitAttackPatternTableFilterComposer,
          $$UnitAttackPatternTableOrderingComposer,
          $$UnitAttackPatternTableAnnotationComposer,
          $$UnitAttackPatternTableCreateCompanionBuilder,
          $$UnitAttackPatternTableUpdateCompanionBuilder,
          (
            UnitAttackPatternData,
            BaseReferences<
              _$AppDb,
              $UnitAttackPatternTable,
              UnitAttackPatternData
            >,
          ),
          UnitAttackPatternData,
          PrefetchHooks Function()
        > {
  $$UnitAttackPatternTableTableManager(
    _$AppDb db,
    $UnitAttackPatternTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UnitAttackPatternTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$UnitAttackPatternTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$UnitAttackPatternTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> patternId = const Value.absent(),
                Value<int> unitId = const Value.absent(),
                Value<int?> loopStart = const Value.absent(),
                Value<int?> loopEnd = const Value.absent(),
                Value<int?> atkPattern1 = const Value.absent(),
                Value<int?> atkPattern2 = const Value.absent(),
                Value<int?> atkPattern3 = const Value.absent(),
                Value<int?> atkPattern4 = const Value.absent(),
                Value<int?> atkPattern5 = const Value.absent(),
                Value<int?> atkPattern6 = const Value.absent(),
                Value<int?> atkPattern7 = const Value.absent(),
                Value<int?> atkPattern8 = const Value.absent(),
                Value<int?> atkPattern9 = const Value.absent(),
                Value<int?> atkPattern10 = const Value.absent(),
                Value<int?> atkPattern11 = const Value.absent(),
                Value<int?> atkPattern12 = const Value.absent(),
                Value<int?> atkPattern13 = const Value.absent(),
                Value<int?> atkPattern14 = const Value.absent(),
                Value<int?> atkPattern15 = const Value.absent(),
                Value<int?> atkPattern16 = const Value.absent(),
                Value<int?> atkPattern17 = const Value.absent(),
                Value<int?> atkPattern18 = const Value.absent(),
                Value<int?> atkPattern19 = const Value.absent(),
                Value<int?> atkPattern20 = const Value.absent(),
              }) => UnitAttackPatternCompanion(
                patternId: patternId,
                unitId: unitId,
                loopStart: loopStart,
                loopEnd: loopEnd,
                atkPattern1: atkPattern1,
                atkPattern2: atkPattern2,
                atkPattern3: atkPattern3,
                atkPattern4: atkPattern4,
                atkPattern5: atkPattern5,
                atkPattern6: atkPattern6,
                atkPattern7: atkPattern7,
                atkPattern8: atkPattern8,
                atkPattern9: atkPattern9,
                atkPattern10: atkPattern10,
                atkPattern11: atkPattern11,
                atkPattern12: atkPattern12,
                atkPattern13: atkPattern13,
                atkPattern14: atkPattern14,
                atkPattern15: atkPattern15,
                atkPattern16: atkPattern16,
                atkPattern17: atkPattern17,
                atkPattern18: atkPattern18,
                atkPattern19: atkPattern19,
                atkPattern20: atkPattern20,
              ),
          createCompanionCallback:
              ({
                Value<int> patternId = const Value.absent(),
                required int unitId,
                Value<int?> loopStart = const Value.absent(),
                Value<int?> loopEnd = const Value.absent(),
                Value<int?> atkPattern1 = const Value.absent(),
                Value<int?> atkPattern2 = const Value.absent(),
                Value<int?> atkPattern3 = const Value.absent(),
                Value<int?> atkPattern4 = const Value.absent(),
                Value<int?> atkPattern5 = const Value.absent(),
                Value<int?> atkPattern6 = const Value.absent(),
                Value<int?> atkPattern7 = const Value.absent(),
                Value<int?> atkPattern8 = const Value.absent(),
                Value<int?> atkPattern9 = const Value.absent(),
                Value<int?> atkPattern10 = const Value.absent(),
                Value<int?> atkPattern11 = const Value.absent(),
                Value<int?> atkPattern12 = const Value.absent(),
                Value<int?> atkPattern13 = const Value.absent(),
                Value<int?> atkPattern14 = const Value.absent(),
                Value<int?> atkPattern15 = const Value.absent(),
                Value<int?> atkPattern16 = const Value.absent(),
                Value<int?> atkPattern17 = const Value.absent(),
                Value<int?> atkPattern18 = const Value.absent(),
                Value<int?> atkPattern19 = const Value.absent(),
                Value<int?> atkPattern20 = const Value.absent(),
              }) => UnitAttackPatternCompanion.insert(
                patternId: patternId,
                unitId: unitId,
                loopStart: loopStart,
                loopEnd: loopEnd,
                atkPattern1: atkPattern1,
                atkPattern2: atkPattern2,
                atkPattern3: atkPattern3,
                atkPattern4: atkPattern4,
                atkPattern5: atkPattern5,
                atkPattern6: atkPattern6,
                atkPattern7: atkPattern7,
                atkPattern8: atkPattern8,
                atkPattern9: atkPattern9,
                atkPattern10: atkPattern10,
                atkPattern11: atkPattern11,
                atkPattern12: atkPattern12,
                atkPattern13: atkPattern13,
                atkPattern14: atkPattern14,
                atkPattern15: atkPattern15,
                atkPattern16: atkPattern16,
                atkPattern17: atkPattern17,
                atkPattern18: atkPattern18,
                atkPattern19: atkPattern19,
                atkPattern20: atkPattern20,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitAttackPatternTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UnitAttackPatternTable,
      UnitAttackPatternData,
      $$UnitAttackPatternTableFilterComposer,
      $$UnitAttackPatternTableOrderingComposer,
      $$UnitAttackPatternTableAnnotationComposer,
      $$UnitAttackPatternTableCreateCompanionBuilder,
      $$UnitAttackPatternTableUpdateCompanionBuilder,
      (
        UnitAttackPatternData,
        BaseReferences<_$AppDb, $UnitAttackPatternTable, UnitAttackPatternData>,
      ),
      UnitAttackPatternData,
      PrefetchHooks Function()
    >;
typedef $$SpSkillLabelDataTableCreateCompanionBuilder =
    SpSkillLabelDataCompanion Function({
      Value<int> unitId,
      Value<String?> normalLabelText,
      Value<String?> spLabelText,
    });
typedef $$SpSkillLabelDataTableUpdateCompanionBuilder =
    SpSkillLabelDataCompanion Function({
      Value<int> unitId,
      Value<String?> normalLabelText,
      Value<String?> spLabelText,
    });

class $$SpSkillLabelDataTableFilterComposer
    extends Composer<_$AppDb, $SpSkillLabelDataTable> {
  $$SpSkillLabelDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get normalLabelText => $composableBuilder(
    column: $table.normalLabelText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get spLabelText => $composableBuilder(
    column: $table.spLabelText,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SpSkillLabelDataTableOrderingComposer
    extends Composer<_$AppDb, $SpSkillLabelDataTable> {
  $$SpSkillLabelDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get unitId => $composableBuilder(
    column: $table.unitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get normalLabelText => $composableBuilder(
    column: $table.normalLabelText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get spLabelText => $composableBuilder(
    column: $table.spLabelText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpSkillLabelDataTableAnnotationComposer
    extends Composer<_$AppDb, $SpSkillLabelDataTable> {
  $$SpSkillLabelDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get unitId =>
      $composableBuilder(column: $table.unitId, builder: (column) => column);

  GeneratedColumn<String> get normalLabelText => $composableBuilder(
    column: $table.normalLabelText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get spLabelText => $composableBuilder(
    column: $table.spLabelText,
    builder: (column) => column,
  );
}

class $$SpSkillLabelDataTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $SpSkillLabelDataTable,
          SpSkillLabelDataData,
          $$SpSkillLabelDataTableFilterComposer,
          $$SpSkillLabelDataTableOrderingComposer,
          $$SpSkillLabelDataTableAnnotationComposer,
          $$SpSkillLabelDataTableCreateCompanionBuilder,
          $$SpSkillLabelDataTableUpdateCompanionBuilder,
          (
            SpSkillLabelDataData,
            BaseReferences<
              _$AppDb,
              $SpSkillLabelDataTable,
              SpSkillLabelDataData
            >,
          ),
          SpSkillLabelDataData,
          PrefetchHooks Function()
        > {
  $$SpSkillLabelDataTableTableManager(_$AppDb db, $SpSkillLabelDataTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$SpSkillLabelDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SpSkillLabelDataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$SpSkillLabelDataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String?> normalLabelText = const Value.absent(),
                Value<String?> spLabelText = const Value.absent(),
              }) => SpSkillLabelDataCompanion(
                unitId: unitId,
                normalLabelText: normalLabelText,
                spLabelText: spLabelText,
              ),
          createCompanionCallback:
              ({
                Value<int> unitId = const Value.absent(),
                Value<String?> normalLabelText = const Value.absent(),
                Value<String?> spLabelText = const Value.absent(),
              }) => SpSkillLabelDataCompanion.insert(
                unitId: unitId,
                normalLabelText: normalLabelText,
                spLabelText: spLabelText,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SpSkillLabelDataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $SpSkillLabelDataTable,
      SpSkillLabelDataData,
      $$SpSkillLabelDataTableFilterComposer,
      $$SpSkillLabelDataTableOrderingComposer,
      $$SpSkillLabelDataTableAnnotationComposer,
      $$SpSkillLabelDataTableCreateCompanionBuilder,
      $$SpSkillLabelDataTableUpdateCompanionBuilder,
      (
        SpSkillLabelDataData,
        BaseReferences<_$AppDb, $SpSkillLabelDataTable, SpSkillLabelDataData>,
      ),
      SpSkillLabelDataData,
      PrefetchHooks Function()
    >;
typedef $$UnitSkillDataRFTableCreateCompanionBuilder =
    UnitSkillDataRFCompanion Function({
      Value<int> id,
      required int skillId,
      required int rfSkillId,
      required int minLv,
      required int maxLv,
    });
typedef $$UnitSkillDataRFTableUpdateCompanionBuilder =
    UnitSkillDataRFCompanion Function({
      Value<int> id,
      Value<int> skillId,
      Value<int> rfSkillId,
      Value<int> minLv,
      Value<int> maxLv,
    });

class $$UnitSkillDataRFTableFilterComposer
    extends Composer<_$AppDb, $UnitSkillDataRFTable> {
  $$UnitSkillDataRFTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rfSkillId => $composableBuilder(
    column: $table.rfSkillId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minLv => $composableBuilder(
    column: $table.minLv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxLv => $composableBuilder(
    column: $table.maxLv,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitSkillDataRFTableOrderingComposer
    extends Composer<_$AppDb, $UnitSkillDataRFTable> {
  $$UnitSkillDataRFTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rfSkillId => $composableBuilder(
    column: $table.rfSkillId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minLv => $composableBuilder(
    column: $table.minLv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxLv => $composableBuilder(
    column: $table.maxLv,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitSkillDataRFTableAnnotationComposer
    extends Composer<_$AppDb, $UnitSkillDataRFTable> {
  $$UnitSkillDataRFTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get skillId =>
      $composableBuilder(column: $table.skillId, builder: (column) => column);

  GeneratedColumn<int> get rfSkillId =>
      $composableBuilder(column: $table.rfSkillId, builder: (column) => column);

  GeneratedColumn<int> get minLv =>
      $composableBuilder(column: $table.minLv, builder: (column) => column);

  GeneratedColumn<int> get maxLv =>
      $composableBuilder(column: $table.maxLv, builder: (column) => column);
}

class $$UnitSkillDataRFTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UnitSkillDataRFTable,
          UnitSkillDataRFData,
          $$UnitSkillDataRFTableFilterComposer,
          $$UnitSkillDataRFTableOrderingComposer,
          $$UnitSkillDataRFTableAnnotationComposer,
          $$UnitSkillDataRFTableCreateCompanionBuilder,
          $$UnitSkillDataRFTableUpdateCompanionBuilder,
          (
            UnitSkillDataRFData,
            BaseReferences<_$AppDb, $UnitSkillDataRFTable, UnitSkillDataRFData>,
          ),
          UnitSkillDataRFData,
          PrefetchHooks Function()
        > {
  $$UnitSkillDataRFTableTableManager(_$AppDb db, $UnitSkillDataRFTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$UnitSkillDataRFTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UnitSkillDataRFTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$UnitSkillDataRFTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> skillId = const Value.absent(),
                Value<int> rfSkillId = const Value.absent(),
                Value<int> minLv = const Value.absent(),
                Value<int> maxLv = const Value.absent(),
              }) => UnitSkillDataRFCompanion(
                id: id,
                skillId: skillId,
                rfSkillId: rfSkillId,
                minLv: minLv,
                maxLv: maxLv,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int skillId,
                required int rfSkillId,
                required int minLv,
                required int maxLv,
              }) => UnitSkillDataRFCompanion.insert(
                id: id,
                skillId: skillId,
                rfSkillId: rfSkillId,
                minLv: minLv,
                maxLv: maxLv,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitSkillDataRFTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UnitSkillDataRFTable,
      UnitSkillDataRFData,
      $$UnitSkillDataRFTableFilterComposer,
      $$UnitSkillDataRFTableOrderingComposer,
      $$UnitSkillDataRFTableAnnotationComposer,
      $$UnitSkillDataRFTableCreateCompanionBuilder,
      $$UnitSkillDataRFTableUpdateCompanionBuilder,
      (
        UnitSkillDataRFData,
        BaseReferences<_$AppDb, $UnitSkillDataRFTable, UnitSkillDataRFData>,
      ),
      UnitSkillDataRFData,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$UnitProfileTableTableManager get unitProfile =>
      $$UnitProfileTableTableManager(_db, _db.unitProfile);
  $$RedeemUnitTableTableManager get redeemUnit =>
      $$RedeemUnitTableTableManager(_db, _db.redeemUnit);
  $$UnitDataTableTableManager get unitData =>
      $$UnitDataTableTableManager(_db, _db.unitData);
  $$UniqueEquipmentEnhanceDataTableTableManager
  get uniqueEquipmentEnhanceData =>
      $$UniqueEquipmentEnhanceDataTableTableManager(
        _db,
        _db.uniqueEquipmentEnhanceData,
      );
  $$ActualUnitBackgroundTableTableManager get actualUnitBackground =>
      $$ActualUnitBackgroundTableTableManager(_db, _db.actualUnitBackground);
  $$Rarity6QuestDataTableTableManager get rarity6QuestData =>
      $$Rarity6QuestDataTableTableManager(_db, _db.rarity6QuestData);
  $$SkillDataTableTableManager get skillData =>
      $$SkillDataTableTableManager(_db, _db.skillData);
  $$UnitSkillDataTableTableManager get unitSkillData =>
      $$UnitSkillDataTableTableManager(_db, _db.unitSkillData);
  $$SkillActionTableTableManager get skillAction =>
      $$SkillActionTableTableManager(_db, _db.skillAction);
  $$AilmentDataTableTableManager get ailmentData =>
      $$AilmentDataTableTableManager(_db, _db.ailmentData);
  $$UnitAttackPatternTableTableManager get unitAttackPattern =>
      $$UnitAttackPatternTableTableManager(_db, _db.unitAttackPattern);
  $$SpSkillLabelDataTableTableManager get spSkillLabelData =>
      $$SpSkillLabelDataTableTableManager(_db, _db.spSkillLabelData);
  $$UnitSkillDataRFTableTableManager get unitSkillDataRF =>
      $$UnitSkillDataRFTableTableManager(_db, _db.unitSkillDataRF);
}
