import 'package:tech2/interfaces/has_map.dart';

class BulkRoutingParameters implements Mappable {
  BulkRoutingParameters(
    this.workerId,
    this.projectRegionId,
    this.subRegionId,
    this.jobStatusType,
    this.startDate,
    this.endDate, {
    required this.includeUnreleased,
    required this.includeNoDate,
    required this.limitedUser,
  });

  BulkRoutingParameters.fromJson(Map<String, dynamic> json)
      : workerId = json['workerId'] as int,
        projectRegionId = json['projectRegionId'] as List<int>,
        subRegionId = json['subRegionId'] as List<int>,
        jobStatusType = json['jobStatusType'] as List<String>,
        startDate = json['startDate'] as DateTime,
        endDate = json['endDate'] as DateTime,
        includeUnreleased = json['includeUnreleased'] as bool,
        includeNoDate = json['includeNoDate'] as bool,
        limitedUser = json['limitedUser'] as bool;

  int workerId;
  List<int> projectRegionId;
  List<int> subRegionId;
  List<String> jobStatusType;
  DateTime startDate;
  DateTime endDate;
  bool includeUnreleased = false;
  bool includeNoDate = true;
  bool limitedUser = false;

  @override
  Map<String, dynamic> toMap() {
    return {
      'workerId': workerId,
      'projectRegionId': projectRegionId,
      'subRegionId': subRegionId,
      'jobStatusType': jobStatusType,
      'startDate': startDate,
      'endDate': endDate,
      'includeUnreleased': includeUnreleased,
      'includeNoDate': includeNoDate,
      'limitedUser': limitedUser
    };
  }
}
