import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 0)
class ScheduleModel extends HiveObject {
  @HiveField(0)
  String fieldName;
  @HiveField(1)
  String username;
  @HiveField(2)
  String rainProbability;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  String fieldId;

  ScheduleModel({
    required this.fieldName,
    required this.username,
    required this.rainProbability,
    required this.date,
    required this.fieldId,
  });
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      fieldName: json['fieldName'] as String,
      username: json['username'] as String,
      rainProbability: json['rainProbability'] as String,
      date: DateTime.parse(json['date'] as String),
      fieldId: json['fieldId'] as String,
    );
  }

  String get id => '$fieldId-$date-$username';
}

extension ScheduleModelJson on ScheduleModel {
  Map<String, dynamic> toJson() {
    return {
      'fieldName': fieldName,
      'username': username,
      'rainProbability': rainProbability,
      'date': date.toIso8601String(),
      'fieldId': fieldId,
    };
  }
}
