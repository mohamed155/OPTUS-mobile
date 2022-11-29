import 'package:tech2/interfaces/has_map.dart';

class BulkRoutingParameters implements Mappable {
  late int workerId;
  late List<int> projectRegionId;
  late List<int> subRegionId;
  late List<String> jobStatusType;
  late DateTime startDate;
  late DateTime endDate;
  bool includeUnreleased = false;
  bool includeNoDate = true;
  bool limitedUser = false;

  BulkRoutingParameters(
      this.workerId,
      this.projectRegionId,
      this.subRegionId,
      this.jobStatusType,
      this.startDate,
      this.endDate,
      this.includeUnreleased,
      this.includeNoDate,
      this.limitedUser);

  factory BulkRoutingParameters.fromJson(Map<String, dynamic> json) {
    return BulkRoutingParameters(
        json['workerId'],
        json['projectRegionId'],
        json['subRegionId'],
        json['jobStatusType'],
        json['startDate'],
        json['endDate'],
        json['includeUnreleased'],
        json['includeNoDate'],
        json['limitedUser']);
  }

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
