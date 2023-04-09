class BulkRoutingResult {
  BulkRoutingResult.fromJson(Map<String, dynamic> json)
      : projectId = json['projectId'] as int,
        jobVisitId = json['jobVisitId'] as int,
        visitStatusId = json['visitStatusId'] as int,
        jobTypeId = json['jobTypeId'] as int,
        jobId = json['jobId'] as int,
        jobNumber = json['jobNumber'] as int,
        jobPoints = json['jobPoints'] as int,
        siteId = json['siteId'] as int,
        projectRegionId = json['projectRegionId'] as int,
        mapDisplayMode = json['mapDisplayMode'] as int?,
        timeSlotId = json['timeSlotId'] as int?,
        jobTypeCode = json['jobTypeCode'] as String,
        jobStatusCode = json['jobStatusCode'] as String?,
        subRegionDesc = json['subRegionDesc'] as String?,
        zoneCodeName = json['zoneCodeName'] as String?,
        suburb = json['suburb'] as String?,
        jobStatusType = json['jobStatusType'] as String?,
        clientJobNumber = json['clientJobNumber'] as String,
        siteInfo = json['siteInfo'] as String?,
        bookedTimeSlot = json['bookedTimeSlot'] as String?,
        fullName = json['fullName'] as String?,
        locationName = json['locationName'] as String?,
        multiport = json['multiport'] as String?,
        reasonDesc = json['reasonDesc'] as String?,
        fdh = json['fdh'] as String?,
        fda = json['fda'] as String?,
        fsam = json['fsam'] as String?,
        streetAddressThenNumbers = json['streetAddressThenNumbers'] as String?,
        simpleAddress = json['simpleAddress'] as String?,
        leadWorkerName = json['leadWorkerName'] as String?,
        priority = json['priority'] as String?,
        customerLastName = json['customerLastName'] as String?,
        custMarkerColor = json['custMarkerColor'] as String?,
        warehouseMarkerColor = json['warehouseMarkerColor'] as String?,
        jobSourceDesc = json['jobSourceDesc'] as String?,
        siteState = json['siteState'] as String?,
        siteName = json['siteName'] as String?,
        clientRefNo = json['clientRefNo'] as String?,
        clientVisitNumber = json['clientVisitNumber'] as String?,
        jobField1 = json['jobField1'] as String?,
        jobField2 = json['jobField2'] as String?,
        jobField4 = json['jobField4'] as String?,
        jobField5 = json['jobField5'] as String?,
        jobField16 = json['jobField16'] as String?,
        jobField18 = json['jobField18'] as String?,
        tow = json['tow'] as String?,
        locId = json['locId'] as String?,
        assetIdConduit = json['assetIdConduit'] as String?,
        startNode = json['startNode'] as String?,
        endNode = json['endNode'] as String?,
        nao = json['nao'] as String?,
        state = json['state'] as String?,
        restrictRouting = json['restrictRouting'] as bool?,
        nbnProceedOnHeld = json['nbnProceedOnHeld'] as bool?,
        flexibleScheduling = json['flexibleScheduling'] as bool?,
        jobCheck1 = json['jobCheck1'] as bool?,
        jobCheck7 = json['jobCheck7'] as bool?,
        jobCheck8 = json['jobCheck8'] as bool?,
        dbyd = json['dbyd'] as bool?,
        dbydRequested = json['dbydRequested'] as bool?,
        latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?,
        warehouseLatitude = json['warehouseLatitude'] as double?,
        warehouseLongitude = json['warehouseLongitude'] as double?,
        pabdate = json['pabdate'] != null
            ? DateTime.parse(
                json['pabdate'] as String,
              )
            : null,
        requestDate = json['requestDate'] != null
            ? DateTime.parse(
                json['requestDate'] as String,
              )
            : null,
        requestDateStart = json['requestDateStart'] != null
            ? DateTime.parse(
                json['requestDateStart'] as String,
              )
            : null,
        dateCreated = DateTime.parse(json['dateCreated'] as String),
        startTime = json['startTime'] != null
            ? DateTime.parse(
                json['startTime'] as String,
              )
            : null,
        completedDate = json['completedDate'] != null
            ? DateTime.parse(
                json['completedDate'] as String,
              )
            : null,
        finishTime = json['finishTime'] != null
            ? DateTime.parse(
                json['finishTime'] as String,
              )
            : null,
        bookedDate = json['bookedDate'] != null
            ? DateTime.parse(
                json['bookedDate'] as String,
              )
            : null,
        startDate = json['startDate'] != null
            ? DateTime.parse(
                json['startDate'] as String,
              )
            : null,
        endDate = json['startDate'] != null
            ? DateTime.parse(
                json['endDate'] as String,
              )
            : null,
        jobVisitField18 = json['jobVisitField18'] as String?,
        dateFirstRouted = json['dateFirstRouted'] != null
            ? DateTime.parse(
                json['dateFirstRouted'] as String,
              )
            : null,
        postInstallCallAttempts = json['postInstallCallAttempts'] as int?,
        postInstallCallCompleted = json['postInstallCallCompleted'] as bool?,
        preInstallCallAttempts = json['preInstallCallAttempts'] as int?,
        preInstallCallCompleted = json['preInstallCallCompleted'] as bool?,
        performPic = json['performPic'] as bool?,
        sendSMSPic = json['sendSMSPic'] as int?;

  int projectId;
  int jobVisitId;
  int visitStatusId;
  int jobTypeId;
  int jobId;
  int jobNumber;
  int jobPoints;
  int siteId;
  int? projectRegionId;
  int? mapDisplayMode;
  int? timeSlotId;

  // String data-type
  String jobTypeCode;
  String? jobStatusCode;
  String? subRegionDesc;
  String? zoneCodeName;
  String? suburb;
  String? jobStatusType;
  String clientJobNumber;
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
  double? latitude;
  double? longitude;
  double? warehouseLatitude;
  double? warehouseLongitude;

  // DateTime data-type
  DateTime? pabdate;
  DateTime? requestDate;
  DateTime? requestDateStart;
  DateTime dateCreated;
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
}
