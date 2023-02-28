class JobStatusDto {
  JobStatusDto(Map<String, dynamic> json)
      : jobStatusId = json['jobStatusId'] as int,
        jobStatusCode = json['jobStatusCode'] as String,
        jobStatusDesc = json['jobStatusDesc'] as String,
        jobStatusType = json['jobStatusType'] as String,
        statusIdofJob = json['statusIdofJob'] as int,
        otdcode = json['otdcode'] as bool,
        okToPayCode = json['okToPayCode'] as bool,
        okToBillCode = json['okToBillCode'] as bool,
        compKpicode = json['compKpicode'] as bool,
        totalCompKpicode = json['totalCompKpicode'] as bool,
        ifcompKpicode = json['ifcompKpicode'] as bool,
        allowChangeInJobDetails = json['allowChangeInJobDetails'] as bool,
        discontinued = json['discontinued'] as bool,
        serverDate = DateTime.parse(json['serverDat'] as String);

  int jobStatusId;
  String jobStatusCode;
  String jobStatusDesc;
  String jobStatusType;
  int statusIdofJob;
  bool otdcode;
  bool okToPayCode;
  bool okToBillCode;
  bool compKpicode;
  bool totalCompKpicode;
  bool ifcompKpicode;
  bool allowChangeInJobDetails;
  bool discontinued;
  DateTime serverDate;
}
