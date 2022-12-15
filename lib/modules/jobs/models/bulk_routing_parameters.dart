import 'package:tech2/interfaces/has_map.dart';

class BulkRoutingParameters implements Mappable {
  int workerId;
  List<int> projectRegionId;
  List<int> subRegionId;
  List<String> jobStatusType;
  DateTime startDate;
  DateTime endDate;
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
