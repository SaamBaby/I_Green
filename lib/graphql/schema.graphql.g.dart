// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateActivity$MutationRoot$InsertActivitiesOne
    _$CreateActivity$MutationRoot$InsertActivitiesOneFromJson(
        Map<String, dynamic> json) {
  return CreateActivity$MutationRoot$InsertActivitiesOne()
    ..activityId = json['activity_id'] as String;
}

Map<String, dynamic> _$CreateActivity$MutationRoot$InsertActivitiesOneToJson(
        CreateActivity$MutationRoot$InsertActivitiesOne instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
    };

CreateActivity$MutationRoot _$CreateActivity$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateActivity$MutationRoot()
    ..insertActivitiesOne = json['insert_activities_one'] == null
        ? null
        : CreateActivity$MutationRoot$InsertActivitiesOne.fromJson(
            json['insert_activities_one'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateActivity$MutationRootToJson(
        CreateActivity$MutationRoot instance) =>
    <String, dynamic>{
      'insert_activities_one': instance.insertActivitiesOne?.toJson(),
    };

UpdateActivity$MutationRoot$UpdateActivities$Returning
    _$UpdateActivity$MutationRoot$UpdateActivities$ReturningFromJson(
        Map<String, dynamic> json) {
  return UpdateActivity$MutationRoot$UpdateActivities$Returning()
    ..shiftEndtime = json['shift_endtime'] as String
    ..shiftStarttime = json['shift_starttime'] as String;
}

Map<String, dynamic>
    _$UpdateActivity$MutationRoot$UpdateActivities$ReturningToJson(
            UpdateActivity$MutationRoot$UpdateActivities$Returning instance) =>
        <String, dynamic>{
          'shift_endtime': instance.shiftEndtime,
          'shift_starttime': instance.shiftStarttime,
        };

UpdateActivity$MutationRoot$UpdateActivities
    _$UpdateActivity$MutationRoot$UpdateActivitiesFromJson(
        Map<String, dynamic> json) {
  return UpdateActivity$MutationRoot$UpdateActivities()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateActivity$MutationRoot$UpdateActivities$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UpdateActivity$MutationRoot$UpdateActivitiesToJson(
        UpdateActivity$MutationRoot$UpdateActivities instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

UpdateActivity$MutationRoot _$UpdateActivity$MutationRootFromJson(
    Map<String, dynamic> json) {
  return UpdateActivity$MutationRoot()
    ..updateActivities = json['update_activities'] == null
        ? null
        : UpdateActivity$MutationRoot$UpdateActivities.fromJson(
            json['update_activities'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateActivity$MutationRootToJson(
        UpdateActivity$MutationRoot instance) =>
    <String, dynamic>{
      'update_activities': instance.updateActivities?.toJson(),
    };

CreateClosedShift$MutationRoot$InsertClosedShifts$Returning
    _$CreateClosedShift$MutationRoot$InsertClosedShifts$ReturningFromJson(
        Map<String, dynamic> json) {
  return CreateClosedShift$MutationRoot$InsertClosedShifts$Returning()
    ..closedShiftsId = json['closed_shifts_id'] as int;
}

Map<String, dynamic>
    _$CreateClosedShift$MutationRoot$InsertClosedShifts$ReturningToJson(
            CreateClosedShift$MutationRoot$InsertClosedShifts$Returning
                instance) =>
        <String, dynamic>{
          'closed_shifts_id': instance.closedShiftsId,
        };

CreateClosedShift$MutationRoot$InsertClosedShifts
    _$CreateClosedShift$MutationRoot$InsertClosedShiftsFromJson(
        Map<String, dynamic> json) {
  return CreateClosedShift$MutationRoot$InsertClosedShifts()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : CreateClosedShift$MutationRoot$InsertClosedShifts$Returning
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreateClosedShift$MutationRoot$InsertClosedShiftsToJson(
        CreateClosedShift$MutationRoot$InsertClosedShifts instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

CreateClosedShift$MutationRoot _$CreateClosedShift$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateClosedShift$MutationRoot()
    ..insertClosedShifts = json['insert_closed_shifts'] == null
        ? null
        : CreateClosedShift$MutationRoot$InsertClosedShifts.fromJson(
            json['insert_closed_shifts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateClosedShift$MutationRootToJson(
        CreateClosedShift$MutationRoot instance) =>
    <String, dynamic>{
      'insert_closed_shifts': instance.insertClosedShifts?.toJson(),
    };

ActivitiesArrRelInsertInput _$ActivitiesArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return ActivitiesArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitiesInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onConflict: json['on_conflict'] == null
        ? null
        : ActivitiesOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesArrRelInsertInputToJson(
        ActivitiesArrRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'on_conflict': instance.onConflict?.toJson(),
    };

ActivitiesBoolExp _$ActivitiesBoolExpFromJson(Map<String, dynamic> json) {
  return ActivitiesBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitiesBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : ActivitiesBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitiesBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    activityId: json['activity_id'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['activity_id'] as Map<String, dynamic>),
    isAccepted: json['is_accepted'] == null
        ? null
        : BooleanComparisonExp.fromJson(
            json['is_accepted'] as Map<String, dynamic>),
    isCompleted: json['is_completed'] == null
        ? null
        : BooleanComparisonExp.fromJson(
            json['is_completed'] as Map<String, dynamic>),
    shift: json['shift'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['shift'] as Map<String, dynamic>),
    shiftEndtime: json['shift_endtime'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['shift_endtime'] as Map<String, dynamic>),
    shiftId: json['shift_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['shift_id'] as Map<String, dynamic>),
    shiftStarttime: json['shift_starttime'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['shift_starttime'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UsersBoolExp.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] == null
        ? null
        : StringComparisonExp.fromJson(json['user_id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesBoolExpToJson(ActivitiesBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'activity_id': instance.activityId?.toJson(),
      'is_accepted': instance.isAccepted?.toJson(),
      'is_completed': instance.isCompleted?.toJson(),
      'shift': instance.shift?.toJson(),
      'shift_endtime': instance.shiftEndtime?.toJson(),
      'shift_id': instance.shiftId?.toJson(),
      'shift_starttime': instance.shiftStarttime?.toJson(),
      'user': instance.user?.toJson(),
      'user_id': instance.userId?.toJson(),
    };

ActivitiesInsertInput _$ActivitiesInsertInputFromJson(
    Map<String, dynamic> json) {
  return ActivitiesInsertInput(
    activityId: json['activity_id'] as String,
    isAccepted: json['is_accepted'] as bool,
    isCompleted: json['is_completed'] as bool,
    shift: json['shift'] == null
        ? null
        : ShiftsObjRelInsertInput.fromJson(
            json['shift'] as Map<String, dynamic>),
    shiftEndtime: json['shift_endtime'] as String,
    shiftId: json['shift_id'] as int,
    shiftStarttime: json['shift_starttime'] as String,
    user: json['user'] == null
        ? null
        : UsersObjRelInsertInput.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$ActivitiesInsertInputToJson(
        ActivitiesInsertInput instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'is_accepted': instance.isAccepted,
      'is_completed': instance.isCompleted,
      'shift': instance.shift?.toJson(),
      'shift_endtime': instance.shiftEndtime,
      'shift_id': instance.shiftId,
      'shift_starttime': instance.shiftStarttime,
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };

ActivitiesOnConflict _$ActivitiesOnConflictFromJson(Map<String, dynamic> json) {
  return ActivitiesOnConflict(
    constraint: _$enumDecodeNullable(
        _$ActivitiesConstraintEnumMap, json['constraint'],
        unknownValue: ActivitiesConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ActivitiesUpdateColumnEnumMap, e,
            unknownValue: ActivitiesUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : ActivitiesBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitiesOnConflictToJson(
        ActivitiesOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$ActivitiesConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$ActivitiesUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ActivitiesConstraintEnumMap = {
  ActivitiesConstraint.activitiesActivityIdKey: 'activities_activity_id_key',
  ActivitiesConstraint.activitiesPkey: 'activities_pkey',
  ActivitiesConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$ActivitiesUpdateColumnEnumMap = {
  ActivitiesUpdateColumn.activityId: 'activity_id',
  ActivitiesUpdateColumn.isAccepted: 'is_accepted',
  ActivitiesUpdateColumn.isCompleted: 'is_completed',
  ActivitiesUpdateColumn.shiftEndtime: 'shift_endtime',
  ActivitiesUpdateColumn.shiftId: 'shift_id',
  ActivitiesUpdateColumn.shiftStarttime: 'shift_starttime',
  ActivitiesUpdateColumn.userId: 'user_id',
  ActivitiesUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

BooleanComparisonExp _$BooleanComparisonExpFromJson(Map<String, dynamic> json) {
  return BooleanComparisonExp(
    $eq: json['_eq'] as bool,
    $gt: json['_gt'] as bool,
    $gte: json['_gte'] as bool,
    $in: (json['_in'] as List)?.map((e) => e as bool)?.toList(),
    $isNull: json['_is_null'] as bool,
    $lt: json['_lt'] as bool,
    $lte: json['_lte'] as bool,
    $neq: json['_neq'] as bool,
    $nin: (json['_nin'] as List)?.map((e) => e as bool)?.toList(),
  );
}

Map<String, dynamic> _$BooleanComparisonExpToJson(
        BooleanComparisonExp instance) =>
    <String, dynamic>{
      '_eq': instance.$eq,
      '_gt': instance.$gt,
      '_gte': instance.$gte,
      '_in': instance.$in,
      '_is_null': instance.$isNull,
      '_lt': instance.$lt,
      '_lte': instance.$lte,
      '_neq': instance.$neq,
      '_nin': instance.$nin,
    };

ClosedShiftsArrRelInsertInput _$ClosedShiftsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return ClosedShiftsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ClosedShiftsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onConflict: json['on_conflict'] == null
        ? null
        : ClosedShiftsOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClosedShiftsArrRelInsertInputToJson(
        ClosedShiftsArrRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'on_conflict': instance.onConflict?.toJson(),
    };

ClosedShiftsBoolExp _$ClosedShiftsBoolExpFromJson(Map<String, dynamic> json) {
  return ClosedShiftsBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) => e == null
            ? null
            : ClosedShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : ClosedShiftsBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) => e == null
            ? null
            : ClosedShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    closedShiftsId: json['closed_shifts_id'] == null
        ? null
        : IntComparisonExp.fromJson(
            json['closed_shifts_id'] as Map<String, dynamic>),
    shift: json['shift'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['shift'] as Map<String, dynamic>),
    shiftId: json['shift_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['shift_id'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UsersBoolExp.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] == null
        ? null
        : StringComparisonExp.fromJson(json['user_id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClosedShiftsBoolExpToJson(
        ClosedShiftsBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'closed_shifts_id': instance.closedShiftsId?.toJson(),
      'shift': instance.shift?.toJson(),
      'shift_id': instance.shiftId?.toJson(),
      'user': instance.user?.toJson(),
      'user_id': instance.userId?.toJson(),
    };

ClosedShiftsInsertInput _$ClosedShiftsInsertInputFromJson(
    Map<String, dynamic> json) {
  return ClosedShiftsInsertInput(
    closedShiftsId: json['closed_shifts_id'] as int,
    shift: json['shift'] == null
        ? null
        : ShiftsObjRelInsertInput.fromJson(
            json['shift'] as Map<String, dynamic>),
    shiftId: json['shift_id'] as int,
    user: json['user'] == null
        ? null
        : UsersObjRelInsertInput.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$ClosedShiftsInsertInputToJson(
        ClosedShiftsInsertInput instance) =>
    <String, dynamic>{
      'closed_shifts_id': instance.closedShiftsId,
      'shift': instance.shift?.toJson(),
      'shift_id': instance.shiftId,
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };

ClosedShiftsOnConflict _$ClosedShiftsOnConflictFromJson(
    Map<String, dynamic> json) {
  return ClosedShiftsOnConflict(
    constraint: _$enumDecodeNullable(
        _$ClosedShiftsConstraintEnumMap, json['constraint'],
        unknownValue: ClosedShiftsConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ClosedShiftsUpdateColumnEnumMap, e,
            unknownValue: ClosedShiftsUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : ClosedShiftsBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ClosedShiftsOnConflictToJson(
        ClosedShiftsOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$ClosedShiftsConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$ClosedShiftsUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$ClosedShiftsConstraintEnumMap = {
  ClosedShiftsConstraint.closedShiftsClosedShiftsIdKey:
      'closed_shifts_closed_shifts_id_key',
  ClosedShiftsConstraint.closedShiftsPkey: 'closed_shifts_pkey',
  ClosedShiftsConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$ClosedShiftsUpdateColumnEnumMap = {
  ClosedShiftsUpdateColumn.closedShiftsId: 'closed_shifts_id',
  ClosedShiftsUpdateColumn.shiftId: 'shift_id',
  ClosedShiftsUpdateColumn.userId: 'user_id',
  ClosedShiftsUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

DateComparisonExp _$DateComparisonExpFromJson(Map<String, dynamic> json) {
  return DateComparisonExp(
    $eq: json['_eq'] == null ? null : DateTime.parse(json['_eq'] as String),
    $gt: json['_gt'] == null ? null : DateTime.parse(json['_gt'] as String),
    $gte: json['_gte'] == null ? null : DateTime.parse(json['_gte'] as String),
    $in: (json['_in'] as List)
        ?.map((e) => e == null ? null : DateTime.parse(e as String))
        ?.toList(),
    $isNull: json['_is_null'] as bool,
    $lt: json['_lt'] == null ? null : DateTime.parse(json['_lt'] as String),
    $lte: json['_lte'] == null ? null : DateTime.parse(json['_lte'] as String),
    $neq: json['_neq'] == null ? null : DateTime.parse(json['_neq'] as String),
    $nin: (json['_nin'] as List)
        ?.map((e) => e == null ? null : DateTime.parse(e as String))
        ?.toList(),
  );
}

Map<String, dynamic> _$DateComparisonExpToJson(DateComparisonExp instance) =>
    <String, dynamic>{
      '_eq': instance.$eq?.toIso8601String(),
      '_gt': instance.$gt?.toIso8601String(),
      '_gte': instance.$gte?.toIso8601String(),
      '_in': instance.$in?.map((e) => e?.toIso8601String())?.toList(),
      '_is_null': instance.$isNull,
      '_lt': instance.$lt?.toIso8601String(),
      '_lte': instance.$lte?.toIso8601String(),
      '_neq': instance.$neq?.toIso8601String(),
      '_nin': instance.$nin?.map((e) => e?.toIso8601String())?.toList(),
    };

DocumentsArrRelInsertInput _$DocumentsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return DocumentsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onConflict: json['on_conflict'] == null
        ? null
        : DocumentsOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentsArrRelInsertInputToJson(
        DocumentsArrRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'on_conflict': instance.onConflict?.toJson(),
    };

DocumentsBoolExp _$DocumentsBoolExpFromJson(Map<String, dynamic> json) {
  return DocumentsBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : DocumentsBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    documentId: json['document_id'] == null
        ? null
        : IntComparisonExp.fromJson(
            json['document_id'] as Map<String, dynamic>),
    documentName: json['document_name'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['document_name'] as Map<String, dynamic>),
    documentUrl: json['document_url'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['document_url'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : UsersBoolExp.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] == null
        ? null
        : StringComparisonExp.fromJson(json['user_id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentsBoolExpToJson(DocumentsBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'document_id': instance.documentId?.toJson(),
      'document_name': instance.documentName?.toJson(),
      'document_url': instance.documentUrl?.toJson(),
      'user': instance.user?.toJson(),
      'user_id': instance.userId?.toJson(),
    };

DocumentsInsertInput _$DocumentsInsertInputFromJson(Map<String, dynamic> json) {
  return DocumentsInsertInput(
    documentId: json['document_id'] as int,
    documentName: json['document_name'] as String,
    documentUrl: json['document_url'] as String,
    user: json['user'] == null
        ? null
        : UsersObjRelInsertInput.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$DocumentsInsertInputToJson(
        DocumentsInsertInput instance) =>
    <String, dynamic>{
      'document_id': instance.documentId,
      'document_name': instance.documentName,
      'document_url': instance.documentUrl,
      'user': instance.user?.toJson(),
      'user_id': instance.userId,
    };

DocumentsOnConflict _$DocumentsOnConflictFromJson(Map<String, dynamic> json) {
  return DocumentsOnConflict(
    constraint: _$enumDecodeNullable(
        _$DocumentsConstraintEnumMap, json['constraint'],
        unknownValue: DocumentsConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$DocumentsUpdateColumnEnumMap, e,
            unknownValue: DocumentsUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : DocumentsBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DocumentsOnConflictToJson(
        DocumentsOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$DocumentsConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$DocumentsUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$DocumentsConstraintEnumMap = {
  DocumentsConstraint.documentsDocumentIdKey: 'documents_document_id_key',
  DocumentsConstraint.documentsPkey: 'documents_pkey',
  DocumentsConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$DocumentsUpdateColumnEnumMap = {
  DocumentsUpdateColumn.documentId: 'document_id',
  DocumentsUpdateColumn.documentName: 'document_name',
  DocumentsUpdateColumn.documentUrl: 'document_url',
  DocumentsUpdateColumn.userId: 'user_id',
  DocumentsUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

IntComparisonExp _$IntComparisonExpFromJson(Map<String, dynamic> json) {
  return IntComparisonExp(
    $eq: json['_eq'] as int,
    $gt: json['_gt'] as int,
    $gte: json['_gte'] as int,
    $in: (json['_in'] as List)?.map((e) => e as int)?.toList(),
    $isNull: json['_is_null'] as bool,
    $lt: json['_lt'] as int,
    $lte: json['_lte'] as int,
    $neq: json['_neq'] as int,
    $nin: (json['_nin'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$IntComparisonExpToJson(IntComparisonExp instance) =>
    <String, dynamic>{
      '_eq': instance.$eq,
      '_gt': instance.$gt,
      '_gte': instance.$gte,
      '_in': instance.$in,
      '_is_null': instance.$isNull,
      '_lt': instance.$lt,
      '_lte': instance.$lte,
      '_neq': instance.$neq,
      '_nin': instance.$nin,
    };

JobsBoolExp _$JobsBoolExpFromJson(Map<String, dynamic> json) {
  return JobsBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) =>
            e == null ? null : JobsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : JobsBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) =>
            e == null ? null : JobsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isContract: json['is_contract'] == null
        ? null
        : BooleanComparisonExp.fromJson(
            json['is_contract'] as Map<String, dynamic>),
    isFulltime: json['is_fulltime'] == null
        ? null
        : BooleanComparisonExp.fromJson(
            json['is_fulltime'] as Map<String, dynamic>),
    isParttime: json['is_parttime'] == null
        ? null
        : BooleanComparisonExp.fromJson(
            json['is_parttime'] as Map<String, dynamic>),
    jobDescription: json['job_description'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_description'] as Map<String, dynamic>),
    jobId: json['job_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['job_id'] as Map<String, dynamic>),
    jobLocation: json['job_location'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_location'] as Map<String, dynamic>),
    jobLogo: json['job_logo'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_logo'] as Map<String, dynamic>),
    jobName: json['job_name'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_name'] as Map<String, dynamic>),
    jobQualifications: json['job_qualifications'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_qualifications'] as Map<String, dynamic>),
    jobResponsibilities: json['job_responsibilities'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_responsibilities'] as Map<String, dynamic>),
    jobSalary: json['job_salary'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['job_salary'] as Map<String, dynamic>),
    shifts: json['shifts'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['shifts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobsBoolExpToJson(JobsBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'is_contract': instance.isContract?.toJson(),
      'is_fulltime': instance.isFulltime?.toJson(),
      'is_parttime': instance.isParttime?.toJson(),
      'job_description': instance.jobDescription?.toJson(),
      'job_id': instance.jobId?.toJson(),
      'job_location': instance.jobLocation?.toJson(),
      'job_logo': instance.jobLogo?.toJson(),
      'job_name': instance.jobName?.toJson(),
      'job_qualifications': instance.jobQualifications?.toJson(),
      'job_responsibilities': instance.jobResponsibilities?.toJson(),
      'job_salary': instance.jobSalary?.toJson(),
      'shifts': instance.shifts?.toJson(),
    };

JobsInsertInput _$JobsInsertInputFromJson(Map<String, dynamic> json) {
  return JobsInsertInput(
    isContract: json['is_contract'] as bool,
    isFulltime: json['is_fulltime'] as bool,
    isParttime: json['is_parttime'] as bool,
    jobDescription: json['job_description'] as String,
    jobId: json['job_id'] as int,
    jobLocation: json['job_location'] as String,
    jobLogo: json['job_logo'] as String,
    jobName: json['job_name'] as String,
    jobQualifications: json['job_qualifications'] as String,
    jobResponsibilities: json['job_responsibilities'] as String,
    jobSalary: json['job_salary'] as String,
    shifts: json['shifts'] == null
        ? null
        : ShiftsArrRelInsertInput.fromJson(
            json['shifts'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobsInsertInputToJson(JobsInsertInput instance) =>
    <String, dynamic>{
      'is_contract': instance.isContract,
      'is_fulltime': instance.isFulltime,
      'is_parttime': instance.isParttime,
      'job_description': instance.jobDescription,
      'job_id': instance.jobId,
      'job_location': instance.jobLocation,
      'job_logo': instance.jobLogo,
      'job_name': instance.jobName,
      'job_qualifications': instance.jobQualifications,
      'job_responsibilities': instance.jobResponsibilities,
      'job_salary': instance.jobSalary,
      'shifts': instance.shifts?.toJson(),
    };

JobsObjRelInsertInput _$JobsObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return JobsObjRelInsertInput(
    data: json['data'] == null
        ? null
        : JobsInsertInput.fromJson(json['data'] as Map<String, dynamic>),
    onConflict: json['on_conflict'] == null
        ? null
        : JobsOnConflict.fromJson(json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobsObjRelInsertInputToJson(
        JobsObjRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'on_conflict': instance.onConflict?.toJson(),
    };

JobsOnConflict _$JobsOnConflictFromJson(Map<String, dynamic> json) {
  return JobsOnConflict(
    constraint: _$enumDecodeNullable(
        _$JobsConstraintEnumMap, json['constraint'],
        unknownValue: JobsConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$JobsUpdateColumnEnumMap, e,
            unknownValue: JobsUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : JobsBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$JobsOnConflictToJson(JobsOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$JobsConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$JobsUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$JobsConstraintEnumMap = {
  JobsConstraint.jobsPkey: 'jobs_pkey',
  JobsConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$JobsUpdateColumnEnumMap = {
  JobsUpdateColumn.isContract: 'is_contract',
  JobsUpdateColumn.isFulltime: 'is_fulltime',
  JobsUpdateColumn.isParttime: 'is_parttime',
  JobsUpdateColumn.jobDescription: 'job_description',
  JobsUpdateColumn.jobId: 'job_id',
  JobsUpdateColumn.jobLocation: 'job_location',
  JobsUpdateColumn.jobLogo: 'job_logo',
  JobsUpdateColumn.jobName: 'job_name',
  JobsUpdateColumn.jobQualifications: 'job_qualifications',
  JobsUpdateColumn.jobResponsibilities: 'job_responsibilities',
  JobsUpdateColumn.jobSalary: 'job_salary',
  JobsUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

OpenShiftsArrRelInsertInput _$OpenShiftsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return OpenShiftsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : OpenShiftsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onConflict: json['on_conflict'] == null
        ? null
        : OpenShiftsOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpenShiftsArrRelInsertInputToJson(
        OpenShiftsArrRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'on_conflict': instance.onConflict?.toJson(),
    };

OpenShiftsBoolExp _$OpenShiftsBoolExpFromJson(Map<String, dynamic> json) {
  return OpenShiftsBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) => e == null
            ? null
            : OpenShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : OpenShiftsBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) => e == null
            ? null
            : OpenShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    openShiftsId: json['open_shifts_id'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['open_shifts_id'] as Map<String, dynamic>),
    shift: json['shift'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['shift'] as Map<String, dynamic>),
    shiftId: json['shift_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['shift_id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpenShiftsBoolExpToJson(OpenShiftsBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'open_shifts_id': instance.openShiftsId?.toJson(),
      'shift': instance.shift?.toJson(),
      'shift_id': instance.shiftId?.toJson(),
    };

OpenShiftsInsertInput _$OpenShiftsInsertInputFromJson(
    Map<String, dynamic> json) {
  return OpenShiftsInsertInput(
    openShiftsId: json['open_shifts_id'] as String,
    shift: json['shift'] == null
        ? null
        : ShiftsObjRelInsertInput.fromJson(
            json['shift'] as Map<String, dynamic>),
    shiftId: json['shift_id'] as int,
  );
}

Map<String, dynamic> _$OpenShiftsInsertInputToJson(
        OpenShiftsInsertInput instance) =>
    <String, dynamic>{
      'open_shifts_id': instance.openShiftsId,
      'shift': instance.shift?.toJson(),
      'shift_id': instance.shiftId,
    };

OpenShiftsOnConflict _$OpenShiftsOnConflictFromJson(Map<String, dynamic> json) {
  return OpenShiftsOnConflict(
    constraint: _$enumDecodeNullable(
        _$OpenShiftsConstraintEnumMap, json['constraint'],
        unknownValue: OpenShiftsConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$OpenShiftsUpdateColumnEnumMap, e,
            unknownValue: OpenShiftsUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : OpenShiftsBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpenShiftsOnConflictToJson(
        OpenShiftsOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$OpenShiftsConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$OpenShiftsUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$OpenShiftsConstraintEnumMap = {
  OpenShiftsConstraint.openShiftsOpenShiftsIdKey:
      'open_shifts_open_shifts_id_key',
  OpenShiftsConstraint.openShiftsPkey: 'open_shifts_pkey',
  OpenShiftsConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$OpenShiftsUpdateColumnEnumMap = {
  OpenShiftsUpdateColumn.openShiftsId: 'open_shifts_id',
  OpenShiftsUpdateColumn.shiftId: 'shift_id',
  OpenShiftsUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

ShiftsArrRelInsertInput _$ShiftsArrRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return ShiftsArrRelInsertInput(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ShiftsInsertInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    onConflict: json['on_conflict'] == null
        ? null
        : ShiftsOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShiftsArrRelInsertInputToJson(
        ShiftsArrRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
      'on_conflict': instance.onConflict?.toJson(),
    };

ShiftsBoolExp _$ShiftsBoolExpFromJson(Map<String, dynamic> json) {
  return ShiftsBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) => e == null
            ? null
            : ShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) => e == null
            ? null
            : ShiftsBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    activities: json['activities'] == null
        ? null
        : ActivitiesBoolExp.fromJson(
            json['activities'] as Map<String, dynamic>),
    closedShifts: json['closed_shifts'] == null
        ? null
        : ClosedShiftsBoolExp.fromJson(
            json['closed_shifts'] as Map<String, dynamic>),
    job: json['job'] == null
        ? null
        : JobsBoolExp.fromJson(json['job'] as Map<String, dynamic>),
    jobId: json['job_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['job_id'] as Map<String, dynamic>),
    openShifts: json['open_shifts'] == null
        ? null
        : OpenShiftsBoolExp.fromJson(
            json['open_shifts'] as Map<String, dynamic>),
    shiftDate: json['shift_date'] == null
        ? null
        : DateComparisonExp.fromJson(
            json['shift_date'] as Map<String, dynamic>),
    shiftId: json['shift_id'] == null
        ? null
        : IntComparisonExp.fromJson(json['shift_id'] as Map<String, dynamic>),
    shiftName: json['shift_name'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['shift_name'] as Map<String, dynamic>),
    shiftNotes: json['shift_notes'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['shift_notes'] as Map<String, dynamic>),
    shiftTime: json['shift_time'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['shift_time'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShiftsBoolExpToJson(ShiftsBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'activities': instance.activities?.toJson(),
      'closed_shifts': instance.closedShifts?.toJson(),
      'job': instance.job?.toJson(),
      'job_id': instance.jobId?.toJson(),
      'open_shifts': instance.openShifts?.toJson(),
      'shift_date': instance.shiftDate?.toJson(),
      'shift_id': instance.shiftId?.toJson(),
      'shift_name': instance.shiftName?.toJson(),
      'shift_notes': instance.shiftNotes?.toJson(),
      'shift_time': instance.shiftTime?.toJson(),
    };

ShiftsInsertInput _$ShiftsInsertInputFromJson(Map<String, dynamic> json) {
  return ShiftsInsertInput(
    activities: json['activities'] == null
        ? null
        : ActivitiesArrRelInsertInput.fromJson(
            json['activities'] as Map<String, dynamic>),
    closedShifts: json['closed_shifts'] == null
        ? null
        : ClosedShiftsArrRelInsertInput.fromJson(
            json['closed_shifts'] as Map<String, dynamic>),
    job: json['job'] == null
        ? null
        : JobsObjRelInsertInput.fromJson(json['job'] as Map<String, dynamic>),
    jobId: json['job_id'] as int,
    openShifts: json['open_shifts'] == null
        ? null
        : OpenShiftsArrRelInsertInput.fromJson(
            json['open_shifts'] as Map<String, dynamic>),
    shiftDate: json['shift_date'] == null
        ? null
        : DateTime.parse(json['shift_date'] as String),
    shiftId: json['shift_id'] as int,
    shiftName: json['shift_name'] as String,
    shiftNotes: json['shift_notes'] as String,
    shiftTime: json['shift_time'] as String,
  );
}

Map<String, dynamic> _$ShiftsInsertInputToJson(ShiftsInsertInput instance) =>
    <String, dynamic>{
      'activities': instance.activities?.toJson(),
      'closed_shifts': instance.closedShifts?.toJson(),
      'job': instance.job?.toJson(),
      'job_id': instance.jobId,
      'open_shifts': instance.openShifts?.toJson(),
      'shift_date': instance.shiftDate?.toIso8601String(),
      'shift_id': instance.shiftId,
      'shift_name': instance.shiftName,
      'shift_notes': instance.shiftNotes,
      'shift_time': instance.shiftTime,
    };

ShiftsObjRelInsertInput _$ShiftsObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return ShiftsObjRelInsertInput(
    data: json['data'] == null
        ? null
        : ShiftsInsertInput.fromJson(json['data'] as Map<String, dynamic>),
    onConflict: json['on_conflict'] == null
        ? null
        : ShiftsOnConflict.fromJson(
            json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShiftsObjRelInsertInputToJson(
        ShiftsObjRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'on_conflict': instance.onConflict?.toJson(),
    };

ShiftsOnConflict _$ShiftsOnConflictFromJson(Map<String, dynamic> json) {
  return ShiftsOnConflict(
    constraint: _$enumDecodeNullable(
        _$ShiftsConstraintEnumMap, json['constraint'],
        unknownValue: ShiftsConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ShiftsUpdateColumnEnumMap, e,
            unknownValue: ShiftsUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : ShiftsBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShiftsOnConflictToJson(ShiftsOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$ShiftsConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$ShiftsUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$ShiftsConstraintEnumMap = {
  ShiftsConstraint.shiftsPkey: 'shifts_pkey',
  ShiftsConstraint.shiftsShiftIdKey: 'shifts_shift_id_key',
  ShiftsConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$ShiftsUpdateColumnEnumMap = {
  ShiftsUpdateColumn.jobId: 'job_id',
  ShiftsUpdateColumn.shiftDate: 'shift_date',
  ShiftsUpdateColumn.shiftId: 'shift_id',
  ShiftsUpdateColumn.shiftName: 'shift_name',
  ShiftsUpdateColumn.shiftNotes: 'shift_notes',
  ShiftsUpdateColumn.shiftTime: 'shift_time',
  ShiftsUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

StringComparisonExp _$StringComparisonExpFromJson(Map<String, dynamic> json) {
  return StringComparisonExp(
    $eq: json['_eq'] as String,
    $gt: json['_gt'] as String,
    $gte: json['_gte'] as String,
    $ilike: json['_ilike'] as String,
    $in: (json['_in'] as List)?.map((e) => e as String)?.toList(),
    $iregex: json['_iregex'] as String,
    $isNull: json['_is_null'] as bool,
    $like: json['_like'] as String,
    $lt: json['_lt'] as String,
    $lte: json['_lte'] as String,
    $neq: json['_neq'] as String,
    $nilike: json['_nilike'] as String,
    $nin: (json['_nin'] as List)?.map((e) => e as String)?.toList(),
    $niregex: json['_niregex'] as String,
    $nlike: json['_nlike'] as String,
    $nregex: json['_nregex'] as String,
    $nsimilar: json['_nsimilar'] as String,
    $regex: json['_regex'] as String,
    $similar: json['_similar'] as String,
  );
}

Map<String, dynamic> _$StringComparisonExpToJson(
        StringComparisonExp instance) =>
    <String, dynamic>{
      '_eq': instance.$eq,
      '_gt': instance.$gt,
      '_gte': instance.$gte,
      '_ilike': instance.$ilike,
      '_in': instance.$in,
      '_iregex': instance.$iregex,
      '_is_null': instance.$isNull,
      '_like': instance.$like,
      '_lt': instance.$lt,
      '_lte': instance.$lte,
      '_neq': instance.$neq,
      '_nilike': instance.$nilike,
      '_nin': instance.$nin,
      '_niregex': instance.$niregex,
      '_nlike': instance.$nlike,
      '_nregex': instance.$nregex,
      '_nsimilar': instance.$nsimilar,
      '_regex': instance.$regex,
      '_similar': instance.$similar,
    };

UsersBoolExp _$UsersBoolExpFromJson(Map<String, dynamic> json) {
  return UsersBoolExp(
    $and: (json['_and'] as List)
        ?.map((e) =>
            e == null ? null : UsersBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    $not: json['_not'] == null
        ? null
        : UsersBoolExp.fromJson(json['_not'] as Map<String, dynamic>),
    $or: (json['_or'] as List)
        ?.map((e) =>
            e == null ? null : UsersBoolExp.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    activities: json['activities'] == null
        ? null
        : ActivitiesBoolExp.fromJson(
            json['activities'] as Map<String, dynamic>),
    closedShifts: json['closed_shifts'] == null
        ? null
        : ClosedShiftsBoolExp.fromJson(
            json['closed_shifts'] as Map<String, dynamic>),
    contactNumber: json['contact_number'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['contact_number'] as Map<String, dynamic>),
    documents: json['documents'] == null
        ? null
        : DocumentsBoolExp.fromJson(json['documents'] as Map<String, dynamic>),
    emailAddress: json['email_address'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['email_address'] as Map<String, dynamic>),
    firstName: json['first_name'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['first_name'] as Map<String, dynamic>),
    homeAddress: json['home_address'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['home_address'] as Map<String, dynamic>),
    lastName: json['last_name'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['last_name'] as Map<String, dynamic>),
    profilePic: json['profile_pic'] == null
        ? null
        : StringComparisonExp.fromJson(
            json['profile_pic'] as Map<String, dynamic>),
    userId: json['user_id'] == null
        ? null
        : StringComparisonExp.fromJson(json['user_id'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersBoolExpToJson(UsersBoolExp instance) =>
    <String, dynamic>{
      '_and': instance.$and?.map((e) => e?.toJson())?.toList(),
      '_not': instance.$not?.toJson(),
      '_or': instance.$or?.map((e) => e?.toJson())?.toList(),
      'activities': instance.activities?.toJson(),
      'closed_shifts': instance.closedShifts?.toJson(),
      'contact_number': instance.contactNumber?.toJson(),
      'documents': instance.documents?.toJson(),
      'email_address': instance.emailAddress?.toJson(),
      'first_name': instance.firstName?.toJson(),
      'home_address': instance.homeAddress?.toJson(),
      'last_name': instance.lastName?.toJson(),
      'profile_pic': instance.profilePic?.toJson(),
      'user_id': instance.userId?.toJson(),
    };

UsersInsertInput _$UsersInsertInputFromJson(Map<String, dynamic> json) {
  return UsersInsertInput(
    activities: json['activities'] == null
        ? null
        : ActivitiesArrRelInsertInput.fromJson(
            json['activities'] as Map<String, dynamic>),
    closedShifts: json['closed_shifts'] == null
        ? null
        : ClosedShiftsArrRelInsertInput.fromJson(
            json['closed_shifts'] as Map<String, dynamic>),
    contactNumber: json['contact_number'] as String,
    documents: json['documents'] == null
        ? null
        : DocumentsArrRelInsertInput.fromJson(
            json['documents'] as Map<String, dynamic>),
    emailAddress: json['email_address'] as String,
    firstName: json['first_name'] as String,
    homeAddress: json['home_address'] as String,
    lastName: json['last_name'] as String,
    profilePic: json['profile_pic'] as String,
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$UsersInsertInputToJson(UsersInsertInput instance) =>
    <String, dynamic>{
      'activities': instance.activities?.toJson(),
      'closed_shifts': instance.closedShifts?.toJson(),
      'contact_number': instance.contactNumber,
      'documents': instance.documents?.toJson(),
      'email_address': instance.emailAddress,
      'first_name': instance.firstName,
      'home_address': instance.homeAddress,
      'last_name': instance.lastName,
      'profile_pic': instance.profilePic,
      'user_id': instance.userId,
    };

UsersObjRelInsertInput _$UsersObjRelInsertInputFromJson(
    Map<String, dynamic> json) {
  return UsersObjRelInsertInput(
    data: json['data'] == null
        ? null
        : UsersInsertInput.fromJson(json['data'] as Map<String, dynamic>),
    onConflict: json['on_conflict'] == null
        ? null
        : UsersOnConflict.fromJson(json['on_conflict'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersObjRelInsertInputToJson(
        UsersObjRelInsertInput instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'on_conflict': instance.onConflict?.toJson(),
    };

UsersOnConflict _$UsersOnConflictFromJson(Map<String, dynamic> json) {
  return UsersOnConflict(
    constraint: _$enumDecodeNullable(
        _$UsersConstraintEnumMap, json['constraint'],
        unknownValue: UsersConstraint.artemisUnknown),
    updateColumns: (json['update_columns'] as List)
        ?.map((e) => _$enumDecodeNullable(_$UsersUpdateColumnEnumMap, e,
            unknownValue: UsersUpdateColumn.artemisUnknown))
        ?.toList(),
    where: json['where'] == null
        ? null
        : UsersBoolExp.fromJson(json['where'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UsersOnConflictToJson(UsersOnConflict instance) =>
    <String, dynamic>{
      'constraint': _$UsersConstraintEnumMap[instance.constraint],
      'update_columns': instance.updateColumns
          ?.map((e) => _$UsersUpdateColumnEnumMap[e])
          ?.toList(),
      'where': instance.where?.toJson(),
    };

const _$UsersConstraintEnumMap = {
  UsersConstraint.usersEmailAddressKey: 'users_email_address_key',
  UsersConstraint.usersPkey: 'users_pkey',
  UsersConstraint.usersUserIdKey: 'users_user_id_key',
  UsersConstraint.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$UsersUpdateColumnEnumMap = {
  UsersUpdateColumn.contactNumber: 'contact_number',
  UsersUpdateColumn.emailAddress: 'email_address',
  UsersUpdateColumn.firstName: 'first_name',
  UsersUpdateColumn.homeAddress: 'home_address',
  UsersUpdateColumn.lastName: 'last_name',
  UsersUpdateColumn.profilePic: 'profile_pic',
  UsersUpdateColumn.userId: 'user_id',
  UsersUpdateColumn.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CreateJobs$MutationRoot$InsertJobs$Returning
    _$CreateJobs$MutationRoot$InsertJobs$ReturningFromJson(
        Map<String, dynamic> json) {
  return CreateJobs$MutationRoot$InsertJobs$Returning()
    ..jobId = json['job_id'] as int;
}

Map<String, dynamic> _$CreateJobs$MutationRoot$InsertJobs$ReturningToJson(
        CreateJobs$MutationRoot$InsertJobs$Returning instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
    };

CreateJobs$MutationRoot$InsertJobs _$CreateJobs$MutationRoot$InsertJobsFromJson(
    Map<String, dynamic> json) {
  return CreateJobs$MutationRoot$InsertJobs()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : CreateJobs$MutationRoot$InsertJobs$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreateJobs$MutationRoot$InsertJobsToJson(
        CreateJobs$MutationRoot$InsertJobs instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

CreateJobs$MutationRoot _$CreateJobs$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateJobs$MutationRoot()
    ..insertJobs = json['insert_jobs'] == null
        ? null
        : CreateJobs$MutationRoot$InsertJobs.fromJson(
            json['insert_jobs'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateJobs$MutationRootToJson(
        CreateJobs$MutationRoot instance) =>
    <String, dynamic>{
      'insert_jobs': instance.insertJobs?.toJson(),
    };

CreateShifts$MutationRoot$InsertShifts$Returning
    _$CreateShifts$MutationRoot$InsertShifts$ReturningFromJson(
        Map<String, dynamic> json) {
  return CreateShifts$MutationRoot$InsertShifts$Returning()
    ..shiftId = json['shift_id'] as int;
}

Map<String, dynamic> _$CreateShifts$MutationRoot$InsertShifts$ReturningToJson(
        CreateShifts$MutationRoot$InsertShifts$Returning instance) =>
    <String, dynamic>{
      'shift_id': instance.shiftId,
    };

CreateShifts$MutationRoot$InsertShifts
    _$CreateShifts$MutationRoot$InsertShiftsFromJson(
        Map<String, dynamic> json) {
  return CreateShifts$MutationRoot$InsertShifts()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : CreateShifts$MutationRoot$InsertShifts$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreateShifts$MutationRoot$InsertShiftsToJson(
        CreateShifts$MutationRoot$InsertShifts instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

CreateShifts$MutationRoot _$CreateShifts$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateShifts$MutationRoot()
    ..insertShifts = json['insert_shifts'] == null
        ? null
        : CreateShifts$MutationRoot$InsertShifts.fromJson(
            json['insert_shifts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateShifts$MutationRootToJson(
        CreateShifts$MutationRoot instance) =>
    <String, dynamic>{
      'insert_shifts': instance.insertShifts?.toJson(),
    };

GetShitsById$QueryRoot$Shifts _$GetShitsById$QueryRoot$ShiftsFromJson(
    Map<String, dynamic> json) {
  return GetShitsById$QueryRoot$Shifts()
    ..jobId = json['job_id'] as int
    ..shiftDate = json['shift_date'] == null
        ? null
        : DateTime.parse(json['shift_date'] as String)
    ..shiftId = json['shift_id'] as int
    ..shiftName = json['shift_name'] as String
    ..shiftNotes = json['shift_notes'] as String
    ..shiftTime = json['shift_time'] as String;
}

Map<String, dynamic> _$GetShitsById$QueryRoot$ShiftsToJson(
        GetShitsById$QueryRoot$Shifts instance) =>
    <String, dynamic>{
      'job_id': instance.jobId,
      'shift_date': instance.shiftDate?.toIso8601String(),
      'shift_id': instance.shiftId,
      'shift_name': instance.shiftName,
      'shift_notes': instance.shiftNotes,
      'shift_time': instance.shiftTime,
    };

GetShitsById$QueryRoot _$GetShitsById$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetShitsById$QueryRoot()
    ..shifts = (json['shifts'] as List)
        ?.map((e) => e == null
            ? null
            : GetShitsById$QueryRoot$Shifts.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetShitsById$QueryRootToJson(
        GetShitsById$QueryRoot instance) =>
    <String, dynamic>{
      'shifts': instance.shifts?.map((e) => e?.toJson())?.toList(),
    };

UpdateUser$MutationRoot$UpdateUsers$Returning
    _$UpdateUser$MutationRoot$UpdateUsers$ReturningFromJson(
        Map<String, dynamic> json) {
  return UpdateUser$MutationRoot$UpdateUsers$Returning()
    ..firstName = json['first_name'] as String
    ..contactNumber = json['contact_number'] as String
    ..homeAddress = json['home_address'] as String
    ..emailAddress = json['email_address'] as String
    ..lastName = json['last_name'] as String
    ..profilePic = json['profile_pic'] as String
    ..userId = json['user_id'] as String;
}

Map<String, dynamic> _$UpdateUser$MutationRoot$UpdateUsers$ReturningToJson(
        UpdateUser$MutationRoot$UpdateUsers$Returning instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'contact_number': instance.contactNumber,
      'home_address': instance.homeAddress,
      'email_address': instance.emailAddress,
      'last_name': instance.lastName,
      'profile_pic': instance.profilePic,
      'user_id': instance.userId,
    };

UpdateUser$MutationRoot$UpdateUsers
    _$UpdateUser$MutationRoot$UpdateUsersFromJson(Map<String, dynamic> json) {
  return UpdateUser$MutationRoot$UpdateUsers()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateUser$MutationRoot$UpdateUsers$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UpdateUser$MutationRoot$UpdateUsersToJson(
        UpdateUser$MutationRoot$UpdateUsers instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

UpdateUser$MutationRoot _$UpdateUser$MutationRootFromJson(
    Map<String, dynamic> json) {
  return UpdateUser$MutationRoot()
    ..updateUsers = json['update_users'] == null
        ? null
        : UpdateUser$MutationRoot$UpdateUsers.fromJson(
            json['update_users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateUser$MutationRootToJson(
        UpdateUser$MutationRoot instance) =>
    <String, dynamic>{
      'update_users': instance.updateUsers?.toJson(),
    };

UsersSetInput _$UsersSetInputFromJson(Map<String, dynamic> json) {
  return UsersSetInput(
    contactNumber: json['contact_number'] as String,
    emailAddress: json['email_address'] as String,
    firstName: json['first_name'] as String,
    homeAddress: json['home_address'] as String,
    lastName: json['last_name'] as String,
    profilePic: json['profile_pic'] as String,
    userId: json['user_id'] as String,
  );
}

Map<String, dynamic> _$UsersSetInputToJson(UsersSetInput instance) =>
    <String, dynamic>{
      'contact_number': instance.contactNumber,
      'email_address': instance.emailAddress,
      'first_name': instance.firstName,
      'home_address': instance.homeAddress,
      'last_name': instance.lastName,
      'profile_pic': instance.profilePic,
      'user_id': instance.userId,
    };

CurrentUser$QueryRoot$Users$Documents
    _$CurrentUser$QueryRoot$Users$DocumentsFromJson(Map<String, dynamic> json) {
  return CurrentUser$QueryRoot$Users$Documents()
    ..documentId = json['document_id'] as int
    ..documentName = json['document_name'] as String
    ..documentUrl = json['document_url'] as String;
}

Map<String, dynamic> _$CurrentUser$QueryRoot$Users$DocumentsToJson(
        CurrentUser$QueryRoot$Users$Documents instance) =>
    <String, dynamic>{
      'document_id': instance.documentId,
      'document_name': instance.documentName,
      'document_url': instance.documentUrl,
    };

CurrentUser$QueryRoot$Users$Activities
    _$CurrentUser$QueryRoot$Users$ActivitiesFromJson(
        Map<String, dynamic> json) {
  return CurrentUser$QueryRoot$Users$Activities()
    ..activityId = json['activity_id'] as String
    ..isAccepted = json['is_accepted'] as bool
    ..isCompleted = json['is_completed'] as bool
    ..shiftEndtime = json['shift_endtime'] as String
    ..shiftId = json['shift_id'] as int
    ..shiftStarttime = json['shift_starttime'] as String;
}

Map<String, dynamic> _$CurrentUser$QueryRoot$Users$ActivitiesToJson(
        CurrentUser$QueryRoot$Users$Activities instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'is_accepted': instance.isAccepted,
      'is_completed': instance.isCompleted,
      'shift_endtime': instance.shiftEndtime,
      'shift_id': instance.shiftId,
      'shift_starttime': instance.shiftStarttime,
    };

CurrentUser$QueryRoot$Users _$CurrentUser$QueryRoot$UsersFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$QueryRoot$Users()
    ..userId = json['user_id'] as String
    ..documents = (json['documents'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentUser$QueryRoot$Users$Documents.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..activities = (json['activities'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentUser$QueryRoot$Users$Activities.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..firstName = json['first_name'] as String
    ..lastName = json['last_name'] as String
    ..contactNumber = json['contact_number'] as String
    ..emailAddress = json['email_address'] as String
    ..homeAddress = json['home_address'] as String
    ..profilePic = json['profile_pic'] as String;
}

Map<String, dynamic> _$CurrentUser$QueryRoot$UsersToJson(
        CurrentUser$QueryRoot$Users instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'documents': instance.documents?.map((e) => e?.toJson())?.toList(),
      'activities': instance.activities?.map((e) => e?.toJson())?.toList(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'contact_number': instance.contactNumber,
      'email_address': instance.emailAddress,
      'home_address': instance.homeAddress,
      'profile_pic': instance.profilePic,
    };

CurrentUser$QueryRoot _$CurrentUser$QueryRootFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$QueryRoot()
    ..users = (json['users'] as List)
        ?.map((e) => e == null
            ? null
            : CurrentUser$QueryRoot$Users.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CurrentUser$QueryRootToJson(
        CurrentUser$QueryRoot instance) =>
    <String, dynamic>{
      'users': instance.users?.map((e) => e?.toJson())?.toList(),
    };

CreateUser$MutationRoot$InsertUsers$Returning
    _$CreateUser$MutationRoot$InsertUsers$ReturningFromJson(
        Map<String, dynamic> json) {
  return CreateUser$MutationRoot$InsertUsers$Returning()
    ..contactNumber = json['contact_number'] as String;
}

Map<String, dynamic> _$CreateUser$MutationRoot$InsertUsers$ReturningToJson(
        CreateUser$MutationRoot$InsertUsers$Returning instance) =>
    <String, dynamic>{
      'contact_number': instance.contactNumber,
    };

CreateUser$MutationRoot$InsertUsers
    _$CreateUser$MutationRoot$InsertUsersFromJson(Map<String, dynamic> json) {
  return CreateUser$MutationRoot$InsertUsers()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : CreateUser$MutationRoot$InsertUsers$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreateUser$MutationRoot$InsertUsersToJson(
        CreateUser$MutationRoot$InsertUsers instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

CreateUser$MutationRoot _$CreateUser$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateUser$MutationRoot()
    ..insertUsers = json['insert_users'] == null
        ? null
        : CreateUser$MutationRoot$InsertUsers.fromJson(
            json['insert_users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateUser$MutationRootToJson(
        CreateUser$MutationRoot instance) =>
    <String, dynamic>{
      'insert_users': instance.insertUsers?.toJson(),
    };

DeleteClosedShift$MutationRoot$DeleteClosedShifts
    _$DeleteClosedShift$MutationRoot$DeleteClosedShiftsFromJson(
        Map<String, dynamic> json) {
  return DeleteClosedShift$MutationRoot$DeleteClosedShifts()
    ..affectedRows = json['affected_rows'] as int;
}

Map<String, dynamic> _$DeleteClosedShift$MutationRoot$DeleteClosedShiftsToJson(
        DeleteClosedShift$MutationRoot$DeleteClosedShifts instance) =>
    <String, dynamic>{
      'affected_rows': instance.affectedRows,
    };

DeleteClosedShift$MutationRoot _$DeleteClosedShift$MutationRootFromJson(
    Map<String, dynamic> json) {
  return DeleteClosedShift$MutationRoot()
    ..deleteClosedShifts = json['delete_closed_shifts'] == null
        ? null
        : DeleteClosedShift$MutationRoot$DeleteClosedShifts.fromJson(
            json['delete_closed_shifts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeleteClosedShift$MutationRootToJson(
        DeleteClosedShift$MutationRoot instance) =>
    <String, dynamic>{
      'delete_closed_shifts': instance.deleteClosedShifts?.toJson(),
    };

GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job
    _$GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$JobFromJson(
        Map<String, dynamic> json) {
  return GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job()
    ..isContract = json['is_contract'] as bool
    ..isFulltime = json['is_fulltime'] as bool
    ..isParttime = json['is_parttime'] as bool
    ..jobDescription = json['job_description'] as String
    ..jobId = json['job_id'] as int
    ..jobLogo = json['job_logo'] as String
    ..jobLocation = json['job_location'] as String
    ..jobName = json['job_name'] as String
    ..jobQualifications = json['job_qualifications'] as String
    ..jobResponsibilities = json['job_responsibilities'] as String
    ..jobSalary = json['job_salary'] as String;
}

Map<String, dynamic>
    _$GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$JobToJson(
            GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job instance) =>
        <String, dynamic>{
          'is_contract': instance.isContract,
          'is_fulltime': instance.isFulltime,
          'is_parttime': instance.isParttime,
          'job_description': instance.jobDescription,
          'job_id': instance.jobId,
          'job_logo': instance.jobLogo,
          'job_location': instance.jobLocation,
          'job_name': instance.jobName,
          'job_qualifications': instance.jobQualifications,
          'job_responsibilities': instance.jobResponsibilities,
          'job_salary': instance.jobSalary,
        };

GetAllClosedShifts$QueryRoot$ClosedShifts$Shift
    _$GetAllClosedShifts$QueryRoot$ClosedShifts$ShiftFromJson(
        Map<String, dynamic> json) {
  return GetAllClosedShifts$QueryRoot$ClosedShifts$Shift()
    ..shiftDate = json['shift_date'] == null
        ? null
        : DateTime.parse(json['shift_date'] as String)
    ..shiftName = json['shift_name'] as String
    ..shiftNotes = json['shift_notes'] as String
    ..shiftTime = json['shift_time'] as String
    ..job = json['job'] == null
        ? null
        : GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job.fromJson(
            json['job'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetAllClosedShifts$QueryRoot$ClosedShifts$ShiftToJson(
        GetAllClosedShifts$QueryRoot$ClosedShifts$Shift instance) =>
    <String, dynamic>{
      'shift_date': instance.shiftDate?.toIso8601String(),
      'shift_name': instance.shiftName,
      'shift_notes': instance.shiftNotes,
      'shift_time': instance.shiftTime,
      'job': instance.job?.toJson(),
    };

GetAllClosedShifts$QueryRoot$ClosedShifts
    _$GetAllClosedShifts$QueryRoot$ClosedShiftsFromJson(
        Map<String, dynamic> json) {
  return GetAllClosedShifts$QueryRoot$ClosedShifts()
    ..closedShiftsId = json['closed_shifts_id'] as int
    ..shiftId = json['shift_id'] as int
    ..shift = json['shift'] == null
        ? null
        : GetAllClosedShifts$QueryRoot$ClosedShifts$Shift.fromJson(
            json['shift'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetAllClosedShifts$QueryRoot$ClosedShiftsToJson(
        GetAllClosedShifts$QueryRoot$ClosedShifts instance) =>
    <String, dynamic>{
      'closed_shifts_id': instance.closedShiftsId,
      'shift_id': instance.shiftId,
      'shift': instance.shift?.toJson(),
    };

GetAllClosedShifts$QueryRoot _$GetAllClosedShifts$QueryRootFromJson(
    Map<String, dynamic> json) {
  return GetAllClosedShifts$QueryRoot()
    ..closedShifts = (json['closed_shifts'] as List)
        ?.map((e) => e == null
            ? null
            : GetAllClosedShifts$QueryRoot$ClosedShifts.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetAllClosedShifts$QueryRootToJson(
        GetAllClosedShifts$QueryRoot instance) =>
    <String, dynamic>{
      'closed_shifts': instance.closedShifts?.map((e) => e?.toJson())?.toList(),
    };

GetAllJobs$QueryRoot$Jobs _$GetAllJobs$QueryRoot$JobsFromJson(
    Map<String, dynamic> json) {
  return GetAllJobs$QueryRoot$Jobs()
    ..isContract = json['is_contract'] as bool
    ..isFulltime = json['is_fulltime'] as bool
    ..isParttime = json['is_parttime'] as bool
    ..jobDescription = json['job_description'] as String
    ..jobId = json['job_id'] as int
    ..jobLocation = json['job_location'] as String
    ..jobLogo = json['job_logo'] as String
    ..jobName = json['job_name'] as String
    ..jobQualifications = json['job_qualifications'] as String
    ..jobResponsibilities = json['job_responsibilities'] as String
    ..jobSalary = json['job_salary'] as String;
}

Map<String, dynamic> _$GetAllJobs$QueryRoot$JobsToJson(
        GetAllJobs$QueryRoot$Jobs instance) =>
    <String, dynamic>{
      'is_contract': instance.isContract,
      'is_fulltime': instance.isFulltime,
      'is_parttime': instance.isParttime,
      'job_description': instance.jobDescription,
      'job_id': instance.jobId,
      'job_location': instance.jobLocation,
      'job_logo': instance.jobLogo,
      'job_name': instance.jobName,
      'job_qualifications': instance.jobQualifications,
      'job_responsibilities': instance.jobResponsibilities,
      'job_salary': instance.jobSalary,
    };

GetAllJobs$QueryRoot _$GetAllJobs$QueryRootFromJson(Map<String, dynamic> json) {
  return GetAllJobs$QueryRoot()
    ..jobs = (json['jobs'] as List)
        ?.map((e) => e == null
            ? null
            : GetAllJobs$QueryRoot$Jobs.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetAllJobs$QueryRootToJson(
        GetAllJobs$QueryRoot instance) =>
    <String, dynamic>{
      'jobs': instance.jobs?.map((e) => e?.toJson())?.toList(),
    };

CreateOpenShift$MutationRoot$InsertOpenShifts$Returning
    _$CreateOpenShift$MutationRoot$InsertOpenShifts$ReturningFromJson(
        Map<String, dynamic> json) {
  return CreateOpenShift$MutationRoot$InsertOpenShifts$Returning()
    ..openShiftsId = json['open_shifts_id'] as String;
}

Map<String, dynamic>
    _$CreateOpenShift$MutationRoot$InsertOpenShifts$ReturningToJson(
            CreateOpenShift$MutationRoot$InsertOpenShifts$Returning instance) =>
        <String, dynamic>{
          'open_shifts_id': instance.openShiftsId,
        };

CreateOpenShift$MutationRoot$InsertOpenShifts
    _$CreateOpenShift$MutationRoot$InsertOpenShiftsFromJson(
        Map<String, dynamic> json) {
  return CreateOpenShift$MutationRoot$InsertOpenShifts()
    ..affectedRows = json['affected_rows'] as int
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : CreateOpenShift$MutationRoot$InsertOpenShifts$Returning.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CreateOpenShift$MutationRoot$InsertOpenShiftsToJson(
        CreateOpenShift$MutationRoot$InsertOpenShifts instance) =>
    <String, dynamic>{
      'affected_rows': instance.affectedRows,
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

CreateOpenShift$MutationRoot _$CreateOpenShift$MutationRootFromJson(
    Map<String, dynamic> json) {
  return CreateOpenShift$MutationRoot()
    ..insertOpenShifts = json['insert_open_shifts'] == null
        ? null
        : CreateOpenShift$MutationRoot$InsertOpenShifts.fromJson(
            json['insert_open_shifts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateOpenShift$MutationRootToJson(
        CreateOpenShift$MutationRoot instance) =>
    <String, dynamic>{
      'insert_open_shifts': instance.insertOpenShifts?.toJson(),
    };

GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$Job
    _$GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$JobFromJson(
        Map<String, dynamic> json) {
  return GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$Job()
    ..isContract = json['is_contract'] as bool
    ..isFulltime = json['is_fulltime'] as bool
    ..isParttime = json['is_parttime'] as bool
    ..jobDescription = json['job_description'] as String
    ..jobId = json['job_id'] as int
    ..jobLocation = json['job_location'] as String
    ..jobLogo = json['job_logo'] as String
    ..jobName = json['job_name'] as String
    ..jobQualifications = json['job_qualifications'] as String
    ..jobResponsibilities = json['job_responsibilities'] as String
    ..jobSalary = json['job_salary'] as String;
}

Map<String, dynamic>
    _$GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$JobToJson(
            GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$Job instance) =>
        <String, dynamic>{
          'is_contract': instance.isContract,
          'is_fulltime': instance.isFulltime,
          'is_parttime': instance.isParttime,
          'job_description': instance.jobDescription,
          'job_id': instance.jobId,
          'job_location': instance.jobLocation,
          'job_logo': instance.jobLogo,
          'job_name': instance.jobName,
          'job_qualifications': instance.jobQualifications,
          'job_responsibilities': instance.jobResponsibilities,
          'job_salary': instance.jobSalary,
        };

GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift
    _$GetAllOpenShifts$SubscriptionRoot$OpenShifts$ShiftFromJson(
        Map<String, dynamic> json) {
  return GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift()
    ..shiftTime = json['shift_time'] as String
    ..shiftNotes = json['shift_notes'] as String
    ..shiftName = json['shift_name'] as String
    ..shiftId = json['shift_id'] as int
    ..shiftDate = json['shift_date'] == null
        ? null
        : DateTime.parse(json['shift_date'] as String)
    ..jobId = json['job_id'] as int
    ..job = json['job'] == null
        ? null
        : GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift$Job.fromJson(
            json['job'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetAllOpenShifts$SubscriptionRoot$OpenShifts$ShiftToJson(
        GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift instance) =>
    <String, dynamic>{
      'shift_time': instance.shiftTime,
      'shift_notes': instance.shiftNotes,
      'shift_name': instance.shiftName,
      'shift_id': instance.shiftId,
      'shift_date': instance.shiftDate?.toIso8601String(),
      'job_id': instance.jobId,
      'job': instance.job?.toJson(),
    };

GetAllOpenShifts$SubscriptionRoot$OpenShifts
    _$GetAllOpenShifts$SubscriptionRoot$OpenShiftsFromJson(
        Map<String, dynamic> json) {
  return GetAllOpenShifts$SubscriptionRoot$OpenShifts()
    ..shiftId = json['shift_id'] as int
    ..openShiftsId = json['open_shifts_id'] as String
    ..shift = json['shift'] == null
        ? null
        : GetAllOpenShifts$SubscriptionRoot$OpenShifts$Shift.fromJson(
            json['shift'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetAllOpenShifts$SubscriptionRoot$OpenShiftsToJson(
        GetAllOpenShifts$SubscriptionRoot$OpenShifts instance) =>
    <String, dynamic>{
      'shift_id': instance.shiftId,
      'open_shifts_id': instance.openShiftsId,
      'shift': instance.shift?.toJson(),
    };

GetAllOpenShifts$SubscriptionRoot _$GetAllOpenShifts$SubscriptionRootFromJson(
    Map<String, dynamic> json) {
  return GetAllOpenShifts$SubscriptionRoot()
    ..openShifts = (json['open_shifts'] as List)
        ?.map((e) => e == null
            ? null
            : GetAllOpenShifts$SubscriptionRoot$OpenShifts.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetAllOpenShifts$SubscriptionRootToJson(
        GetAllOpenShifts$SubscriptionRoot instance) =>
    <String, dynamic>{
      'open_shifts': instance.openShifts?.map((e) => e?.toJson())?.toList(),
    };

DeleteOpenShift$MutationRoot$DeleteOpenShifts
    _$DeleteOpenShift$MutationRoot$DeleteOpenShiftsFromJson(
        Map<String, dynamic> json) {
  return DeleteOpenShift$MutationRoot$DeleteOpenShifts()
    ..affectedRows = json['affected_rows'] as int;
}

Map<String, dynamic> _$DeleteOpenShift$MutationRoot$DeleteOpenShiftsToJson(
        DeleteOpenShift$MutationRoot$DeleteOpenShifts instance) =>
    <String, dynamic>{
      'affected_rows': instance.affectedRows,
    };

DeleteOpenShift$MutationRoot _$DeleteOpenShift$MutationRootFromJson(
    Map<String, dynamic> json) {
  return DeleteOpenShift$MutationRoot()
    ..deleteOpenShifts = json['delete_open_shifts'] == null
        ? null
        : DeleteOpenShift$MutationRoot$DeleteOpenShifts.fromJson(
            json['delete_open_shifts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DeleteOpenShift$MutationRootToJson(
        DeleteOpenShift$MutationRoot instance) =>
    <String, dynamic>{
      'delete_open_shifts': instance.deleteOpenShifts?.toJson(),
    };

CreateActivityArguments _$CreateActivityArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateActivityArguments(
    activityId: json['activityId'] as String,
    shiftId: json['shiftId'] as int,
    userId: json['userId'] as String,
    isAccepted: json['isAccepted'] as bool,
  );
}

Map<String, dynamic> _$CreateActivityArgumentsToJson(
        CreateActivityArguments instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
      'shiftId': instance.shiftId,
      'userId': instance.userId,
      'isAccepted': instance.isAccepted,
    };

UpdateActivityArguments _$UpdateActivityArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateActivityArguments(
    id: json['id'] as int,
    starttime: json['starttime'] as String,
    endtime: json['endtime'] as String,
  );
}

Map<String, dynamic> _$UpdateActivityArgumentsToJson(
        UpdateActivityArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'starttime': instance.starttime,
      'endtime': instance.endtime,
    };

CreateClosedShiftArguments _$CreateClosedShiftArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateClosedShiftArguments(
    input: json['input'] == null
        ? null
        : ClosedShiftsInsertInput.fromJson(
            json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateClosedShiftArgumentsToJson(
        CreateClosedShiftArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

CreateJobsArguments _$CreateJobsArgumentsFromJson(Map<String, dynamic> json) {
  return CreateJobsArguments(
    input: json['input'] == null
        ? null
        : JobsInsertInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateJobsArgumentsToJson(
        CreateJobsArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

CreateShiftsArguments _$CreateShiftsArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateShiftsArguments(
    input: json['input'] == null
        ? null
        : ShiftsInsertInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateShiftsArgumentsToJson(
        CreateShiftsArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

GetShitsByIdArguments _$GetShitsByIdArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetShitsByIdArguments(
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$GetShitsByIdArgumentsToJson(
        GetShitsByIdArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateUserArguments _$UpdateUserArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateUserArguments(
    input: json['input'] == null
        ? null
        : UsersSetInput.fromJson(json['input'] as Map<String, dynamic>),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$UpdateUserArgumentsToJson(
        UpdateUserArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
      'id': instance.id,
    };

CreateUserArguments _$CreateUserArgumentsFromJson(Map<String, dynamic> json) {
  return CreateUserArguments(
    input: json['input'] == null
        ? null
        : UsersInsertInput.fromJson(json['input'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateUserArgumentsToJson(
        CreateUserArguments instance) =>
    <String, dynamic>{
      'input': instance.input?.toJson(),
    };

DeleteClosedShiftArguments _$DeleteClosedShiftArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteClosedShiftArguments(
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$DeleteClosedShiftArgumentsToJson(
        DeleteClosedShiftArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateOpenShiftArguments _$CreateOpenShiftArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateOpenShiftArguments(
    openShiftId: json['openShiftId'] as String,
    shiftId: json['shiftId'] as int,
  );
}

Map<String, dynamic> _$CreateOpenShiftArgumentsToJson(
        CreateOpenShiftArguments instance) =>
    <String, dynamic>{
      'openShiftId': instance.openShiftId,
      'shiftId': instance.shiftId,
    };

DeleteOpenShiftArguments _$DeleteOpenShiftArgumentsFromJson(
    Map<String, dynamic> json) {
  return DeleteOpenShiftArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$DeleteOpenShiftArgumentsToJson(
        DeleteOpenShiftArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
