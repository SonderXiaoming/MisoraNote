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
}
