import 'package:tech2/enums/send_sms_pic.dart';

class BulkRoutingResult {
  late int projectId;
  late int jobVisitId;
  late int visitStatusId;
  late int jobTypeId;
  late int jobId;
  late int jobNumber;
  late int jobPoints;
  late int siteId;
  int? projectRegionId;
  late int mapDisplayMode;
  int? timeSlotId;

  // String data-type
  String jobTypeCode;
  String? jobStatusCode;
  String? subRegionDesc;
  String? zoneCodeName;
  String? suburb;
  String? jobStatusType;
  late String clientJobNumber;
  String? siteInfo;
  String? bookedTimeSlot;
  String? fullName;
  String? locationName;
  String? multiport;
  String? reasonDesc;
  String? fdh;
  String? fda;
  String? fsam;
  String? streetAddressThenNumbers;
  String? simpleAddress;
  String? leadWorkerName;
  String? priority;
  String? customerLastName;
  String? custMarkerColor;
  String? warehouseMarkerColor;
  String? jobSourceDesc;
  String? siteState;
  String? siteName;
  String? clientRefNo;
  String? clientVisitNumber;
  String? jobField1;
  String? jobField2;
  String? jobField4;
  String? jobField5;
  String? jobField16;
  String? jobField18;
  String? tow;
  String? locId;
  String? assetIdConduit;
  String? startNode;
  String? endNode;
  String? nao;
  String? state;
  String? jobVisitField18;

  // Boolean data-type
  bool? restrictRouting;
  bool? nbnProceedOnHeld;
  bool? flexibleScheduling;
  bool? jobCheck1;
  bool? jobCheck7;
  bool? jobCheck8;
  bool? dbyd;
  bool? dbydRequested;

  // Double data-type
  late double latitude;
  late double longitude;
  double? warehouseLatitude;
  double? warehouseLongitude;

  // DateTime data-type
  DateTime? pabdate;
  DateTime? requestDate;
  DateTime? requestDateStart;
  late DateTime dateCreated;
  DateTime? startTime;
  DateTime? completedDate;
  DateTime? finishTime;
  DateTime? bookedDate;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? dateFirstRouted;

  // PIC
  int? postInstallCallAttempts;
  bool? postInstallCallCompleted;
  int? preInstallCallAttempts;
  bool? preInstallCallCompleted;
  bool? performPic;
  int? sendSMSPic;

  BulkRoutingResult(
      this.projectId,
      this.jobVisitId,
      this.visitStatusId,
      this.jobTypeId,
      this.jobId,
      this.jobNumber,
      this.jobPoints,
      this.siteId,
      this.projectRegionId,
      this.mapDisplayMode,
      this.timeSlotId,
      this.jobTypeCode,
      this.jobStatusCode,
      this.subRegionDesc,
      this.zoneCodeName,
      this.suburb,
      this.jobStatusType,
      this.clientJobNumber,
      this.siteInfo,
      this.bookedTimeSlot,
      this.fullName,
      this.locationName,
      this.multiport,
      this.reasonDesc,
      this.fdh,
      this.fda,
      this.fsam,
      this.streetAddressThenNumbers,
      this.simpleAddress,
      this.leadWorkerName,
      this.priority,
      this.customerLastName,
      this.custMarkerColor,
      this.warehouseMarkerColor,
      this.jobSourceDesc,
      this.siteState,
      this.siteName,
      this.clientRefNo,
      this.clientVisitNumber,
      this.jobField1,
      this.jobField2,
      this.jobField4,
      this.jobField5,
      this.jobField16,
      this.jobField18,
      this.tow,
      this.locId,
      this.assetIdConduit,
      this.startNode,
      this.endNode,
      this.nao,
      this.state,
      this.restrictRouting,
      this.nbnProceedOnHeld,
      this.flexibleScheduling,
      this.jobCheck1,
      this.jobCheck7,
      this.jobCheck8,
      this.dbyd,
      this.dbydRequested,
      this.latitude,
      this.longitude,
      this.warehouseLatitude,
      this.warehouseLongitude,
      this.pabdate,
      this.requestDate,
      this.requestDateStart,
      this.dateCreated,
      this.startTime,
      this.completedDate,
      this.finishTime,
      this.bookedDate,
      this.startDate,
      this.endDate,
      this.jobVisitField18,
      this.dateFirstRouted,
      this.postInstallCallAttempts,
      this.postInstallCallCompleted,
      this.preInstallCallAttempts,
      this.preInstallCallCompleted,
      this.performPic,
      this.sendSMSPic);

  factory BulkRoutingResult.fromJson(Map<String, dynamic> json) {
    return BulkRoutingResult(
        json['projectId'],
        json['jobVisitId'],
        json['visitStatusId'],
        json['jobTypeId'],
        json['jobId'],
        json['jobNumber'],
        json['jobPoints'],
        json['siteId'],
        json['projectRegionId'],
        json['mapDisplayMode'],
        json['timeSlotId'],
        json['jobTypeCode'],
        json['jobStatusCode'],
        json['subRegionDesc'],
        json['zoneCodeName'],
        json['suburb'],
        json['jobStatusType'],
        json['clientJobNumber'],
        json['siteInfo'],
        json['bookedTimeSlot'],
        json['fullName'],
        json['locationName'],
        json['multiport'],
        json['reasonDesc'],
        json['fdh'],
        json['fda'],
        json['fsam'],
        json['streetAddressThenNumbers'],
        json['simpleAddress'],
        json['leadWorkerName'],
        json['priority'],
        json['customerLastName'],
        json['custMarkerColor'],
        json['warehouseMarkerColor'],
        json['jobSourceDesc'],
        json['siteState'],
        json['siteName'],
        json['clientRefNo'],
        json['clientVisitNumber'],
        json['jobField1'],
        json['jobField2'],
        json['jobField4'],
        json['jobField5'],
        json['jobField16'],
        json['jobField18'],
        json['tow'],
        json['locId'],
        json['assetIdConduit'],
        json['startNode'],
        json['endNode'],
        json['nao'],
        json['state'],
        json['restrictRouting'],
        json['nbnProceedOnHeld'],
        json['flexibleScheduling'],
        json['jobCheck1'],
        json['jobCheck7'],
        json['jobCheck8'],
        json['dbyd'],
        json['dbydRequested'],
        json['latitude'],
        json['longitude'],
        json['warehouseLatitude'],
        json['warehouseLongitude'],
        json['pabdate'] != null ? DateTime.parse(json['pabdate']) : null,
        json['requestDate'] != null ? DateTime.parse(json['requestDate']) : null,
        json['requestDateStart'] != null ? DateTime.parse(json['requestDateStart']) : null,
        DateTime.parse(json['dateCreated']),
        json['startTime'] != null ? DateTime.parse(json['startTime']) : null,
        json['completedDate'] != null ? DateTime.parse(json['completedDate']) : null,
        json['finishTime'] != null ? DateTime.parse(json['finishTime']) : null,
        json['bookedDate'] != null ? DateTime.parse(json['bookedDate']) : null,
        json['startDate']  != null ? DateTime.parse(json['startDate']) : null,
        json['startDate']  != null ? DateTime.parse(json['endDate']) : null,
        json['jobVisitField18'],
        json['dateFirstRouted'] != null ? DateTime.parse(json['dateFirstRouted']) : null,
        json['postInstallCallAttempts'],
        json['postInstallCallCompleted'],
        json['preInstallCallAttempts'],
        json['preInstallCallCompleted'],
        json['performPic'],
        json['sendSMSPic']);
  }
}
