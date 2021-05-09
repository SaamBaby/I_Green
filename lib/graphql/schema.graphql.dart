// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateActivity$MutationRoot$InsertActivitiesOne with EquatableMixin {
  CreateActivity$MutationRoot$InsertActivitiesOne();

  factory CreateActivity$MutationRoot$InsertActivitiesOne.fromJson(
          Map<String, dynamic> json) =>
      _$CreateActivity$MutationRoot$InsertActivitiesOneFromJson(json);

  @JsonKey(name: 'activity_id')
  String activityId;

  @override
  List<Object> get props => [activityId];
  Map<String, dynamic> toJson() =>
      _$CreateActivity$MutationRoot$InsertActivitiesOneToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateActivity$MutationRoot with EquatableMixin {
  CreateActivity$MutationRoot();

  factory CreateActivity$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateActivity$MutationRootFromJson(json);

  @JsonKey(name: 'insert_activities_one')
  CreateActivity$MutationRoot$InsertActivitiesOne insertActivitiesOne;

  @override
  List<Object> get props => [insertActivitiesOne];
  Map<String, dynamic> toJson() => _$CreateActivity$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateClosedShift$MutationRoot$InsertClosedShifts$Returning
    with EquatableMixin {
  CreateClosedShift$MutationRoot$InsertClosedShifts$Returning();

  factory CreateClosedShift$MutationRoot$InsertClosedShifts$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$CreateClosedShift$MutationRoot$InsertClosedShifts$ReturningFromJson(
          json);

  @JsonKey(name: 'closed_shifts_id')
  int closedShiftsId;

  @override
  List<Object> get props => [closedShiftsId];
  Map<String, dynamic> toJson() =>
      _$CreateClosedShift$MutationRoot$InsertClosedShifts$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateClosedShift$MutationRoot$InsertClosedShifts with EquatableMixin {
  CreateClosedShift$MutationRoot$InsertClosedShifts();

  factory CreateClosedShift$MutationRoot$InsertClosedShifts.fromJson(
          Map<String, dynamic> json) =>
      _$CreateClosedShift$MutationRoot$InsertClosedShiftsFromJson(json);

  List<CreateClosedShift$MutationRoot$InsertClosedShifts$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$CreateClosedShift$MutationRoot$InsertClosedShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateClosedShift$MutationRoot with EquatableMixin {
  CreateClosedShift$MutationRoot();

  factory CreateClosedShift$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateClosedShift$MutationRootFromJson(json);

  @JsonKey(name: 'insert_closed_shifts')
  CreateClosedShift$MutationRoot$InsertClosedShifts insertClosedShifts;

  @override
  List<Object> get props => [insertClosedShifts];
  Map<String, dynamic> toJson() => _$CreateClosedShift$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivitiesArrRelInsertInput with EquatableMixin {
  ActivitiesArrRelInsertInput({@required this.data, this.onConflict});

  factory ActivitiesArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesArrRelInsertInputFromJson(json);

  List<ActivitiesInsertInput> data;

  @JsonKey(name: 'on_conflict')
  ActivitiesOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$ActivitiesArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivitiesBoolExp with EquatableMixin {
  ActivitiesBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.activityId,
      this.isAccepted,
      this.isCompleted,
      this.shift,
      this.shiftEndtime,
      this.shiftId,
      this.shiftStarttime,
      this.user,
      this.userId});

  factory ActivitiesBoolExp.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<ActivitiesBoolExp> $and;

  @JsonKey(name: '_not')
  ActivitiesBoolExp $not;

  @JsonKey(name: '_or')
  List<ActivitiesBoolExp> $or;

  @JsonKey(name: 'activity_id')
  StringComparisonExp activityId;

  @JsonKey(name: 'is_accepted')
  BooleanComparisonExp isAccepted;

  @JsonKey(name: 'is_completed')
  BooleanComparisonExp isCompleted;

  ShiftsBoolExp shift;

  @JsonKey(name: 'shift_endtime')
  StringComparisonExp shiftEndtime;

  @JsonKey(name: 'shift_id')
  IntComparisonExp shiftId;

  @JsonKey(name: 'shift_starttime')
  StringComparisonExp shiftStarttime;

  UsersBoolExp user;

  @JsonKey(name: 'user_id')
  StringComparisonExp userId;

  @override
  List<Object> get props => [
        $and,
        $not,
        $or,
        activityId,
        isAccepted,
        isCompleted,
        shift,
        shiftEndtime,
        shiftId,
        shiftStarttime,
        user,
        userId
      ];
  Map<String, dynamic> toJson() => _$ActivitiesBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivitiesInsertInput with EquatableMixin {
  ActivitiesInsertInput(
      {this.activityId,
      this.isAccepted,
      this.isCompleted,
      this.shift,
      this.shiftEndtime,
      this.shiftId,
      this.shiftStarttime,
      this.user,
      this.userId});

  factory ActivitiesInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesInsertInputFromJson(json);

  @JsonKey(name: 'activity_id')
  String activityId;

  @JsonKey(name: 'is_accepted')
  bool isAccepted;

  @JsonKey(name: 'is_completed')
  bool isCompleted;

  ShiftsObjRelInsertInput shift;

  @JsonKey(name: 'shift_endtime')
  String shiftEndtime;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_starttime')
  String shiftStarttime;

  UsersObjRelInsertInput user;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [
        activityId,
        isAccepted,
        isCompleted,
        shift,
        shiftEndtime,
        shiftId,
        shiftStarttime,
        user,
        userId
      ];
  Map<String, dynamic> toJson() => _$ActivitiesInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivitiesOnConflict with EquatableMixin {
  ActivitiesOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory ActivitiesOnConflict.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: ActivitiesConstraint.artemisUnknown)
  ActivitiesConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: ActivitiesUpdateColumn.artemisUnknown)
  List<ActivitiesUpdateColumn> updateColumns;

  ActivitiesBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$ActivitiesOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BooleanComparisonExp with EquatableMixin {
  BooleanComparisonExp(
      {this.$eq,
      this.$gt,
      this.$gte,
      this.$in,
      this.$isNull,
      this.$lt,
      this.$lte,
      this.$neq,
      this.$nin});

  factory BooleanComparisonExp.fromJson(Map<String, dynamic> json) =>
      _$BooleanComparisonExpFromJson(json);

  @JsonKey(name: '_eq')
  bool $eq;

  @JsonKey(name: '_gt')
  bool $gt;

  @JsonKey(name: '_gte')
  bool $gte;

  @JsonKey(name: '_in')
  List<bool> $in;

  @JsonKey(name: '_is_null')
  bool $isNull;

  @JsonKey(name: '_lt')
  bool $lt;

  @JsonKey(name: '_lte')
  bool $lte;

  @JsonKey(name: '_neq')
  bool $neq;

  @JsonKey(name: '_nin')
  List<bool> $nin;

  @override
  List<Object> get props =>
      [$eq, $gt, $gte, $in, $isNull, $lt, $lte, $neq, $nin];
  Map<String, dynamic> toJson() => _$BooleanComparisonExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClosedShiftsArrRelInsertInput with EquatableMixin {
  ClosedShiftsArrRelInsertInput({@required this.data, this.onConflict});

  factory ClosedShiftsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ClosedShiftsArrRelInsertInputFromJson(json);

  List<ClosedShiftsInsertInput> data;

  @JsonKey(name: 'on_conflict')
  ClosedShiftsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$ClosedShiftsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClosedShiftsBoolExp with EquatableMixin {
  ClosedShiftsBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.closedShiftsId,
      this.shift,
      this.shiftId,
      this.user,
      this.userId});

  factory ClosedShiftsBoolExp.fromJson(Map<String, dynamic> json) =>
      _$ClosedShiftsBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<ClosedShiftsBoolExp> $and;

  @JsonKey(name: '_not')
  ClosedShiftsBoolExp $not;

  @JsonKey(name: '_or')
  List<ClosedShiftsBoolExp> $or;

  @JsonKey(name: 'closed_shifts_id')
  IntComparisonExp closedShiftsId;

  ShiftsBoolExp shift;

  @JsonKey(name: 'shift_id')
  IntComparisonExp shiftId;

  UsersBoolExp user;

  @JsonKey(name: 'user_id')
  StringComparisonExp userId;

  @override
  List<Object> get props =>
      [$and, $not, $or, closedShiftsId, shift, shiftId, user, userId];
  Map<String, dynamic> toJson() => _$ClosedShiftsBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClosedShiftsInsertInput with EquatableMixin {
  ClosedShiftsInsertInput(
      {this.closedShiftsId, this.shift, this.shiftId, this.user, this.userId});

  factory ClosedShiftsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ClosedShiftsInsertInputFromJson(json);

  @JsonKey(name: 'closed_shifts_id')
  int closedShiftsId;

  ShiftsObjRelInsertInput shift;

  @JsonKey(name: 'shift_id')
  int shiftId;

  UsersObjRelInsertInput user;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [closedShiftsId, shift, shiftId, user, userId];
  Map<String, dynamic> toJson() => _$ClosedShiftsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClosedShiftsOnConflict with EquatableMixin {
  ClosedShiftsOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory ClosedShiftsOnConflict.fromJson(Map<String, dynamic> json) =>
      _$ClosedShiftsOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: ClosedShiftsConstraint.artemisUnknown)
  ClosedShiftsConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: ClosedShiftsUpdateColumn.artemisUnknown)
  List<ClosedShiftsUpdateColumn> updateColumns;

  ClosedShiftsBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$ClosedShiftsOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DateComparisonExp with EquatableMixin {
  DateComparisonExp(
      {this.$eq,
      this.$gt,
      this.$gte,
      this.$in,
      this.$isNull,
      this.$lt,
      this.$lte,
      this.$neq,
      this.$nin});

  factory DateComparisonExp.fromJson(Map<String, dynamic> json) =>
      _$DateComparisonExpFromJson(json);

  @JsonKey(name: '_eq')
  DateTime $eq;

  @JsonKey(name: '_gt')
  DateTime $gt;

  @JsonKey(name: '_gte')
  DateTime $gte;

  @JsonKey(name: '_in')
  List<DateTime> $in;

  @JsonKey(name: '_is_null')
  bool $isNull;

  @JsonKey(name: '_lt')
  DateTime $lt;

  @JsonKey(name: '_lte')
  DateTime $lte;

  @JsonKey(name: '_neq')
  DateTime $neq;

  @JsonKey(name: '_nin')
  List<DateTime> $nin;

  @override
  List<Object> get props =>
      [$eq, $gt, $gte, $in, $isNull, $lt, $lte, $neq, $nin];
  Map<String, dynamic> toJson() => _$DateComparisonExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsArrRelInsertInput with EquatableMixin {
  DocumentsArrRelInsertInput({@required this.data, this.onConflict});

  factory DocumentsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$DocumentsArrRelInsertInputFromJson(json);

  List<DocumentsInsertInput> data;

  @JsonKey(name: 'on_conflict')
  DocumentsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$DocumentsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsBoolExp with EquatableMixin {
  DocumentsBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.documentId,
      this.documentName,
      this.documentUrl,
      this.user,
      this.userId});

  factory DocumentsBoolExp.fromJson(Map<String, dynamic> json) =>
      _$DocumentsBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<DocumentsBoolExp> $and;

  @JsonKey(name: '_not')
  DocumentsBoolExp $not;

  @JsonKey(name: '_or')
  List<DocumentsBoolExp> $or;

  @JsonKey(name: 'document_id')
  IntComparisonExp documentId;

  @JsonKey(name: 'document_name')
  StringComparisonExp documentName;

  @JsonKey(name: 'document_url')
  StringComparisonExp documentUrl;

  UsersBoolExp user;

  @JsonKey(name: 'user_id')
  StringComparisonExp userId;

  @override
  List<Object> get props =>
      [$and, $not, $or, documentId, documentName, documentUrl, user, userId];
  Map<String, dynamic> toJson() => _$DocumentsBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsInsertInput with EquatableMixin {
  DocumentsInsertInput(
      {this.documentId,
      this.documentName,
      this.documentUrl,
      this.user,
      this.userId});

  factory DocumentsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$DocumentsInsertInputFromJson(json);

  @JsonKey(name: 'document_id')
  int documentId;

  @JsonKey(name: 'document_name')
  String documentName;

  @JsonKey(name: 'document_url')
  String documentUrl;

  UsersObjRelInsertInput user;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props =>
      [documentId, documentName, documentUrl, user, userId];
  Map<String, dynamic> toJson() => _$DocumentsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DocumentsOnConflict with EquatableMixin {
  DocumentsOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory DocumentsOnConflict.fromJson(Map<String, dynamic> json) =>
      _$DocumentsOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: DocumentsConstraint.artemisUnknown)
  DocumentsConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: DocumentsUpdateColumn.artemisUnknown)
  List<DocumentsUpdateColumn> updateColumns;

  DocumentsBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$DocumentsOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IntComparisonExp with EquatableMixin {
  IntComparisonExp(
      {this.$eq,
      this.$gt,
      this.$gte,
      this.$in,
      this.$isNull,
      this.$lt,
      this.$lte,
      this.$neq,
      this.$nin});

  factory IntComparisonExp.fromJson(Map<String, dynamic> json) =>
      _$IntComparisonExpFromJson(json);

  @JsonKey(name: '_eq')
  int $eq;

  @JsonKey(name: '_gt')
  int $gt;

  @JsonKey(name: '_gte')
  int $gte;

  @JsonKey(name: '_in')
  List<int> $in;

  @JsonKey(name: '_is_null')
  bool $isNull;

  @JsonKey(name: '_lt')
  int $lt;

  @JsonKey(name: '_lte')
  int $lte;

  @JsonKey(name: '_neq')
  int $neq;

  @JsonKey(name: '_nin')
  List<int> $nin;

  @override
  List<Object> get props =>
      [$eq, $gt, $gte, $in, $isNull, $lt, $lte, $neq, $nin];
  Map<String, dynamic> toJson() => _$IntComparisonExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobsBoolExp with EquatableMixin {
  JobsBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.isContract,
      this.isFulltime,
      this.isParttime,
      this.jobDescription,
      this.jobId,
      this.jobLocation,
      this.jobLogo,
      this.jobName,
      this.jobQualifications,
      this.jobResponsibilities,
      this.jobSalary,
      this.shifts});

  factory JobsBoolExp.fromJson(Map<String, dynamic> json) =>
      _$JobsBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<JobsBoolExp> $and;

  @JsonKey(name: '_not')
  JobsBoolExp $not;

  @JsonKey(name: '_or')
  List<JobsBoolExp> $or;

  @JsonKey(name: 'is_contract')
  BooleanComparisonExp isContract;

  @JsonKey(name: 'is_fulltime')
  BooleanComparisonExp isFulltime;

  @JsonKey(name: 'is_parttime')
  BooleanComparisonExp isParttime;

  @JsonKey(name: 'job_description')
  StringComparisonExp jobDescription;

  @JsonKey(name: 'job_id')
  IntComparisonExp jobId;

  @JsonKey(name: 'job_location')
  StringComparisonExp jobLocation;

  @JsonKey(name: 'job_logo')
  StringComparisonExp jobLogo;

  @JsonKey(name: 'job_name')
  StringComparisonExp jobName;

  @JsonKey(name: 'job_qualifications')
  StringComparisonExp jobQualifications;

  @JsonKey(name: 'job_responsibilities')
  StringComparisonExp jobResponsibilities;

  @JsonKey(name: 'job_salary')
  StringComparisonExp jobSalary;

  ShiftsBoolExp shifts;

  @override
  List<Object> get props => [
        $and,
        $not,
        $or,
        isContract,
        isFulltime,
        isParttime,
        jobDescription,
        jobId,
        jobLocation,
        jobLogo,
        jobName,
        jobQualifications,
        jobResponsibilities,
        jobSalary,
        shifts
      ];
  Map<String, dynamic> toJson() => _$JobsBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobsInsertInput with EquatableMixin {
  JobsInsertInput(
      {this.isContract,
      this.isFulltime,
      this.isParttime,
      this.jobDescription,
      this.jobId,
      this.jobLocation,
      this.jobLogo,
      this.jobName,
      this.jobQualifications,
      this.jobResponsibilities,
      this.jobSalary,
      this.shifts});

  factory JobsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$JobsInsertInputFromJson(json);

  @JsonKey(name: 'is_contract')
  bool isContract;

  @JsonKey(name: 'is_fulltime')
  bool isFulltime;

  @JsonKey(name: 'is_parttime')
  bool isParttime;

  @JsonKey(name: 'job_description')
  String jobDescription;

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'job_location')
  String jobLocation;

  @JsonKey(name: 'job_logo')
  String jobLogo;

  @JsonKey(name: 'job_name')
  String jobName;

  @JsonKey(name: 'job_qualifications')
  String jobQualifications;

  @JsonKey(name: 'job_responsibilities')
  String jobResponsibilities;

  @JsonKey(name: 'job_salary')
  String jobSalary;

  ShiftsArrRelInsertInput shifts;

  @override
  List<Object> get props => [
        isContract,
        isFulltime,
        isParttime,
        jobDescription,
        jobId,
        jobLocation,
        jobLogo,
        jobName,
        jobQualifications,
        jobResponsibilities,
        jobSalary,
        shifts
      ];
  Map<String, dynamic> toJson() => _$JobsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobsObjRelInsertInput with EquatableMixin {
  JobsObjRelInsertInput({@required this.data, this.onConflict});

  factory JobsObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$JobsObjRelInsertInputFromJson(json);

  JobsInsertInput data;

  @JsonKey(name: 'on_conflict')
  JobsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$JobsObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JobsOnConflict with EquatableMixin {
  JobsOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory JobsOnConflict.fromJson(Map<String, dynamic> json) =>
      _$JobsOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: JobsConstraint.artemisUnknown)
  JobsConstraint constraint;

  @JsonKey(
      name: 'update_columns', unknownEnumValue: JobsUpdateColumn.artemisUnknown)
  List<JobsUpdateColumn> updateColumns;

  JobsBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$JobsOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenShiftsArrRelInsertInput with EquatableMixin {
  OpenShiftsArrRelInsertInput({@required this.data, this.onConflict});

  factory OpenShiftsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$OpenShiftsArrRelInsertInputFromJson(json);

  List<OpenShiftsInsertInput> data;

  @JsonKey(name: 'on_conflict')
  OpenShiftsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$OpenShiftsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenShiftsBoolExp with EquatableMixin {
  OpenShiftsBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.openShiftsId,
      this.shift,
      this.shiftId});

  factory OpenShiftsBoolExp.fromJson(Map<String, dynamic> json) =>
      _$OpenShiftsBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<OpenShiftsBoolExp> $and;

  @JsonKey(name: '_not')
  OpenShiftsBoolExp $not;

  @JsonKey(name: '_or')
  List<OpenShiftsBoolExp> $or;

  @JsonKey(name: 'open_shifts_id')
  StringComparisonExp openShiftsId;

  ShiftsBoolExp shift;

  @JsonKey(name: 'shift_id')
  IntComparisonExp shiftId;

  @override
  List<Object> get props => [$and, $not, $or, openShiftsId, shift, shiftId];
  Map<String, dynamic> toJson() => _$OpenShiftsBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenShiftsInsertInput with EquatableMixin {
  OpenShiftsInsertInput({this.openShiftsId, this.shift, this.shiftId});

  factory OpenShiftsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$OpenShiftsInsertInputFromJson(json);

  @JsonKey(name: 'open_shifts_id')
  String openShiftsId;

  ShiftsObjRelInsertInput shift;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @override
  List<Object> get props => [openShiftsId, shift, shiftId];
  Map<String, dynamic> toJson() => _$OpenShiftsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OpenShiftsOnConflict with EquatableMixin {
  OpenShiftsOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory OpenShiftsOnConflict.fromJson(Map<String, dynamic> json) =>
      _$OpenShiftsOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: OpenShiftsConstraint.artemisUnknown)
  OpenShiftsConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: OpenShiftsUpdateColumn.artemisUnknown)
  List<OpenShiftsUpdateColumn> updateColumns;

  OpenShiftsBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$OpenShiftsOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShiftsArrRelInsertInput with EquatableMixin {
  ShiftsArrRelInsertInput({@required this.data, this.onConflict});

  factory ShiftsArrRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ShiftsArrRelInsertInputFromJson(json);

  List<ShiftsInsertInput> data;

  @JsonKey(name: 'on_conflict')
  ShiftsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$ShiftsArrRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShiftsBoolExp with EquatableMixin {
  ShiftsBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.activities,
      this.closedShifts,
      this.job,
      this.jobId,
      this.openShifts,
      this.shiftDate,
      this.shiftId,
      this.shiftName,
      this.shiftNotes,
      this.shiftTime});

  factory ShiftsBoolExp.fromJson(Map<String, dynamic> json) =>
      _$ShiftsBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<ShiftsBoolExp> $and;

  @JsonKey(name: '_not')
  ShiftsBoolExp $not;

  @JsonKey(name: '_or')
  List<ShiftsBoolExp> $or;

  ActivitiesBoolExp activities;

  @JsonKey(name: 'closed_shifts')
  ClosedShiftsBoolExp closedShifts;

  JobsBoolExp job;

  @JsonKey(name: 'job_id')
  IntComparisonExp jobId;

  @JsonKey(name: 'open_shifts')
  OpenShiftsBoolExp openShifts;

  @JsonKey(name: 'shift_date')
  DateComparisonExp shiftDate;

  @JsonKey(name: 'shift_id')
  IntComparisonExp shiftId;

  @JsonKey(name: 'shift_name')
  StringComparisonExp shiftName;

  @JsonKey(name: 'shift_notes')
  StringComparisonExp shiftNotes;

  @JsonKey(name: 'shift_time')
  StringComparisonExp shiftTime;

  @override
  List<Object> get props => [
        $and,
        $not,
        $or,
        activities,
        closedShifts,
        job,
        jobId,
        openShifts,
        shiftDate,
        shiftId,
        shiftName,
        shiftNotes,
        shiftTime
      ];
  Map<String, dynamic> toJson() => _$ShiftsBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShiftsInsertInput with EquatableMixin {
  ShiftsInsertInput(
      {this.activities,
      this.closedShifts,
      this.job,
      this.jobId,
      this.openShifts,
      this.shiftDate,
      this.shiftId,
      this.shiftName,
      this.shiftNotes,
      this.shiftTime});

  factory ShiftsInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ShiftsInsertInputFromJson(json);

  ActivitiesArrRelInsertInput activities;

  @JsonKey(name: 'closed_shifts')
  ClosedShiftsArrRelInsertInput closedShifts;

  JobsObjRelInsertInput job;

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'open_shifts')
  OpenShiftsArrRelInsertInput openShifts;

  @JsonKey(name: 'shift_date')
  DateTime shiftDate;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_name')
  String shiftName;

  @JsonKey(name: 'shift_notes')
  String shiftNotes;

  @JsonKey(name: 'shift_time')
  String shiftTime;

  @override
  List<Object> get props => [
        activities,
        closedShifts,
        job,
        jobId,
        openShifts,
        shiftDate,
        shiftId,
        shiftName,
        shiftNotes,
        shiftTime
      ];
  Map<String, dynamic> toJson() => _$ShiftsInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShiftsObjRelInsertInput with EquatableMixin {
  ShiftsObjRelInsertInput({@required this.data, this.onConflict});

  factory ShiftsObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$ShiftsObjRelInsertInputFromJson(json);

  ShiftsInsertInput data;

  @JsonKey(name: 'on_conflict')
  ShiftsOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$ShiftsObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShiftsOnConflict with EquatableMixin {
  ShiftsOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory ShiftsOnConflict.fromJson(Map<String, dynamic> json) =>
      _$ShiftsOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: ShiftsConstraint.artemisUnknown)
  ShiftsConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: ShiftsUpdateColumn.artemisUnknown)
  List<ShiftsUpdateColumn> updateColumns;

  ShiftsBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$ShiftsOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StringComparisonExp with EquatableMixin {
  StringComparisonExp(
      {this.$eq,
      this.$gt,
      this.$gte,
      this.$ilike,
      this.$in,
      this.$iregex,
      this.$isNull,
      this.$like,
      this.$lt,
      this.$lte,
      this.$neq,
      this.$nilike,
      this.$nin,
      this.$niregex,
      this.$nlike,
      this.$nregex,
      this.$nsimilar,
      this.$regex,
      this.$similar});

  factory StringComparisonExp.fromJson(Map<String, dynamic> json) =>
      _$StringComparisonExpFromJson(json);

  @JsonKey(name: '_eq')
  String $eq;

  @JsonKey(name: '_gt')
  String $gt;

  @JsonKey(name: '_gte')
  String $gte;

  @JsonKey(name: '_ilike')
  String $ilike;

  @JsonKey(name: '_in')
  List<String> $in;

  @JsonKey(name: '_iregex')
  String $iregex;

  @JsonKey(name: '_is_null')
  bool $isNull;

  @JsonKey(name: '_like')
  String $like;

  @JsonKey(name: '_lt')
  String $lt;

  @JsonKey(name: '_lte')
  String $lte;

  @JsonKey(name: '_neq')
  String $neq;

  @JsonKey(name: '_nilike')
  String $nilike;

  @JsonKey(name: '_nin')
  List<String> $nin;

  @JsonKey(name: '_niregex')
  String $niregex;

  @JsonKey(name: '_nlike')
  String $nlike;

  @JsonKey(name: '_nregex')
  String $nregex;

  @JsonKey(name: '_nsimilar')
  String $nsimilar;

  @JsonKey(name: '_regex')
  String $regex;

  @JsonKey(name: '_similar')
  String $similar;

  @override
  List<Object> get props => [
        $eq,
        $gt,
        $gte,
        $ilike,
        $in,
        $iregex,
        $isNull,
        $like,
        $lt,
        $lte,
        $neq,
        $nilike,
        $nin,
        $niregex,
        $nlike,
        $nregex,
        $nsimilar,
        $regex,
        $similar
      ];
  Map<String, dynamic> toJson() => _$StringComparisonExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersBoolExp with EquatableMixin {
  UsersBoolExp(
      {this.$and,
      this.$not,
      this.$or,
      this.activities,
      this.closedShifts,
      this.contactNumber,
      this.documents,
      this.emailAddress,
      this.firstName,
      this.homeAddress,
      this.lastName,
      this.profilePic,
      this.userId});

  factory UsersBoolExp.fromJson(Map<String, dynamic> json) =>
      _$UsersBoolExpFromJson(json);

  @JsonKey(name: '_and')
  List<UsersBoolExp> $and;

  @JsonKey(name: '_not')
  UsersBoolExp $not;

  @JsonKey(name: '_or')
  List<UsersBoolExp> $or;

  ActivitiesBoolExp activities;

  @JsonKey(name: 'closed_shifts')
  ClosedShiftsBoolExp closedShifts;

  @JsonKey(name: 'contact_number')
  StringComparisonExp contactNumber;

  DocumentsBoolExp documents;

  @JsonKey(name: 'email_address')
  StringComparisonExp emailAddress;

  @JsonKey(name: 'first_name')
  StringComparisonExp firstName;

  @JsonKey(name: 'home_address')
  StringComparisonExp homeAddress;

  @JsonKey(name: 'last_name')
  StringComparisonExp lastName;

  @JsonKey(name: 'profile_pic')
  StringComparisonExp profilePic;

  @JsonKey(name: 'user_id')
  StringComparisonExp userId;

  @override
  List<Object> get props => [
        $and,
        $not,
        $or,
        activities,
        closedShifts,
        contactNumber,
        documents,
        emailAddress,
        firstName,
        homeAddress,
        lastName,
        profilePic,
        userId
      ];
  Map<String, dynamic> toJson() => _$UsersBoolExpToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersInsertInput with EquatableMixin {
  UsersInsertInput(
      {this.activities,
      this.closedShifts,
      this.contactNumber,
      this.documents,
      this.emailAddress,
      this.firstName,
      this.homeAddress,
      this.lastName,
      this.profilePic,
      this.userId});

  factory UsersInsertInput.fromJson(Map<String, dynamic> json) =>
      _$UsersInsertInputFromJson(json);

  ActivitiesArrRelInsertInput activities;

  @JsonKey(name: 'closed_shifts')
  ClosedShiftsArrRelInsertInput closedShifts;

  @JsonKey(name: 'contact_number')
  String contactNumber;

  DocumentsArrRelInsertInput documents;

  @JsonKey(name: 'email_address')
  String emailAddress;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'home_address')
  String homeAddress;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'profile_pic')
  String profilePic;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [
        activities,
        closedShifts,
        contactNumber,
        documents,
        emailAddress,
        firstName,
        homeAddress,
        lastName,
        profilePic,
        userId
      ];
  Map<String, dynamic> toJson() => _$UsersInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersObjRelInsertInput with EquatableMixin {
  UsersObjRelInsertInput({@required this.data, this.onConflict});

  factory UsersObjRelInsertInput.fromJson(Map<String, dynamic> json) =>
      _$UsersObjRelInsertInputFromJson(json);

  UsersInsertInput data;

  @JsonKey(name: 'on_conflict')
  UsersOnConflict onConflict;

  @override
  List<Object> get props => [data, onConflict];
  Map<String, dynamic> toJson() => _$UsersObjRelInsertInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersOnConflict with EquatableMixin {
  UsersOnConflict(
      {@required this.constraint, @required this.updateColumns, this.where});

  factory UsersOnConflict.fromJson(Map<String, dynamic> json) =>
      _$UsersOnConflictFromJson(json);

  @JsonKey(unknownEnumValue: UsersConstraint.artemisUnknown)
  UsersConstraint constraint;

  @JsonKey(
      name: 'update_columns',
      unknownEnumValue: UsersUpdateColumn.artemisUnknown)
  List<UsersUpdateColumn> updateColumns;

  UsersBoolExp where;

  @override
  List<Object> get props => [constraint, updateColumns, where];
  Map<String, dynamic> toJson() => _$UsersOnConflictToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateJobs$MutationRoot$InsertJobs$Returning with EquatableMixin {
  CreateJobs$MutationRoot$InsertJobs$Returning();

  factory CreateJobs$MutationRoot$InsertJobs$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$CreateJobs$MutationRoot$InsertJobs$ReturningFromJson(json);

  @JsonKey(name: 'job_id')
  int jobId;

  @override
  List<Object> get props => [jobId];
  Map<String, dynamic> toJson() =>
      _$CreateJobs$MutationRoot$InsertJobs$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateJobs$MutationRoot$InsertJobs with EquatableMixin {
  CreateJobs$MutationRoot$InsertJobs();

  factory CreateJobs$MutationRoot$InsertJobs.fromJson(
          Map<String, dynamic> json) =>
      _$CreateJobs$MutationRoot$InsertJobsFromJson(json);

  List<CreateJobs$MutationRoot$InsertJobs$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$CreateJobs$MutationRoot$InsertJobsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateJobs$MutationRoot with EquatableMixin {
  CreateJobs$MutationRoot();

  factory CreateJobs$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateJobs$MutationRootFromJson(json);

  @JsonKey(name: 'insert_jobs')
  CreateJobs$MutationRoot$InsertJobs insertJobs;

  @override
  List<Object> get props => [insertJobs];
  Map<String, dynamic> toJson() => _$CreateJobs$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShifts$MutationRoot$InsertShifts$Returning with EquatableMixin {
  CreateShifts$MutationRoot$InsertShifts$Returning();

  factory CreateShifts$MutationRoot$InsertShifts$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$CreateShifts$MutationRoot$InsertShifts$ReturningFromJson(json);

  @JsonKey(name: 'shift_id')
  int shiftId;

  @override
  List<Object> get props => [shiftId];
  Map<String, dynamic> toJson() =>
      _$CreateShifts$MutationRoot$InsertShifts$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShifts$MutationRoot$InsertShifts with EquatableMixin {
  CreateShifts$MutationRoot$InsertShifts();

  factory CreateShifts$MutationRoot$InsertShifts.fromJson(
          Map<String, dynamic> json) =>
      _$CreateShifts$MutationRoot$InsertShiftsFromJson(json);

  List<CreateShifts$MutationRoot$InsertShifts$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$CreateShifts$MutationRoot$InsertShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateShifts$MutationRoot with EquatableMixin {
  CreateShifts$MutationRoot();

  factory CreateShifts$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateShifts$MutationRootFromJson(json);

  @JsonKey(name: 'insert_shifts')
  CreateShifts$MutationRoot$InsertShifts insertShifts;

  @override
  List<Object> get props => [insertShifts];
  Map<String, dynamic> toJson() => _$CreateShifts$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetShitsById$QueryRoot$Shifts with EquatableMixin {
  GetShitsById$QueryRoot$Shifts();

  factory GetShitsById$QueryRoot$Shifts.fromJson(Map<String, dynamic> json) =>
      _$GetShitsById$QueryRoot$ShiftsFromJson(json);

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'shift_date')
  DateTime shiftDate;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_name')
  String shiftName;

  @JsonKey(name: 'shift_notes')
  String shiftNotes;

  @JsonKey(name: 'shift_time')
  String shiftTime;

  @override
  List<Object> get props =>
      [jobId, shiftDate, shiftId, shiftName, shiftNotes, shiftTime];
  Map<String, dynamic> toJson() => _$GetShitsById$QueryRoot$ShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetShitsById$QueryRoot with EquatableMixin {
  GetShitsById$QueryRoot();

  factory GetShitsById$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetShitsById$QueryRootFromJson(json);

  List<GetShitsById$QueryRoot$Shifts> shifts;

  @override
  List<Object> get props => [shifts];
  Map<String, dynamic> toJson() => _$GetShitsById$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot$UpdateUsers$Returning with EquatableMixin {
  UpdateUser$MutationRoot$UpdateUsers$Returning();

  factory UpdateUser$MutationRoot$UpdateUsers$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$MutationRoot$UpdateUsers$ReturningFromJson(json);

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'contact_number')
  String contactNumber;

  @JsonKey(name: 'home_address')
  String homeAddress;

  @JsonKey(name: 'email_address')
  String emailAddress;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'profile_pic')
  String profilePic;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [
        firstName,
        contactNumber,
        homeAddress,
        emailAddress,
        lastName,
        profilePic,
        userId
      ];
  Map<String, dynamic> toJson() =>
      _$UpdateUser$MutationRoot$UpdateUsers$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot$UpdateUsers with EquatableMixin {
  UpdateUser$MutationRoot$UpdateUsers();

  factory UpdateUser$MutationRoot$UpdateUsers.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$MutationRoot$UpdateUsersFromJson(json);

  List<UpdateUser$MutationRoot$UpdateUsers$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$UpdateUser$MutationRoot$UpdateUsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$MutationRoot with EquatableMixin {
  UpdateUser$MutationRoot();

  factory UpdateUser$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationRootFromJson(json);

  @JsonKey(name: 'update_users')
  UpdateUser$MutationRoot$UpdateUsers updateUsers;

  @override
  List<Object> get props => [updateUsers];
  Map<String, dynamic> toJson() => _$UpdateUser$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UsersSetInput with EquatableMixin {
  UsersSetInput(
      {this.contactNumber,
      this.emailAddress,
      this.firstName,
      this.homeAddress,
      this.lastName,
      this.profilePic,
      this.userId});

  factory UsersSetInput.fromJson(Map<String, dynamic> json) =>
      _$UsersSetInputFromJson(json);

  @JsonKey(name: 'contact_number')
  String contactNumber;

  @JsonKey(name: 'email_address')
  String emailAddress;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'home_address')
  String homeAddress;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'profile_pic')
  String profilePic;

  @JsonKey(name: 'user_id')
  String userId;

  @override
  List<Object> get props => [
        contactNumber,
        emailAddress,
        firstName,
        homeAddress,
        lastName,
        profilePic,
        userId
      ];
  Map<String, dynamic> toJson() => _$UsersSetInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$QueryRoot$Users$Documents with EquatableMixin {
  CurrentUser$QueryRoot$Users$Documents();

  factory CurrentUser$QueryRoot$Users$Documents.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$QueryRoot$Users$DocumentsFromJson(json);

  @JsonKey(name: 'document_id')
  int documentId;

  @JsonKey(name: 'document_name')
  String documentName;

  @JsonKey(name: 'document_url')
  String documentUrl;

  @override
  List<Object> get props => [documentId, documentName, documentUrl];
  Map<String, dynamic> toJson() =>
      _$CurrentUser$QueryRoot$Users$DocumentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$QueryRoot$Users$Activities with EquatableMixin {
  CurrentUser$QueryRoot$Users$Activities();

  factory CurrentUser$QueryRoot$Users$Activities.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentUser$QueryRoot$Users$ActivitiesFromJson(json);

  @JsonKey(name: 'activity_id')
  String activityId;

  @JsonKey(name: 'is_accepted')
  bool isAccepted;

  @JsonKey(name: 'is_completed')
  bool isCompleted;

  @JsonKey(name: 'shift_endtime')
  String shiftEndtime;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_starttime')
  String shiftStarttime;

  @override
  List<Object> get props => [
        activityId,
        isAccepted,
        isCompleted,
        shiftEndtime,
        shiftId,
        shiftStarttime
      ];
  Map<String, dynamic> toJson() =>
      _$CurrentUser$QueryRoot$Users$ActivitiesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$QueryRoot$Users with EquatableMixin {
  CurrentUser$QueryRoot$Users();

  factory CurrentUser$QueryRoot$Users.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$QueryRoot$UsersFromJson(json);

  @JsonKey(name: 'user_id')
  String userId;

  List<CurrentUser$QueryRoot$Users$Documents> documents;

  List<CurrentUser$QueryRoot$Users$Activities> activities;

  @JsonKey(name: 'first_name')
  String firstName;

  @JsonKey(name: 'last_name')
  String lastName;

  @JsonKey(name: 'contact_number')
  String contactNumber;

  @JsonKey(name: 'email_address')
  String emailAddress;

  @JsonKey(name: 'home_address')
  String homeAddress;

  @JsonKey(name: 'profile_pic')
  String profilePic;

  @override
  List<Object> get props => [
        userId,
        documents,
        activities,
        firstName,
        lastName,
        contactNumber,
        emailAddress,
        homeAddress,
        profilePic
      ];
  Map<String, dynamic> toJson() => _$CurrentUser$QueryRoot$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$QueryRoot with EquatableMixin {
  CurrentUser$QueryRoot();

  factory CurrentUser$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$QueryRootFromJson(json);

  List<CurrentUser$QueryRoot$Users> users;

  @override
  List<Object> get props => [users];
  Map<String, dynamic> toJson() => _$CurrentUser$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$MutationRoot$InsertUsers$Returning with EquatableMixin {
  CreateUser$MutationRoot$InsertUsers$Returning();

  factory CreateUser$MutationRoot$InsertUsers$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUser$MutationRoot$InsertUsers$ReturningFromJson(json);

  @JsonKey(name: 'contact_number')
  String contactNumber;

  @override
  List<Object> get props => [contactNumber];
  Map<String, dynamic> toJson() =>
      _$CreateUser$MutationRoot$InsertUsers$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$MutationRoot$InsertUsers with EquatableMixin {
  CreateUser$MutationRoot$InsertUsers();

  factory CreateUser$MutationRoot$InsertUsers.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUser$MutationRoot$InsertUsersFromJson(json);

  List<CreateUser$MutationRoot$InsertUsers$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$CreateUser$MutationRoot$InsertUsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$MutationRoot with EquatableMixin {
  CreateUser$MutationRoot();

  factory CreateUser$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateUser$MutationRootFromJson(json);

  @JsonKey(name: 'insert_users')
  CreateUser$MutationRoot$InsertUsers insertUsers;

  @override
  List<Object> get props => [insertUsers];
  Map<String, dynamic> toJson() => _$CreateUser$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteClosedShift$MutationRoot$DeleteClosedShifts with EquatableMixin {
  DeleteClosedShift$MutationRoot$DeleteClosedShifts();

  factory DeleteClosedShift$MutationRoot$DeleteClosedShifts.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteClosedShift$MutationRoot$DeleteClosedShiftsFromJson(json);

  @JsonKey(name: 'affected_rows')
  int affectedRows;

  @override
  List<Object> get props => [affectedRows];
  Map<String, dynamic> toJson() =>
      _$DeleteClosedShift$MutationRoot$DeleteClosedShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteClosedShift$MutationRoot with EquatableMixin {
  DeleteClosedShift$MutationRoot();

  factory DeleteClosedShift$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$DeleteClosedShift$MutationRootFromJson(json);

  @JsonKey(name: 'delete_closed_shifts')
  DeleteClosedShift$MutationRoot$DeleteClosedShifts deleteClosedShifts;

  @override
  List<Object> get props => [deleteClosedShifts];
  Map<String, dynamic> toJson() => _$DeleteClosedShift$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job with EquatableMixin {
  GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job();

  factory GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$JobFromJson(json);

  @JsonKey(name: 'is_contract')
  bool isContract;

  @JsonKey(name: 'is_fulltime')
  bool isFulltime;

  @JsonKey(name: 'is_parttime')
  bool isParttime;

  @JsonKey(name: 'job_description')
  String jobDescription;

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'job_logo')
  String jobLogo;

  @JsonKey(name: 'job_location')
  String jobLocation;

  @JsonKey(name: 'job_name')
  String jobName;

  @JsonKey(name: 'job_qualifications')
  String jobQualifications;

  @JsonKey(name: 'job_responsibilities')
  String jobResponsibilities;

  @JsonKey(name: 'job_salary')
  String jobSalary;

  @override
  List<Object> get props => [
        isContract,
        isFulltime,
        isParttime,
        jobDescription,
        jobId,
        jobLogo,
        jobLocation,
        jobName,
        jobQualifications,
        jobResponsibilities,
        jobSalary
      ];
  Map<String, dynamic> toJson() =>
      _$GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$JobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllClosedShifts$QueryRoot$ClosedShifts$Shift with EquatableMixin {
  GetAllClosedShifts$QueryRoot$ClosedShifts$Shift();

  factory GetAllClosedShifts$QueryRoot$ClosedShifts$Shift.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllClosedShifts$QueryRoot$ClosedShifts$ShiftFromJson(json);

  @JsonKey(name: 'shift_date')
  DateTime shiftDate;

  @JsonKey(name: 'shift_name')
  String shiftName;

  @JsonKey(name: 'shift_notes')
  String shiftNotes;

  @JsonKey(name: 'shift_time')
  String shiftTime;

  GetAllClosedShifts$QueryRoot$ClosedShifts$Shift$Job job;

  @override
  List<Object> get props => [shiftDate, shiftName, shiftNotes, shiftTime, job];
  Map<String, dynamic> toJson() =>
      _$GetAllClosedShifts$QueryRoot$ClosedShifts$ShiftToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllClosedShifts$QueryRoot$ClosedShifts with EquatableMixin {
  GetAllClosedShifts$QueryRoot$ClosedShifts();

  factory GetAllClosedShifts$QueryRoot$ClosedShifts.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllClosedShifts$QueryRoot$ClosedShiftsFromJson(json);

  @JsonKey(name: 'closed_shifts_id')
  int closedShiftsId;

  @JsonKey(name: 'shift_id')
  int shiftId;

  GetAllClosedShifts$QueryRoot$ClosedShifts$Shift shift;

  @override
  List<Object> get props => [closedShiftsId, shiftId, shift];
  Map<String, dynamic> toJson() =>
      _$GetAllClosedShifts$QueryRoot$ClosedShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllClosedShifts$QueryRoot with EquatableMixin {
  GetAllClosedShifts$QueryRoot();

  factory GetAllClosedShifts$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetAllClosedShifts$QueryRootFromJson(json);

  @JsonKey(name: 'closed_shifts')
  List<GetAllClosedShifts$QueryRoot$ClosedShifts> closedShifts;

  @override
  List<Object> get props => [closedShifts];
  Map<String, dynamic> toJson() => _$GetAllClosedShifts$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllJobs$QueryRoot$Jobs with EquatableMixin {
  GetAllJobs$QueryRoot$Jobs();

  factory GetAllJobs$QueryRoot$Jobs.fromJson(Map<String, dynamic> json) =>
      _$GetAllJobs$QueryRoot$JobsFromJson(json);

  @JsonKey(name: 'is_contract')
  bool isContract;

  @JsonKey(name: 'is_fulltime')
  bool isFulltime;

  @JsonKey(name: 'is_parttime')
  bool isParttime;

  @JsonKey(name: 'job_description')
  String jobDescription;

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'job_location')
  String jobLocation;

  @JsonKey(name: 'job_logo')
  String jobLogo;

  @JsonKey(name: 'job_name')
  String jobName;

  @JsonKey(name: 'job_qualifications')
  String jobQualifications;

  @JsonKey(name: 'job_responsibilities')
  String jobResponsibilities;

  @JsonKey(name: 'job_salary')
  String jobSalary;

  @override
  List<Object> get props => [
        isContract,
        isFulltime,
        isParttime,
        jobDescription,
        jobId,
        jobLocation,
        jobLogo,
        jobName,
        jobQualifications,
        jobResponsibilities,
        jobSalary
      ];
  Map<String, dynamic> toJson() => _$GetAllJobs$QueryRoot$JobsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllJobs$QueryRoot with EquatableMixin {
  GetAllJobs$QueryRoot();

  factory GetAllJobs$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetAllJobs$QueryRootFromJson(json);

  List<GetAllJobs$QueryRoot$Jobs> jobs;

  @override
  List<Object> get props => [jobs];
  Map<String, dynamic> toJson() => _$GetAllJobs$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOpenShift$MutationRoot$InsertOpenShifts$Returning
    with EquatableMixin {
  CreateOpenShift$MutationRoot$InsertOpenShifts$Returning();

  factory CreateOpenShift$MutationRoot$InsertOpenShifts$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$CreateOpenShift$MutationRoot$InsertOpenShifts$ReturningFromJson(json);

  @JsonKey(name: 'open_shifts_id')
  String openShiftsId;

  @override
  List<Object> get props => [openShiftsId];
  Map<String, dynamic> toJson() =>
      _$CreateOpenShift$MutationRoot$InsertOpenShifts$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOpenShift$MutationRoot$InsertOpenShifts with EquatableMixin {
  CreateOpenShift$MutationRoot$InsertOpenShifts();

  factory CreateOpenShift$MutationRoot$InsertOpenShifts.fromJson(
          Map<String, dynamic> json) =>
      _$CreateOpenShift$MutationRoot$InsertOpenShiftsFromJson(json);

  @JsonKey(name: 'affected_rows')
  int affectedRows;

  List<CreateOpenShift$MutationRoot$InsertOpenShifts$Returning> returning;

  @override
  List<Object> get props => [affectedRows, returning];
  Map<String, dynamic> toJson() =>
      _$CreateOpenShift$MutationRoot$InsertOpenShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOpenShift$MutationRoot with EquatableMixin {
  CreateOpenShift$MutationRoot();

  factory CreateOpenShift$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$CreateOpenShift$MutationRootFromJson(json);

  @JsonKey(name: 'insert_open_shifts')
  CreateOpenShift$MutationRoot$InsertOpenShifts insertOpenShifts;

  @override
  List<Object> get props => [insertOpenShifts];
  Map<String, dynamic> toJson() => _$CreateOpenShift$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllOpenShifts$QueryRoot$OpenShifts$Shift$Job with EquatableMixin {
  GetAllOpenShifts$QueryRoot$OpenShifts$Shift$Job();

  factory GetAllOpenShifts$QueryRoot$OpenShifts$Shift$Job.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllOpenShifts$QueryRoot$OpenShifts$Shift$JobFromJson(json);

  @JsonKey(name: 'is_contract')
  bool isContract;

  @JsonKey(name: 'is_fulltime')
  bool isFulltime;

  @JsonKey(name: 'is_parttime')
  bool isParttime;

  @JsonKey(name: 'job_description')
  String jobDescription;

  @JsonKey(name: 'job_id')
  int jobId;

  @JsonKey(name: 'job_location')
  String jobLocation;

  @JsonKey(name: 'job_logo')
  String jobLogo;

  @JsonKey(name: 'job_name')
  String jobName;

  @JsonKey(name: 'job_qualifications')
  String jobQualifications;

  @JsonKey(name: 'job_responsibilities')
  String jobResponsibilities;

  @JsonKey(name: 'job_salary')
  String jobSalary;

  @override
  List<Object> get props => [
        isContract,
        isFulltime,
        isParttime,
        jobDescription,
        jobId,
        jobLocation,
        jobLogo,
        jobName,
        jobQualifications,
        jobResponsibilities,
        jobSalary
      ];
  Map<String, dynamic> toJson() =>
      _$GetAllOpenShifts$QueryRoot$OpenShifts$Shift$JobToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllOpenShifts$QueryRoot$OpenShifts$Shift with EquatableMixin {
  GetAllOpenShifts$QueryRoot$OpenShifts$Shift();

  factory GetAllOpenShifts$QueryRoot$OpenShifts$Shift.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllOpenShifts$QueryRoot$OpenShifts$ShiftFromJson(json);

  @JsonKey(name: 'shift_time')
  String shiftTime;

  @JsonKey(name: 'shift_notes')
  String shiftNotes;

  @JsonKey(name: 'shift_name')
  String shiftName;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_date')
  DateTime shiftDate;

  @JsonKey(name: 'job_id')
  int jobId;

  GetAllOpenShifts$QueryRoot$OpenShifts$Shift$Job job;

  @override
  List<Object> get props =>
      [shiftTime, shiftNotes, shiftName, shiftId, shiftDate, jobId, job];
  Map<String, dynamic> toJson() =>
      _$GetAllOpenShifts$QueryRoot$OpenShifts$ShiftToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllOpenShifts$QueryRoot$OpenShifts with EquatableMixin {
  GetAllOpenShifts$QueryRoot$OpenShifts();

  factory GetAllOpenShifts$QueryRoot$OpenShifts.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllOpenShifts$QueryRoot$OpenShiftsFromJson(json);

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'open_shifts_id')
  String openShiftsId;

  GetAllOpenShifts$QueryRoot$OpenShifts$Shift shift;

  @override
  List<Object> get props => [shiftId, openShiftsId, shift];
  Map<String, dynamic> toJson() =>
      _$GetAllOpenShifts$QueryRoot$OpenShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllOpenShifts$QueryRoot with EquatableMixin {
  GetAllOpenShifts$QueryRoot();

  factory GetAllOpenShifts$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetAllOpenShifts$QueryRootFromJson(json);

  @JsonKey(name: 'open_shifts')
  List<GetAllOpenShifts$QueryRoot$OpenShifts> openShifts;

  @override
  List<Object> get props => [openShifts];
  Map<String, dynamic> toJson() => _$GetAllOpenShifts$QueryRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteOpenShift$MutationRoot$DeleteOpenShifts with EquatableMixin {
  DeleteOpenShift$MutationRoot$DeleteOpenShifts();

  factory DeleteOpenShift$MutationRoot$DeleteOpenShifts.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteOpenShift$MutationRoot$DeleteOpenShiftsFromJson(json);

  @JsonKey(name: 'affected_rows')
  int affectedRows;

  @override
  List<Object> get props => [affectedRows];
  Map<String, dynamic> toJson() =>
      _$DeleteOpenShift$MutationRoot$DeleteOpenShiftsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteOpenShift$MutationRoot with EquatableMixin {
  DeleteOpenShift$MutationRoot();

  factory DeleteOpenShift$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$DeleteOpenShift$MutationRootFromJson(json);

  @JsonKey(name: 'delete_open_shifts')
  DeleteOpenShift$MutationRoot$DeleteOpenShifts deleteOpenShifts;

  @override
  List<Object> get props => [deleteOpenShifts];
  Map<String, dynamic> toJson() => _$DeleteOpenShift$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateActivity$MutationRoot$UpdateActivities$Returning
    with EquatableMixin {
  UpdateActivity$MutationRoot$UpdateActivities$Returning();

  factory UpdateActivity$MutationRoot$UpdateActivities$Returning.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateActivity$MutationRoot$UpdateActivities$ReturningFromJson(json);

  @JsonKey(name: 'shift_endtime')
  String shiftEndtime;

  @JsonKey(name: 'shift_starttime')
  String shiftStarttime;

  @override
  List<Object> get props => [shiftEndtime, shiftStarttime];
  Map<String, dynamic> toJson() =>
      _$UpdateActivity$MutationRoot$UpdateActivities$ReturningToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateActivity$MutationRoot$UpdateActivities with EquatableMixin {
  UpdateActivity$MutationRoot$UpdateActivities();

  factory UpdateActivity$MutationRoot$UpdateActivities.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateActivity$MutationRoot$UpdateActivitiesFromJson(json);

  List<UpdateActivity$MutationRoot$UpdateActivities$Returning> returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$UpdateActivity$MutationRoot$UpdateActivitiesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateActivity$MutationRoot with EquatableMixin {
  UpdateActivity$MutationRoot();

  factory UpdateActivity$MutationRoot.fromJson(Map<String, dynamic> json) =>
      _$UpdateActivity$MutationRootFromJson(json);

  @JsonKey(name: 'update_activities')
  UpdateActivity$MutationRoot$UpdateActivities updateActivities;

  @override
  List<Object> get props => [updateActivities];
  Map<String, dynamic> toJson() => _$UpdateActivity$MutationRootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllActivities$QueryRoot$Activities$Shift with EquatableMixin {
  GetAllActivities$QueryRoot$Activities$Shift();

  factory GetAllActivities$QueryRoot$Activities$Shift.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllActivities$QueryRoot$Activities$ShiftFromJson(json);

  @JsonKey(name: 'shift_date')
  DateTime shiftDate;

  @JsonKey(name: 'shift_name')
  String shiftName;

  @JsonKey(name: 'shift_notes')
  String shiftNotes;

  @JsonKey(name: 'shift_time')
  String shiftTime;

  @override
  List<Object> get props => [shiftDate, shiftName, shiftNotes, shiftTime];
  Map<String, dynamic> toJson() =>
      _$GetAllActivities$QueryRoot$Activities$ShiftToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllActivities$QueryRoot$Activities with EquatableMixin {
  GetAllActivities$QueryRoot$Activities();

  factory GetAllActivities$QueryRoot$Activities.fromJson(
          Map<String, dynamic> json) =>
      _$GetAllActivities$QueryRoot$ActivitiesFromJson(json);

  @JsonKey(name: 'activity_id')
  String activityId;

  @JsonKey(name: 'is_accepted')
  bool isAccepted;

  @JsonKey(name: 'is_completed')
  bool isCompleted;

  @JsonKey(name: 'shift_endtime')
  String shiftEndtime;

  @JsonKey(name: 'shift_id')
  int shiftId;

  @JsonKey(name: 'shift_starttime')
  String shiftStarttime;

  GetAllActivities$QueryRoot$Activities$Shift shift;

  @override
  List<Object> get props => [
        activityId,
        isAccepted,
        isCompleted,
        shiftEndtime,
        shiftId,
        shiftStarttime,
        shift
      ];
  Map<String, dynamic> toJson() =>
      _$GetAllActivities$QueryRoot$ActivitiesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAllActivities$QueryRoot with EquatableMixin {
  GetAllActivities$QueryRoot();

  factory GetAllActivities$QueryRoot.fromJson(Map<String, dynamic> json) =>
      _$GetAllActivities$QueryRootFromJson(json);

  List<GetAllActivities$QueryRoot$Activities> activities;

  @override
  List<Object> get props => [activities];
  Map<String, dynamic> toJson() => _$GetAllActivities$QueryRootToJson(this);
}

enum ActivitiesConstraint {
  @JsonValue('activities_activity_id_key')
  activitiesActivityIdKey,
  @JsonValue('activities_pkey')
  activitiesPkey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ActivitiesUpdateColumn {
  @JsonValue('activity_id')
  activityId,
  @JsonValue('is_accepted')
  isAccepted,
  @JsonValue('is_completed')
  isCompleted,
  @JsonValue('shift_endtime')
  shiftEndtime,
  @JsonValue('shift_id')
  shiftId,
  @JsonValue('shift_starttime')
  shiftStarttime,
  @JsonValue('user_id')
  userId,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ClosedShiftsConstraint {
  @JsonValue('closed_shifts_closed_shifts_id_key')
  closedShiftsClosedShiftsIdKey,
  @JsonValue('closed_shifts_pkey')
  closedShiftsPkey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ClosedShiftsUpdateColumn {
  @JsonValue('closed_shifts_id')
  closedShiftsId,
  @JsonValue('shift_id')
  shiftId,
  @JsonValue('user_id')
  userId,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum DocumentsConstraint {
  @JsonValue('documents_document_id_key')
  documentsDocumentIdKey,
  @JsonValue('documents_pkey')
  documentsPkey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum DocumentsUpdateColumn {
  @JsonValue('document_id')
  documentId,
  @JsonValue('document_name')
  documentName,
  @JsonValue('document_url')
  documentUrl,
  @JsonValue('user_id')
  userId,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum JobsConstraint {
  @JsonValue('jobs_pkey')
  jobsPkey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum JobsUpdateColumn {
  @JsonValue('is_contract')
  isContract,
  @JsonValue('is_fulltime')
  isFulltime,
  @JsonValue('is_parttime')
  isParttime,
  @JsonValue('job_description')
  jobDescription,
  @JsonValue('job_id')
  jobId,
  @JsonValue('job_location')
  jobLocation,
  @JsonValue('job_logo')
  jobLogo,
  @JsonValue('job_name')
  jobName,
  @JsonValue('job_qualifications')
  jobQualifications,
  @JsonValue('job_responsibilities')
  jobResponsibilities,
  @JsonValue('job_salary')
  jobSalary,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum OpenShiftsConstraint {
  @JsonValue('open_shifts_open_shifts_id_key')
  openShiftsOpenShiftsIdKey,
  @JsonValue('open_shifts_pkey')
  openShiftsPkey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum OpenShiftsUpdateColumn {
  @JsonValue('open_shifts_id')
  openShiftsId,
  @JsonValue('shift_id')
  shiftId,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ShiftsConstraint {
  @JsonValue('shifts_pkey')
  shiftsPkey,
  @JsonValue('shifts_shift_id_key')
  shiftsShiftIdKey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ShiftsUpdateColumn {
  @JsonValue('job_id')
  jobId,
  @JsonValue('shift_date')
  shiftDate,
  @JsonValue('shift_id')
  shiftId,
  @JsonValue('shift_name')
  shiftName,
  @JsonValue('shift_notes')
  shiftNotes,
  @JsonValue('shift_time')
  shiftTime,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum UsersConstraint {
  @JsonValue('users_email_address_key')
  usersEmailAddressKey,
  @JsonValue('users_pkey')
  usersPkey,
  @JsonValue('users_user_id_key')
  usersUserIdKey,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum UsersUpdateColumn {
  @JsonValue('contact_number')
  contactNumber,
  @JsonValue('email_address')
  emailAddress,
  @JsonValue('first_name')
  firstName,
  @JsonValue('home_address')
  homeAddress,
  @JsonValue('last_name')
  lastName,
  @JsonValue('profile_pic')
  profilePic,
  @JsonValue('user_id')
  userId,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class CreateActivityArguments extends JsonSerializable with EquatableMixin {
  CreateActivityArguments(
      {@required this.activityId,
      @required this.shiftId,
      @required this.userId,
      this.isAccepted});

  @override
  factory CreateActivityArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateActivityArgumentsFromJson(json);

  final String activityId;

  final int shiftId;

  final String userId;

  final bool isAccepted;

  @override
  List<Object> get props => [activityId, shiftId, userId, isAccepted];
  @override
  Map<String, dynamic> toJson() => _$CreateActivityArgumentsToJson(this);
}

class CreateActivityMutation
    extends GraphQLQuery<CreateActivity$MutationRoot, CreateActivityArguments> {
  CreateActivityMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateActivity'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'activityId')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'shiftId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'userId')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'isAccepted')),
              type: NamedTypeNode(
                  name: NameNode(value: 'Boolean'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_activities_one'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'object'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'activity_id'),
                          value: VariableNode(
                              name: NameNode(value: 'activityId'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'is_accepted'),
                          value: VariableNode(
                              name: NameNode(value: 'isAccepted'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'shift_id'),
                          value:
                              VariableNode(name: NameNode(value: 'shiftId'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'user_id'),
                          value: VariableNode(name: NameNode(value: 'userId')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'activity_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateActivity';

  @override
  final CreateActivityArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateActivity$MutationRoot parse(Map<String, dynamic> json) =>
      CreateActivity$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateClosedShiftArguments extends JsonSerializable with EquatableMixin {
  CreateClosedShiftArguments({@required this.input});

  @override
  factory CreateClosedShiftArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateClosedShiftArgumentsFromJson(json);

  final ClosedShiftsInsertInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateClosedShiftArgumentsToJson(this);
}

class CreateClosedShiftMutation extends GraphQLQuery<
    CreateClosedShift$MutationRoot, CreateClosedShiftArguments> {
  CreateClosedShiftMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateClosedShift'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'closed_shifts_insert_input'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_closed_shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ListValueNode(
                        values: [VariableNode(name: NameNode(value: 'input'))]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'closed_shifts_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateClosedShift';

  @override
  final CreateClosedShiftArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateClosedShift$MutationRoot parse(Map<String, dynamic> json) =>
      CreateClosedShift$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateJobsArguments extends JsonSerializable with EquatableMixin {
  CreateJobsArguments({@required this.input});

  @override
  factory CreateJobsArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateJobsArgumentsFromJson(json);

  final JobsInsertInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateJobsArgumentsToJson(this);
}

class CreateJobsMutation
    extends GraphQLQuery<CreateJobs$MutationRoot, CreateJobsArguments> {
  CreateJobsMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateJobs'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'jobs_insert_input'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_jobs'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ListValueNode(
                        values: [VariableNode(name: NameNode(value: 'input'))]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'job_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateJobs';

  @override
  final CreateJobsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateJobs$MutationRoot parse(Map<String, dynamic> json) =>
      CreateJobs$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateShiftsArguments extends JsonSerializable with EquatableMixin {
  CreateShiftsArguments({@required this.input});

  @override
  factory CreateShiftsArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateShiftsArgumentsFromJson(json);

  final ShiftsInsertInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateShiftsArgumentsToJson(this);
}

class CreateShiftsMutation
    extends GraphQLQuery<CreateShifts$MutationRoot, CreateShiftsArguments> {
  CreateShiftsMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateShifts'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'shifts_insert_input'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ListValueNode(
                        values: [VariableNode(name: NameNode(value: 'input'))]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'shift_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateShifts';

  @override
  final CreateShiftsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateShifts$MutationRoot parse(Map<String, dynamic> json) =>
      CreateShifts$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetShitsByIdArguments extends JsonSerializable with EquatableMixin {
  GetShitsByIdArguments({@required this.id});

  @override
  factory GetShitsByIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetShitsByIdArgumentsFromJson(json);

  final int id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetShitsByIdArgumentsToJson(this);
}

class GetShitsByIdQuery
    extends GraphQLQuery<GetShitsById$QueryRoot, GetShitsByIdArguments> {
  GetShitsByIdQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetShitsById'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'shift_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'id')))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'job_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_date'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_notes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_time'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetShitsById';

  @override
  final GetShitsByIdArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetShitsById$QueryRoot parse(Map<String, dynamic> json) =>
      GetShitsById$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments({@required this.input, @required this.id});

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  final UsersSetInput input;

  final String id;

  @override
  List<Object> get props => [input, id];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$MutationRoot, UpdateUserArguments> {
  UpdateUserMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'UpdateUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'users_set_input'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'update_users'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'user_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'id')))
                          ]))
                    ])),
                ArgumentNode(
                    name: NameNode(value: '_set'),
                    value: VariableNode(name: NameNode(value: 'input')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'first_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'contact_number'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'home_address'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'email_address'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'last_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'profile_pic'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'user_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'UpdateUser';

  @override
  final UpdateUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateUser$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateUser$MutationRoot.fromJson(json);
}

class CurrentUserQuery
    extends GraphQLQuery<CurrentUser$QueryRoot, JsonSerializable> {
  CurrentUserQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'CurrentUser'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'users'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'user_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'documents'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'document_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'document_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'document_url'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'activities'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'activity_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'is_accepted'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'is_completed'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_endtime'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_starttime'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ])),
                FieldNode(
                    name: NameNode(value: 'first_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'last_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'contact_number'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email_address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'home_address'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'profile_pic'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CurrentUser';

  @override
  List<Object> get props => [document, operationName];
  @override
  CurrentUser$QueryRoot parse(Map<String, dynamic> json) =>
      CurrentUser$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateUserArguments extends JsonSerializable with EquatableMixin {
  CreateUserArguments({@required this.input});

  @override
  factory CreateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateUserArgumentsFromJson(json);

  final UsersInsertInput input;

  @override
  List<Object> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateUserArgumentsToJson(this);
}

class CreateUserMutation
    extends GraphQLQuery<CreateUser$MutationRoot, CreateUserArguments> {
  CreateUserMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateUser'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'input')),
              type: NamedTypeNode(
                  name: NameNode(value: 'users_insert_input'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_users'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ListValueNode(
                        values: [VariableNode(name: NameNode(value: 'input'))]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'contact_number'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateUser';

  @override
  final CreateUserArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateUser$MutationRoot parse(Map<String, dynamic> json) =>
      CreateUser$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteClosedShiftArguments extends JsonSerializable with EquatableMixin {
  DeleteClosedShiftArguments({this.id});

  @override
  factory DeleteClosedShiftArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteClosedShiftArgumentsFromJson(json);

  final int id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteClosedShiftArgumentsToJson(this);
}

class DeleteClosedShiftMutation extends GraphQLQuery<
    DeleteClosedShift$MutationRoot, DeleteClosedShiftArguments> {
  DeleteClosedShiftMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'DeleteClosedShift'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'delete_closed_shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'closed_shifts_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'id')))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'affected_rows'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'DeleteClosedShift';

  @override
  final DeleteClosedShiftArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  DeleteClosedShift$MutationRoot parse(Map<String, dynamic> json) =>
      DeleteClosedShift$MutationRoot.fromJson(json);
}

class GetAllClosedShiftsQuery
    extends GraphQLQuery<GetAllClosedShifts$QueryRoot, JsonSerializable> {
  GetAllClosedShiftsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetAllClosedShifts'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'closed_shifts'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'closed_shifts_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'shift_date'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_notes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_time'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'job'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'is_contract'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'is_fulltime'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'is_parttime'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_description'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_logo'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_location'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_qualifications'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_responsibilities'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_salary'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetAllClosedShifts';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetAllClosedShifts$QueryRoot parse(Map<String, dynamic> json) =>
      GetAllClosedShifts$QueryRoot.fromJson(json);
}

class GetAllJobsQuery
    extends GraphQLQuery<GetAllJobs$QueryRoot, JsonSerializable> {
  GetAllJobsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetAllJobs'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'jobs'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'is_contract'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_fulltime'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_parttime'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_description'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_location'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_logo'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_qualifications'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_responsibilities'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'job_salary'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetAllJobs';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetAllJobs$QueryRoot parse(Map<String, dynamic> json) =>
      GetAllJobs$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateOpenShiftArguments extends JsonSerializable with EquatableMixin {
  CreateOpenShiftArguments({@required this.openShiftId, this.shiftId});

  @override
  factory CreateOpenShiftArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateOpenShiftArgumentsFromJson(json);

  final String openShiftId;

  final int shiftId;

  @override
  List<Object> get props => [openShiftId, shiftId];
  @override
  Map<String, dynamic> toJson() => _$CreateOpenShiftArgumentsToJson(this);
}

class CreateOpenShiftMutation extends GraphQLQuery<CreateOpenShift$MutationRoot,
    CreateOpenShiftArguments> {
  CreateOpenShiftMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'CreateOpenShift'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'openShiftId')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'shiftId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_open_shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'open_shifts_id'),
                          value: VariableNode(
                              name: NameNode(value: 'openShiftId'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'shift_id'),
                          value: VariableNode(name: NameNode(value: 'shiftId')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'affected_rows'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'open_shifts_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'CreateOpenShift';

  @override
  final CreateOpenShiftArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateOpenShift$MutationRoot parse(Map<String, dynamic> json) =>
      CreateOpenShift$MutationRoot.fromJson(json);
}

class GetAllOpenShiftsQuery
    extends GraphQLQuery<GetAllOpenShifts$QueryRoot, JsonSerializable> {
  GetAllOpenShiftsQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetAllOpenShifts'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'open_shifts'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'shift_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'open_shifts_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'shift_time'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_notes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_date'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'job_id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'job'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'is_contract'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'is_fulltime'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'is_parttime'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_description'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_location'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_logo'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_qualifications'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_responsibilities'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'job_salary'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetAllOpenShifts';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetAllOpenShifts$QueryRoot parse(Map<String, dynamic> json) =>
      GetAllOpenShifts$QueryRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteOpenShiftArguments extends JsonSerializable with EquatableMixin {
  DeleteOpenShiftArguments({this.id});

  @override
  factory DeleteOpenShiftArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteOpenShiftArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteOpenShiftArgumentsToJson(this);
}

class DeleteOpenShiftMutation extends GraphQLQuery<DeleteOpenShift$MutationRoot,
    DeleteOpenShiftArguments> {
  DeleteOpenShiftMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'DeleteOpenShift'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'delete_open_shifts'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'open_shifts_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'id')))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'affected_rows'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'DeleteOpenShift';

  @override
  final DeleteOpenShiftArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  DeleteOpenShift$MutationRoot parse(Map<String, dynamic> json) =>
      DeleteOpenShift$MutationRoot.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateActivityArguments extends JsonSerializable with EquatableMixin {
  UpdateActivityArguments({@required this.id, this.starttime, this.endtime});

  @override
  factory UpdateActivityArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateActivityArgumentsFromJson(json);

  final String id;

  final String starttime;

  final String endtime;

  @override
  List<Object> get props => [id, starttime, endtime];
  @override
  Map<String, dynamic> toJson() => _$UpdateActivityArgumentsToJson(this);
}

class UpdateActivityMutation
    extends GraphQLQuery<UpdateActivity$MutationRoot, UpdateActivityArguments> {
  UpdateActivityMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'UpdateActivity'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'starttime')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'endtime')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'update_activities'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'activity_id'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'id')))
                          ]))
                    ])),
                ArgumentNode(
                    name: NameNode(value: '_set'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'is_completed'),
                          value: BooleanValueNode(value: true)),
                      ObjectFieldNode(
                          name: NameNode(value: 'shift_starttime'),
                          value:
                              VariableNode(name: NameNode(value: 'starttime'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'shift_endtime'),
                          value: VariableNode(name: NameNode(value: 'endtime')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'shift_endtime'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_starttime'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'UpdateActivity';

  @override
  final UpdateActivityArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateActivity$MutationRoot parse(Map<String, dynamic> json) =>
      UpdateActivity$MutationRoot.fromJson(json);
}

class GetAllActivitiesQuery
    extends GraphQLQuery<GetAllActivities$QueryRoot, JsonSerializable> {
  GetAllActivitiesQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'GetAllActivities'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'activities'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'activity_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_accepted'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'is_completed'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_endtime'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift_starttime'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'shift'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'shift_date'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_name'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_notes'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'shift_time'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'GetAllActivities';

  @override
  List<Object> get props => [document, operationName];
  @override
  GetAllActivities$QueryRoot parse(Map<String, dynamic> json) =>
      GetAllActivities$QueryRoot.fromJson(json);
}
