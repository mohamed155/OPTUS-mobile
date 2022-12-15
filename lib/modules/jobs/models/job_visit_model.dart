class JobVisitModel {
  JobDetailsDto jobDetailsDto;
  SiteDetailsDto siteDetailsDto;
  JobTypeDetailsDto jobTypeDetailsDto;
  ProjectDetailsDto projectDetailsDto;
  JobStatusDetailsDto jobStatusDetailsDto;
  JobClassDetailsDto jobClassDetailsDto;
  RegionDetailsDto regionDetailsDto;
  WorkerJobDetailsDto workerJobDetailsDto;
  JobVisitModelDetailsDto jobVisitModelDetailsDto;
  OriginalValuesDto originalValuesDto;

  // added
  String? lockClass;
  int? customerCreditInfoId;
  String? summaryLockMessage;
  String? lockMessage;
  String? bigStatus;
  int? sliceLockMessage = 5;
  DateTime? timeOfDayRunTime;
  String? status;

  // actual total
  String? fulfillmentTotal;
  String? equipmentTotal;
  String? jobTotalTextBox;

  // save job
  DateTime? firstCollectionDate;
  int? firstCollectionByWorkerId;
  String? firstCollectionWorkerName;
  DateTime? secondCollectionDate;
  int? secondCollectionByWorkerId;
  String? secondCollectionWorkerName;
  DateTime? collectionLetterDate;
  int? collectionLetterByWorkerId;
  String? collectionLetterWorkerName;
  DateTime? collectionAgencyDate;
  int? collectionAgencyByWorkerId;
  String? collectionAgencyWorkerName;
  DateTime? sendCollectionLetterDate;
  int? sendCollectionLetterByWorkerId;
  String? sendCollectionLetterByWorkerName;

  bool? isMissingPaymentAction;

  // Permission
  bool? oktobillallowed; // 81
  bool? jobEnterDiscount; // 99
  bool? jobDeleteConfirmedPayment; // 123
  bool? jobAllowLockOverride; // 175
  bool? jobPayRefundLessThan375;
  bool? jobPayRefundBetween375And750;
  bool? jobPayRefundGreaterThan750;
  bool? jobAllowReopenClosedCob;
  bool? jobLimitedUser;
  bool? jobCheckCollectionAgency;
  bool? jobUnClaimGeFinanceInvoice;
  bool? jobPayGeFinanceInvoice;
  bool? jobChargeToGeFinance;
  bool? crmEditStoreWarehouseDetails;
  bool? jobAddNegativeQuantity;
  bool? jobShowExpiredPromotions;
  bool? jobEditClientVisitNumber;
  bool? oktopayallowed;
  bool? jobChangeReasonCode;
  bool? jobTickSkipClaimPayment;
  bool? jobEditClientRefNumber;
  bool? jobPicCompletedOverride;
  bool? jobPicSmsSentOverride;
  bool? jobClearDirtyTow;
  bool? jobChangeNpsScore;
  bool? isUnlockJobVisit;

  SaveJobLogsReqDto? saveJobLogsReqDto;
  SavePicInformationReqDto? savePicInformationReqDto;

  bool? isSendSmsMissingPaymentCall;
  bool? isCheckFirstMissingPaymentCall;
  bool? isCheckSecondMissingPaymentCall;

  DateTime? jobOpenTime;

  String? customerEmail;
  String? customerMobile;

  bool? isCloseIssue;

  DateTime? lastUpdated;

  JobVisitModel(
      this.jobDetailsDto,
      this.siteDetailsDto,
      this.jobTypeDetailsDto,
      this.projectDetailsDto,
      this.jobStatusDetailsDto,
      this.jobClassDetailsDto,
      this.regionDetailsDto,
      this.workerJobDetailsDto,
      this.jobVisitModelDetailsDto,
      this.originalValuesDto,
      this.lockClass,
      this.customerCreditInfoId,
      this.summaryLockMessage,
      this.lockMessage,
      this.bigStatus,
      this.sliceLockMessage,
      this.timeOfDayRunTime,
      this.status,
      this.fulfillmentTotal,
      this.equipmentTotal,
      this.jobTotalTextBox,
      this.firstCollectionDate,
      this.firstCollectionByWorkerId,
      this.firstCollectionWorkerName,
      this.secondCollectionDate,
      this.secondCollectionByWorkerId,
      this.secondCollectionWorkerName,
      this.collectionLetterDate,
      this.collectionLetterByWorkerId,
      this.collectionLetterWorkerName,
      this.collectionAgencyDate,
      this.collectionAgencyByWorkerId,
      this.collectionAgencyWorkerName,
      this.sendCollectionLetterDate,
      this.sendCollectionLetterByWorkerId,
      this.sendCollectionLetterByWorkerName,
      this.isMissingPaymentAction,
      this.oktobillallowed,
      this.jobEnterDiscount,
      this.jobDeleteConfirmedPayment,
      this.jobAllowLockOverride,
      this.jobPayRefundLessThan375,
      this.jobPayRefundBetween375And750,
      this.jobPayRefundGreaterThan750,
      this.jobAllowReopenClosedCob,
      this.jobLimitedUser,
      this.jobCheckCollectionAgency,
      this.jobUnClaimGeFinanceInvoice,
      this.jobPayGeFinanceInvoice,
      this.jobChargeToGeFinance,
      this.crmEditStoreWarehouseDetails,
      this.jobAddNegativeQuantity,
      this.jobShowExpiredPromotions,
      this.jobEditClientVisitNumber,
      this.oktopayallowed,
      this.jobChangeReasonCode,
      this.jobTickSkipClaimPayment,
      this.jobEditClientRefNumber,
      this.jobPicCompletedOverride,
      this.jobPicSmsSentOverride,
      this.jobClearDirtyTow,
      this.jobChangeNpsScore,
      this.isUnlockJobVisit,
      this.saveJobLogsReqDto,
      this.savePicInformationReqDto,
      this.isSendSmsMissingPaymentCall,
      this.isCheckFirstMissingPaymentCall,
      this.isCheckSecondMissingPaymentCall,
      this.jobOpenTime,
      this.customerEmail,
      this.customerMobile,
      this.isCloseIssue,
      this.lastUpdated);

  factory JobVisitModel.fromJson(Map<String, dynamic> json) {
    return JobVisitModel(
        JobDetailsDto.fromJson(json['jobDetailsDto']),
        SiteDetailsDto.fromJson(json['siteDetailsDto']),
        JobTypeDetailsDto.fromJson(json['jobTypeDetailsDto']),
        ProjectDetailsDto.fromJson(json['projectDetailsDto']),
        JobStatusDetailsDto.fromJson(json['jobStatusDetailsDto']),
        JobClassDetailsDto.fromJson(json['jobClassDetailsDto']),
        RegionDetailsDto.fromJson(json['regionDetailsDto']),
        WorkerJobDetailsDto.fromJson(json['workerJobDetailsDto']),
        JobVisitModelDetailsDto.fromJson(json['jobVisitModelDetailsDto']),
        OriginalValuesDto.fromJson(json['originalValuesDto']),
        json['lockClass'],
        json['customerCreditInfoId'],
        json['summaryLockMessage'],
        json['lockMessage'],
        json['bigStatus'],
        json['sliceLockMessage'],
        json['timeOfDayRunTime'],
        json['status'],
        json['fulfillmentTotal'],
        json['equipmentTotal'],
        json['jobTotalTextBox'],
        json['firstCollectionDate'] != null ? DateTime.parse(json['firstCollectionDate']) : null,
        json['firstCollectionByWorkerId'],
        json['firstCollectionWorkerName'],
        json['secondCollectionDate'] != null ? DateTime.parse(json['secondCollectionDate']) : null,
        json['secondCollectionByWorkerId'],
        json['secondCollectionWorkerName'],
        json['collectionLetterDate'] != null ? DateTime.parse(json['collectionLetterDate']) : null,
        json['collectionLetterByWorkerId'],
        json['collectionLetterWorkerName'],
        json['collectionAgencyDate'] != null ? DateTime.parse(json['collectionAgencyDate']) : null,
        json['collectionAgencyByWorkerId'],
        json['collectionAgencyWorkerName'],
        json['sendCollectionLetterDate'] != null ? DateTime.parse(json['sendCollectionLetterDate']) : null,
        json['sendCollectionLetterByWorkerId'],
        json['sendCollectionLetterByWorkerName'],
        json['isMissingPaymentAction'],
        json['oktobillallowed'],
        json['jobEnterDiscount'],
        json['jobDeleteConfirmedPayment'],
        json['jobAllowLockOverride'],
        json['jobPayRefundLessThan375'],
        json['jobPayRefundBetween375And750'],
        json['jobPayRefundGreaterThan750'],
        json['jobAllowReopenClosedCob'],
        json['jobLimitedUser'],
        json['jobCheckCollectionAgency'],
        json['jobUnClaimGeFinanceInvoice'],
        json['jobPayGeFinanceInvoice'],
        json['jobChargeToGeFinance'],
        json['crmEditStoreWarehouseDetails'],
        json['jobAddNegativeQuantity'],
        json['jobShowExpiredPromotions'],
        json['jobEditClientVisitNumber'],
        json['oktopayallowed'],
        json['jobChangeReasonCode'],
        json['jobTickSkipClaimPayment'],
        json['jobEditClientRefNumber'],
        json['jobPicCompletedOverride'],
        json['jobPicSmsSentOverride'],
        json['jobClearDirtyTow'],
        json['jobChangeNpsScore'],
        json['isUnlockJobVisit'],
        json['saveJobLogsReqDto'] != null ? SaveJobLogsReqDto.fromJson(json['saveJobLogsReqDto']) : null,
        json['savePicInformationReqDto'] != null ? SavePicInformationReqDto.fromJson(json['savePicInformationReqDto']) : null,
        json['isSendSmsMissingPaymentCall'],
        json['isCheckFirstMissingPaymentCall'],
        json['isCheckSecondMissingPaymentCall'],
        json['jobOpenTime'] != null ? DateTime.parse(json['jobOpenTime']) : null,
        json['customerEmail'],
        json['customerMobile'],
        json['isCloseIssue'],
        json['lastUpdated'] != null ? DateTime.parse(json['lastUpdated']) : null);
  }
}

class JobDetailsDto {
  int? jobId;
  int? sourceCustomerId;
  int? jobSourceProductId;
  int? jobNumber;
  DateTime? cancelDate;
  String clientJobNumber;
  DateTime? completedDate;
  String? contactName;
  String? custContactName;
  String? custEmail;
  int? jobClassId;
  String? custContact1;
  String? custContact2;
  DateTime? requestDate;
  String? requestDateStr;
  String jobDesc;
  DateTime? followUpDate;
  DateTime? followUpTime;
  String? followUpTimeStr;
  String? followUpDateAndTime;
  int? jobSourceId;
  int? whlocationId;
  String? jobField1;
  String? hnSalesPerson;
  double? whDistance;
  String? contractNo;
  int? jobSaleWorkerId;
  String? jobSaleWorkerIdStr;
  String? clientRefNo;
  String? workerEmail;
  String? workerLeaderEmail;
  DateTime? quoteProvidedDate;
  int? npsScore;
  DateTime? fsdStartDate;
  DateTime? nbnCivilsStartDate;
  int? jobLeadWorkerId;
  String? jobLeadWorkerIdStr;
  String routedTo;
  String bal;
  String balance;
  bool? sameVisit;
  bool? isLockedJob;
  String? lockMessage;
  String? lockUserName;
  DateTime? lockedTime;
  String? picComments;

  String? jobField2;
  String? jobField3;
  String? jobField4;
  String? jobField5;
  String? jobField6;
  String? jobField8;

  String? jobField7;
  dynamic jobField7New; // added
  String? jobField9;
  dynamic jobField9New; // added
  String? jobField10;
  dynamic jobField10New; // added

  String? jobField11;
  String? jobField12;
  String? jobField13;
  String? jobField14;
  String? jobField15;
  String? jobField16;
  String? jobField17;
  String? jobField18;
  String? jobField19;

  bool? jobCheck1;
  bool? jobCheck2;
  bool? jobCheck3;
  bool? jobCheck4;
  bool? jobCheck5;
  bool? jobCheck6;
  bool? jobCheck7;
  bool? jobCheck8;
  bool? jobCheck9;
  bool? jobCheck10;
  bool? jobCheck11;
  bool? jobCheck12;
  bool? jobCheck13;
  bool? jobCheck14;
  bool? jobCheck15;

  bool? addressConfirmed;
  bool? scopeConfirmed;
  bool? antennaScope;
  bool? newOutletNeededResponse;
  bool? speakerMountingScope;
  bool? roofAccessGiven;
  bool? powerPointInLocation;
  bool? timeSlotConfirmed;
  bool? amountOutstanding;
  bool? goodsAtHome;

  DateTime? lastUpdated;

  JobDetailsDto(
      this.jobId,
      this.sourceCustomerId,
      this.jobSourceProductId,
      this.jobNumber,
      this.cancelDate,
      this.clientJobNumber,
      this.completedDate,
      this.contactName,
      this.custContactName,
      this.custEmail,
      this.jobClassId,
      this.custContact1,
      this.custContact2,
      this.requestDate,
      this.requestDateStr,
      this.jobDesc,
      this.followUpDate,
      this.followUpTime,
      this.followUpTimeStr,
      this.followUpDateAndTime,
      this.jobSourceId,
      this.whlocationId,
      this.jobField1,
      this.hnSalesPerson,
      this.whDistance,
      this.contractNo,
      this.jobSaleWorkerId,
      this.jobSaleWorkerIdStr,
      this.clientRefNo,
      this.workerEmail,
      this.workerLeaderEmail,
      this.quoteProvidedDate,
      this.npsScore,
      this.fsdStartDate,
      this.nbnCivilsStartDate,
      this.jobLeadWorkerId,
      this.jobLeadWorkerIdStr,
      this.routedTo,
      this.bal,
      this.balance,
      this.sameVisit,
      this.isLockedJob,
      this.lockMessage,
      this.lockUserName,
      this.lockedTime,
      this.picComments,
      this.jobField2,
      this.jobField3,
      this.jobField4,
      this.jobField5,
      this.jobField6,
      this.jobField8,
      this.jobField7,
      this.jobField7New,
      this.jobField9,
      this.jobField9New,
      this.jobField10,
      this.jobField10New,
      this.jobField11,
      this.jobField12,
      this.jobField13,
      this.jobField14,
      this.jobField15,
      this.jobField16,
      this.jobField17,
      this.jobField18,
      this.jobField19,
      this.jobCheck1,
      this.jobCheck2,
      this.jobCheck3,
      this.jobCheck4,
      this.jobCheck5,
      this.jobCheck6,
      this.jobCheck7,
      this.jobCheck8,
      this.jobCheck9,
      this.jobCheck10,
      this.jobCheck11,
      this.jobCheck12,
      this.jobCheck13,
      this.jobCheck14,
      this.jobCheck15,
      this.addressConfirmed,
      this.scopeConfirmed,
      this.antennaScope,
      this.newOutletNeededResponse,
      this.speakerMountingScope,
      this.roofAccessGiven,
      this.powerPointInLocation,
      this.timeSlotConfirmed,
      this.amountOutstanding,
      this.goodsAtHome,
      this.lastUpdated);

  factory JobDetailsDto.fromJson(Map<String, dynamic> json) {
    return JobDetailsDto(
        json['jobId'],
        json['sourceCustomerId'],
        json['jobSourceProductId'],
        json['jobNumber'],
        json['cancelDate'] != null ? DateTime.parse(json['cancelDate']) : null,
        json['clientJobNumber'],
        json['completedDate'] != null ? DateTime.parse(json['completedDate']) : null,
        json['contactName'],
        json['custContactName'],
        json['custEmail'],
        json['jobClassId'],
        json['custContact1'],
        json['custContact2'],
        json['requestDate'] != null ? DateTime.parse(json['requestDate']) : null,
        json['requestDateStr'],
        json['jobDesc'],
        json['followUpDate'] != null ? DateTime.parse(json['followUpDate']) : null,
        json['followUpTime'] != null ? DateTime.parse(json['followUpTime']) : null,
        json['followUpTimeStr'],
        json['followUpDateAndTime'],
        json['jobSourceId'],
        json['whlocationId'],
        json['jobField1'],
        json['hnSalesPerson'],
        json['whDistance'],
        json['contractNo'],
        json['jobSaleWorkerId'],
        json['jobSaleWorkerIdStr'],
        json['clientRefNo'],
        json['workerEmail'],
        json['workerLeaderEmail'],
        json['quoteProvidedDate'] != null ? DateTime.parse(json['quoteProvidedDate']) : null,
        json['npsScore'],
        json['fsdStartDate'] != null ? DateTime.parse(json['fsdStartDate']) : null,
        json['nbnCivilsStartDate'] != null ? DateTime.parse(json['nbnCivilsStartDate']) : null,
        json['jobLeadWorkerId'],
        json['jobLeadWorkerIdStr'],
        json['routedTo'],
        json['bal'],
        json['balance'],
        json['sameVisit'],
        json['isLockedJob'],
        json['lockMessage'],
        json['lockUserName'],
        json['lockedTime'] != null ? DateTime.parse(json['lockedTime']) : null,
        json['picComments'],
        json['jobField2'],
        json['jobField3'],
        json['jobField4'],
        json['jobField5'],
        json['jobField6'],
        json['jobField8'],
        json['jobField7'],
        json['jobField7New'],
        json['jobField9'],
        json['jobField9New'],
        json['jobField10'],
        json['jobField10New'],
        json['jobField11'],
        json['jobField12'],
        json['jobField13'],
        json['jobField14'],
        json['jobField15'],
        json['jobField16'],
        json['jobField17'],
        json['jobField18'],
        json['jobField19'],
        json['jobCheck1'],
        json['jobCheck2'],
        json['jobCheck3'],
        json['jobCheck4'],
        json['jobCheck5'],
        json['jobCheck6'],
        json['jobCheck7'],
        json['jobCheck8'],
        json['jobCheck9'],
        json['jobCheck10'],
        json['jobCheck11'],
        json['jobCheck12'],
        json['jobCheck13'],
        json['jobCheck14'],
        json['jobCheck15'],
        json['addressConfirmed'],
        json['scopeConfirmed'],
        json['antennaScope'],
        json['newOutletNeededResponse'],
        json['speakerMountingScope'],
        json['roofAccessGiven'],
        json['powerPointInLocation'],
        json['timeSlotConfirmed'],
        json['amountOutstanding'],
        json['goodsAtHome'],
        json['lastUpdated']  != null ? DateTime.parse(json['lastUpdated']) : null);
  }
}

class SiteDetailsDto {
  int? siteId;
  double? latitude;
  double? longitude;
  String? simpleAddress;
  String? siteInfo;
  int? siteCustomerId;
  String? siteNameSimpleAddress;

  // Site
  String? customField1;
  String? customField2;
  String? customField3;
  String? customField4;
  String? customField5;
  String? customField6;
  String? customField7;
  String? customField8;
  String? customField9;
  String? customField10;

  SiteDetailsDto(
      this.siteId,
      this.latitude,
      this.longitude,
      this.simpleAddress,
      this.siteInfo,
      this.siteCustomerId,
      this.siteNameSimpleAddress,
      this.customField1,
      this.customField2,
      this.customField3,
      this.customField4,
      this.customField5,
      this.customField6,
      this.customField7,
      this.customField8,
      this.customField9,
      this.customField10);

  factory SiteDetailsDto.fromJson(Map<String, dynamic> json) {
    return SiteDetailsDto(
        json['siteId'],
        json['latitude'],
        json['longitude'],
        json['simpleAddress'],
        json['siteInfo'],
        json['siteCustomerId'],
        json['siteNameSimpleAddress'],
        json['customField1'],
        json['customField2'],
        json['customField3'],
        json['customField4'],
        json['customField5'],
        json['customField6'],
        json['customField7'],
        json['customField8'],
        json['customField9'],
        json['customField10']);
  }
}

class JobTypeDetailsDto {
  String? custMarkerColor;
  int? rescheduleWizardId;
  int? scheduleWizardId;
  int? cancelWizardId;
  int? closingWizardId;
  bool? flexibleScheduling;
  String jobTypeCode;
  bool? truckRoll;
  bool? mainJobType;
  bool? contractSupportQueue;
  bool? itSetupSupportQueue;
  bool? operationSupportQueue;
  bool? revenueJobType;

  JobTypeDetailsDto(
      this.custMarkerColor,
      this.rescheduleWizardId,
      this.scheduleWizardId,
      this.cancelWizardId,
      this.closingWizardId,
      this.flexibleScheduling,
      this.jobTypeCode,
      this.truckRoll,
      this.mainJobType,
      this.contractSupportQueue,
      this.itSetupSupportQueue,
      this.operationSupportQueue,
      this.revenueJobType);

  factory JobTypeDetailsDto.fromJson(Map<String, dynamic> json) {
    return JobTypeDetailsDto(
        json['custMarkerColor'],
        json['rescheduleWizardId'],
        json['scheduleWizardId'],
        json['cancelWizardId'],
        json['closingWizardId'],
        json['flexibleScheduling'],
        json['jobTypeCode'],
        json['truckRoll'],
        json['mainJobType'],
        json['contractSupportQueue'],
        json['itSetupSupportQueue'],
        json['operationSupportQueue'],
        json['revenueJobType']);
  }
}

class ProjectDetailsDto {
  bool? requireCommentOnStockRemove;
  int? preInstallMaxCalls;
  bool? allowCustomerCommunicationTrace;
  int? projectCustomerId;
  bool? overrideStatusChange;
  bool? allowedStatusByJobType;
  bool? allowOpenClosedJob;
  bool? allowChangeJobType;
  String? projectName;
  String? projectCode;
  int? projectId;
  bool? isTpgProject;
  String projectCodeRegionName;

  // Project Fields Desc
  String? jobVisitField1Desc;
  String? jobVisitField2Desc;
  String? jobVisitField3Desc;
  String? jobVisitField4Desc;
  String? jobVisitField5Desc;
  String? jobVisitField6Desc;
  String? jobVisitField7Desc;
  String? jobVisitField8Desc;
  String? jobVisitField9Desc;
  String? jobVisitField10Desc;
  String? jobVisitField11Desc;
  String? jobVisitField12Desc;
  String? jobVisitField13Desc;
  String? jobVisitField14Desc;
  String? jobVisitField15Desc;
  String? jobVisitField16Desc;
  String? jobVisitField17Desc;
  String? jobVisitField18Desc;
  String? jobVisitField19Desc;
  String? jobVisitField20Desc;

  // Project Site
  String? siteField1Desc;
  String? siteField2Desc;
  String? siteField3Desc;
  String? siteField4Desc;
  String? siteField5Desc;
  String? siteField6Desc;
  String? siteField7Desc;
  String? siteField8Desc;
  String? siteField9Desc;
  String? siteField10Desc;

  // More1 ... Project Check Desc
  String? check1Desc;
  String? check2Desc;
  String? check3Desc;
  String? check4Desc;
  String? check5Desc;
  String? check6Desc;
  String? check7Desc;
  String? check8Desc;
  String? check9Desc;
  String? check10Desc;
  String? check11Desc;
  String? check12Desc;
  String? check13Desc;
  String? check14Desc;
  String? check15Desc;

  // Job Field Desc
  String? jobField1Desc;
  String? jobField2Desc;
  String? jobField3Desc;
  String? jobField4Desc;
  String? jobField5Desc;
  String? jobField6Desc;
  String? jobField7Desc;
  String? jobField8Desc;
  String? jobField9Desc;
  String? jobField10Desc;
  String? jobField11Desc;
  String? jobField12Desc;
  String? jobField13Desc;
  String? jobField14Desc;
  String? jobField15Desc;
  String? jobField16Desc;
  String? jobField17Desc;
  String? jobField18Desc;
  String? jobField19Desc;

  ProjectDetailsDto(
      this.requireCommentOnStockRemove,
      this.preInstallMaxCalls,
      this.allowCustomerCommunicationTrace,
      this.projectCustomerId,
      this.overrideStatusChange,
      this.allowedStatusByJobType,
      this.allowOpenClosedJob,
      this.allowChangeJobType,
      this.projectName,
      this.projectCode,
      this.projectId,
      this.isTpgProject,
      this.projectCodeRegionName,
      this.jobVisitField1Desc,
      this.jobVisitField2Desc,
      this.jobVisitField3Desc,
      this.jobVisitField4Desc,
      this.jobVisitField5Desc,
      this.jobVisitField6Desc,
      this.jobVisitField7Desc,
      this.jobVisitField8Desc,
      this.jobVisitField9Desc,
      this.jobVisitField10Desc,
      this.jobVisitField11Desc,
      this.jobVisitField12Desc,
      this.jobVisitField13Desc,
      this.jobVisitField14Desc,
      this.jobVisitField15Desc,
      this.jobVisitField16Desc,
      this.jobVisitField17Desc,
      this.jobVisitField18Desc,
      this.jobVisitField19Desc,
      this.jobVisitField20Desc,
      this.siteField1Desc,
      this.siteField2Desc,
      this.siteField3Desc,
      this.siteField4Desc,
      this.siteField5Desc,
      this.siteField6Desc,
      this.siteField7Desc,
      this.siteField8Desc,
      this.siteField9Desc,
      this.siteField10Desc,
      this.check1Desc,
      this.check2Desc,
      this.check3Desc,
      this.check4Desc,
      this.check5Desc,
      this.check6Desc,
      this.check7Desc,
      this.check8Desc,
      this.check9Desc,
      this.check10Desc,
      this.check11Desc,
      this.check12Desc,
      this.check13Desc,
      this.check14Desc,
      this.check15Desc,
      this.jobField1Desc,
      this.jobField2Desc,
      this.jobField3Desc,
      this.jobField4Desc,
      this.jobField5Desc,
      this.jobField6Desc,
      this.jobField7Desc,
      this.jobField8Desc,
      this.jobField9Desc,
      this.jobField10Desc,
      this.jobField11Desc,
      this.jobField12Desc,
      this.jobField13Desc,
      this.jobField14Desc,
      this.jobField15Desc,
      this.jobField16Desc,
      this.jobField17Desc,
      this.jobField18Desc,
      this.jobField19Desc);

  factory ProjectDetailsDto.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsDto(
        json['requireCommentOnStockRemove'],
        json['preInstallMaxCalls'],
        json['allowCustomerCommunicationTrace'],
        json['projectCustomerId'],
        json['overrideStatusChange'],
        json['allowedStatusByJobType'],
        json['allowOpenClosedJob'],
        json['allowChangeJobType'],
        json['projectName'],
        json['projectCode'],
        json['projectId'],
        json['isTpgProject'],
        json['projectCodeRegionName'],
        json['jobVisitField1Desc'],
        json['jobVisitField2Desc'],
        json['jobVisitField3Desc'],
        json['jobVisitField4Desc'],
        json['jobVisitField5Desc'],
        json['jobVisitField6Desc'],
        json['jobVisitField7Desc'],
        json['jobVisitField8Desc'],
        json['jobVisitField9Desc'],
        json['jobVisitField10Desc'],
        json['jobVisitField11Desc'],
        json['jobVisitField12Desc'],
        json['jobVisitField13Desc'],
        json['jobVisitField14Desc'],
        json['jobVisitField15Desc'],
        json['jobVisitField16Desc'],
        json['jobVisitField17Desc'],
        json['jobVisitField18Desc'],
        json['jobVisitField19Desc'],
        json['jobVisitField20Desc'],
        json['siteField1Desc'],
        json['siteField2Desc'],
        json['siteField3Desc'],
        json['siteField4Desc'],
        json['siteField5Desc'],
        json['siteField6Desc'],
        json['siteField7Desc'],
        json['siteField8Desc'],
        json['siteField9Desc'],
        json['siteField10Desc'],
        json['check1Desc'],
        json['check2Desc'],
        json['check3Desc'],
        json['check4Desc'],
        json['check5Desc'],
        json['check6Desc'],
        json['check7Desc'],
        json['check8Desc'],
        json['check9Desc'],
        json['check10Desc'],
        json['check11Desc'],
        json['check12Desc'],
        json['check13Desc'],
        json['check14Desc'],
        json['check15Desc'],
        json['jobField1Desc'],
        json['jobField2Desc'],
        json['jobField3Desc'],
        json['jobField4Desc'],
        json['jobField5Desc'],
        json['jobField6Desc'],
        json['jobField7Desc'],
        json['jobField8Desc'],
        json['jobField9Desc'],
        json['jobField10Desc'],
        json['jobField11Desc'],
        json['jobField12Desc'],
        json['jobField13Desc'],
        json['jobField14Desc'],
        json['jobField15Desc'],
        json['jobField16Desc'],
        json['jobField17Desc'],
        json['jobField18Desc'],
        json['jobField19Desc']);
  }
}

class JobStatusDetailsDto {
  bool? allowChangeInJobDetails;
  String jobStatusType;
  String jobStatusDesc;
  String jobStatusCode;
  String jobStatus;
  String? quotedProvided;
  String mainJobStatusType;

  JobStatusDetailsDto(
      this.allowChangeInJobDetails,
      this.jobStatusType,
      this.jobStatusDesc,
      this.jobStatusCode,
      this.jobStatus,
      this.quotedProvided,
      this.mainJobStatusType);

  factory JobStatusDetailsDto.fromJson(Map<String, dynamic> json) {
    return JobStatusDetailsDto(
        json['allowChangeInJobDetails'],
        json['jobStatusType'],
        json['jobStatusDesc'],
        json['jobStatusCode'],
        json['jobStatus'],
        json['quotedProvided'],
        json['mainJobStatusType']);
  }
}

class JobClassDetailsDto {
  String? jobClassName;
  String? jobClassCode;

  JobClassDetailsDto(this.jobClassName, this.jobClassCode);

  factory JobClassDetailsDto.fromJson(Map<String, dynamic> json) {
    return JobClassDetailsDto(json['jobClassName'], json['jobClassCode']);
  }
}

class RegionDetailsDto {
  String? regionName;
  double? timeOffset;
  DateTime? timeOffsetDateTime;
  DateTime? timeOfDay;

  RegionDetailsDto(this.regionName, this.timeOffset, this.timeOffsetDateTime,
      this.timeOfDay);

  factory RegionDetailsDto.fromJson(Map<String, dynamic> json) {
    return RegionDetailsDto(json['regionName'], json['timeOffset'],
        json['timeOffsetDateTime'] != null ? DateTime.parse(json['timeOffsetDateTime']) : null,
        json['timeOfDay'] != null ? DateTime.parse(json['timeOfDay']) : null);
  }
}

class WorkerJobDetailsDto {
  String? workerFullName;
  String? createdByWorkerName;

  WorkerJobDetailsDto(this.workerFullName, this.createdByWorkerName);

  factory WorkerJobDetailsDto.fromJson(Map<String, dynamic> json) {
    return WorkerJobDetailsDto(
        json['workerFullName'], json['createdByWorkerName']);
  }
}

class JobVisitModelDetailsDto {
  int? paymentMethodId;
  int? visitWorkerId;

  // Worker
  int? createdByWorkerId;
  int? workerStartTimeAgree;
  int? workerFinishTimeAgree;
  int? workerPaymentCollectedAgree;
  int? workerPaymentMethodAgree;

  // Dispatch
  double? paymentDue;
  String? paymentDueStr;
  String? reminderMessage;
  DateTime? reminderTime;
  int? visitStatusReasonId;
  int? visitStatusReasonId2;
  int? visitStatusReasonId3;
  String? supervisorCode;
  DateTime? startTime;
  DateTime? finishTime;
  double? paymentCollected;
  String? paymentCollectedStr;

  // PIC
  DateTime? customerSmsSentDate;
  bool? customerSendsms;
  int? jobIdRef;
  int? siteIdRef;
  int? jobTypeIdRef;
  int? jobTypeId;

  int? visitWorkerIdRef;
  int? loggedWorkerId;
  int? jobPoints;
  int? preInstallCallAttempts;
  bool? preInstallCallCompleted;
  int? visitStatusId;
  bool? logisticsConfirmed;
  String? clientVisitNumber;
  bool? isShowTimeDifference;
  DateTime? bookedDate;
  String? bookedDateStr;
  int? projectRegionId;
  int? jobVisitId;
  String? createdByProcess;
  DateTime dateCreated;
  DateTime? dateReconciled;
  String? technicianId;
  String bookedTimeSlot;
  String? routeSequence;
  String? jobViewedDate;
  String? acceptedDate;
  String? otherFsts;
  String? partner;
  String? product;
  String? storeLocation;
  String? pabtimeslot;
  DateTime? pabDate;
  String? pabDateStr;
  DateTime? nextCallDate;
  bool? isNextCallDate;
  bool? isActionDuedate;
  DateTime? actionDueTime;
  bool? otdRescheduleRequested;
  String? routingAlert;
  DateTime? smsSentDate;
  DateTime? viewedDate;
  DateTime? acceptDate;
  String? priority;
  String? jobVisitField1;
  String? jobVisitField2;
  String? jobVisitField3;
  String? jobVisitField4;
  String? jobVisitField5;
  String? jobVisitField6;
  String? jobVisitField7;
  String? jobVisitField8;
  String? jobVisitField9;
  String? jobVisitField10;
  String? jobVisitField11;
  String? jobVisitField12;
  String? jobVisitField13;
  String? jobVisitField14;
  String? jobVisitField15;
  String? jobVisitField16;
  String? jobVisitField17;
  String? jobVisitField18;
  dynamic jobVisitField19;
  dynamic jobVisitField20;
  int? customerSatisfaction;
  int? overallInspection;
  bool? surveyRequired;
  bool? surveyCompleted;
  bool? qiRequired;
  bool? qiCompleted;
  bool? discontinued;
  int? itemTypeId;
  int? timeSlotId;
  bool? limitedUser;

  // not used
  bool? isRequestSchedule;
  String? technicianName;
  String? whPickupLocation;
  String? salesRepId;
  String? smsSendDate;

  String? overrideRoutingWarningMessage;

  JobVisitModelDetailsDto(
      this.paymentMethodId,
      this.visitWorkerId,
      this.createdByWorkerId,
      this.workerStartTimeAgree,
      this.workerFinishTimeAgree,
      this.workerPaymentCollectedAgree,
      this.workerPaymentMethodAgree,
      this.paymentDue,
      this.paymentDueStr,
      this.reminderMessage,
      this.reminderTime,
      this.visitStatusReasonId,
      this.visitStatusReasonId2,
      this.visitStatusReasonId3,
      this.supervisorCode,
      this.startTime,
      this.finishTime,
      this.paymentCollected,
      this.paymentCollectedStr,
      this.customerSmsSentDate,
      this.customerSendsms,
      this.jobIdRef,
      this.siteIdRef,
      this.jobTypeIdRef,
      this.jobTypeId,
      this.visitWorkerIdRef,
      this.loggedWorkerId,
      this.jobPoints,
      this.preInstallCallAttempts,
      this.preInstallCallCompleted,
      this.visitStatusId,
      this.logisticsConfirmed,
      this.clientVisitNumber,
      this.isShowTimeDifference,
      this.bookedDate,
      this.bookedDateStr,
      this.projectRegionId,
      this.jobVisitId,
      this.createdByProcess,
      this.dateCreated,
      this.dateReconciled,
      this.technicianId,
      this.bookedTimeSlot,
      this.routeSequence,
      this.jobViewedDate,
      this.acceptedDate,
      this.otherFsts,
      this.partner,
      this.product,
      this.storeLocation,
      this.pabtimeslot,
      this.pabDate,
      this.pabDateStr,
      this.nextCallDate,
      this.isNextCallDate,
      this.isActionDuedate,
      this.actionDueTime,
      this.otdRescheduleRequested,
      this.routingAlert,
      this.smsSentDate,
      this.viewedDate,
      this.acceptDate,
      this.priority,
      this.jobVisitField1,
      this.jobVisitField2,
      this.jobVisitField3,
      this.jobVisitField4,
      this.jobVisitField5,
      this.jobVisitField6,
      this.jobVisitField7,
      this.jobVisitField8,
      this.jobVisitField9,
      this.jobVisitField10,
      this.jobVisitField11,
      this.jobVisitField12,
      this.jobVisitField13,
      this.jobVisitField14,
      this.jobVisitField15,
      this.jobVisitField16,
      this.jobVisitField17,
      this.jobVisitField18,
      this.jobVisitField19,
      this.jobVisitField20,
      this.customerSatisfaction,
      this.overallInspection,
      this.surveyRequired,
      this.surveyCompleted,
      this.qiRequired,
      this.qiCompleted,
      this.discontinued,
      this.itemTypeId,
      this.timeSlotId,
      this.limitedUser,
      this.isRequestSchedule,
      this.technicianName,
      this.whPickupLocation,
      this.salesRepId,
      this.smsSendDate,
      this.overrideRoutingWarningMessage);

  factory JobVisitModelDetailsDto.fromJson(Map<String, dynamic> json) {
    return JobVisitModelDetailsDto(
        json['paymentMethodId'],
        json['visitWorkerId'],
        json['createdByWorkerId'],
        json['workerStartTimeAgree'],
        json['workerFinishTimeAgree'],
        json['workerPaymentCollectedAgree'],
        json['workerPaymentMethodAgree'],
        json['paymentDue'],
        json['paymentDueStr'],
        json['reminderMessage'],
        json['reminderTime'] != null ? DateTime.parse(json['reminderTime']) : null,
        json['visitStatusReasonId'],
        json['visitStatusReasonId2'],
        json['visitStatusReasonId3'],
        json['supervisorCode'],
        json['startTime'] != null ? DateTime.parse(json['startTime']) : null,
        json['finishTime'] != null ? DateTime.parse(json['finishTime']) : null,
        json['paymentCollected'],
        json['paymentCollectedStr'],
        json['customerSmsSentDate'] != null ? DateTime.parse(json['customerSmsSentDate']) : null,
        json['customerSendsms'],
        json['jobIdRef'],
        json['siteIdRef'],
        json['jobTypeIdRef'],
        json['jobTypeId'],
        json['visitWorkerIdRef'],
        json['loggedWorkerId'],
        json['jobPoints'],
        json['preInstallCallAttempts'],
        json['preInstallCallCompleted'],
        json['visitStatusId'],
        json['logisticsConfirmed'],
        json['clientVisitNumber'],
        json['isShowTimeDifference'],
        json['bookedDate'] != null ? DateTime.parse(json['bookedDate']) : null,
        json['bookedDateStr'],
        json['projectRegionId'],
        json['jobVisitId'],
        json['createdByProcess'],
        DateTime.parse(json['dateCreated']),
        json['dateReconciled'] != null ? DateTime.parse(json['dateReconciled']) : null,
        json['technicianId'],
        json['bookedTimeSlot'],
        json['routeSequence'],
        json['jobViewedDate'],
        json['acceptedDate'],
        json['otherFsts'],
        json['partner'],
        json['product'],
        json['storeLocation'],
        json['pabtimeslot'],
        json['pabDate'] != null ? DateTime.parse(json['pabDate']) : null,
        json['pabDateStr'],
        json['nextCallDate'] != null ? DateTime.parse(json['nextCallDate']) : null,
        json['isNextCallDate'],
        json['isActionDuedate'],
        json['actionDueTime'] != null ? DateTime.parse(json['actionDueTime']) : null,
        json['otdRescheduleRequested'],
        json['routingAlert'],
        json['smsSentDate'] != null ? DateTime.parse(json['smsSentDate']) : null,
        json['viewedDate'] != null ? DateTime.parse(json['viewedDate']) : null,
        json['acceptDate'] != null ? DateTime.parse(json['acceptDate']) : null,
        json['priority'],
        json['jobVisitField1'],
        json['jobVisitField2'],
        json['jobVisitField3'],
        json['jobVisitField4'],
        json['jobVisitField5'],
        json['jobVisitField6'],
        json['jobVisitField7'],
        json['jobVisitField8'],
        json['jobVisitField9'],
        json['jobVisitField10'],
        json['jobVisitField11'],
        json['jobVisitField12'],
        json['jobVisitField13'],
        json['jobVisitField14'],
        json['jobVisitField15'],
        json['jobVisitField16'],
        json['jobVisitField17'],
        json['jobVisitField18'],
        json['jobVisitField19'],
        json['jobVisitField20'],
        json['customerSatisfaction'],
        json['overallInspection'],
        json['surveyRequired'],
        json['surveyCompleted'],
        json['qiRequired'],
        json['qiCompleted'],
        json['discontinued'],
        json['itemTypeId'],
        json['timeSlotId'],
        json['limitedUser'],
        json['isRequestSchedule'],
        json['technicianName'],
        json['whPickupLocation'],
        json['salesRepId'],
        json['smsSendDate'],
        json['overrideRoutingWarningMessage']);
  }
}

class OriginalValuesDto {
  String? jobVisitField1;
  String? jobVisitField2;
  String? jobVisitField3;
  String? jobVisitField4;
  String? jobVisitField5;
  String? jobVisitField6;
  String? jobVisitField7;
  String? jobVisitField8;
  String? jobVisitField9;
  String? jobVisitField10;
  String? jobVisitField11;
  String? jobVisitField12;
  String? jobVisitField13;
  String? jobVisitField14;
  String? jobVisitField15;
  String? jobVisitField16;
  String? jobVisitField17;
  String? jobVisitField18;
  String? jobVisitField19;
  String? jobVisitField20;

  bool? jobCheck1;
  bool? jobCheck2;
  bool? jobCheck3;
  bool? jobCheck4;
  bool? jobCheck5;
  bool? jobCheck6;
  bool? jobCheck7;
  bool? jobCheck8;
  bool? jobCheck9;
  bool? jobCheck10;
  bool? jobCheck11;
  bool? jobCheck12;
  bool? jobCheck13;
  bool? jobCheck14;
  bool? jobCheck15;

  String? jobField1;
  String? jobField2;
  String? jobField3;
  String? jobField4;
  String? jobField5;
  String? jobField6;
  String? jobField7;
  String? jobField8;
  String? jobField9;
  String? jobField10;
  String? jobField11;
  String? jobField12;
  String? jobField13;
  String? jobField14;
  String? jobField15;
  String? jobField16;
  String? jobField17;
  String? jobField18;
  String? jobField19;

  OriginalValuesDto(
      this.jobVisitField1,
      this.jobVisitField2,
      this.jobVisitField3,
      this.jobVisitField4,
      this.jobVisitField5,
      this.jobVisitField6,
      this.jobVisitField7,
      this.jobVisitField8,
      this.jobVisitField9,
      this.jobVisitField10,
      this.jobVisitField11,
      this.jobVisitField12,
      this.jobVisitField13,
      this.jobVisitField14,
      this.jobVisitField15,
      this.jobVisitField16,
      this.jobVisitField17,
      this.jobVisitField18,
      this.jobVisitField19,
      this.jobVisitField20,
      this.jobCheck1,
      this.jobCheck2,
      this.jobCheck3,
      this.jobCheck4,
      this.jobCheck5,
      this.jobCheck6,
      this.jobCheck7,
      this.jobCheck8,
      this.jobCheck9,
      this.jobCheck10,
      this.jobCheck11,
      this.jobCheck12,
      this.jobCheck13,
      this.jobCheck14,
      this.jobCheck15,
      this.jobField1,
      this.jobField2,
      this.jobField3,
      this.jobField4,
      this.jobField5,
      this.jobField6,
      this.jobField7,
      this.jobField8,
      this.jobField9,
      this.jobField10,
      this.jobField11,
      this.jobField12,
      this.jobField13,
      this.jobField14,
      this.jobField15,
      this.jobField16,
      this.jobField17,
      this.jobField18,
      this.jobField19);

  factory OriginalValuesDto.fromJson(Map<String, dynamic> json) {
    return OriginalValuesDto(
        json['jobVisitField1'],
        json['jobVisitField2'],
        json['jobVisitField3'],
        json['jobVisitField4'],
        json['jobVisitField5'],
        json['jobVisitField6'],
        json['jobVisitField7'],
        json['jobVisitField8'],
        json['jobVisitField9'],
        json['jobVisitField10'],
        json['jobVisitField11'],
        json['jobVisitField12'],
        json['jobVisitField13'],
        json['jobVisitField14'],
        json['jobVisitField15'],
        json['jobVisitField16'],
        json['jobVisitField17'],
        json['jobVisitField18'],
        json['jobVisitField19'],
        json['jobVisitField20'],
        json['jobCheck1'],
        json['jobCheck2'],
        json['jobCheck3'],
        json['jobCheck4'],
        json['jobCheck5'],
        json['jobCheck6'],
        json['jobCheck7'],
        json['jobCheck8'],
        json['jobCheck9'],
        json['jobCheck10'],
        json['jobCheck11'],
        json['jobCheck12'],
        json['jobCheck13'],
        json['jobCheck14'],
        json['jobCheck15'],
        json['jobField1'],
        json['jobField2'],
        json['jobField3'],
        json['jobField4'],
        json['jobField5'],
        json['jobField6'],
        json['jobField7'],
        json['jobField8'],
        json['jobField9'],
        json['jobField10'],
        json['jobField11'],
        json['jobField12'],
        json['jobField13'],
        json['jobField14'],
        json['jobField15'],
        json['jobField16'],
        json['jobField17'],
        json['jobField18'],
        json['jobField19']);
  }
}

class SaveJobLogsReqDto {
  List<CustomerCommunicationSaveDto> communicationSaveDtoList = [];
  List<LogDto> logDtoList = [];

  SaveJobLogsReqDto(this.communicationSaveDtoList, this.logDtoList);

  factory SaveJobLogsReqDto.fromJson(Map<String, dynamic> json) {
    return SaveJobLogsReqDto(
        List.of(json['communicationSaveDtoList'])
            .map((item) => CustomerCommunicationSaveDto.fromJson(item))
            .toList(),
        List.of(json['logDtoList'])
            .map((item) => LogDto.fromJson(item))
            .toList());
  }
}

class SavePicInformationReqDto {
  String? updatedRoutingAlert;

  bool? goodsAtHome;
  bool? timeSlotConfirmed;
  bool? addressConfirmed;
  bool? scopesConfirmed;
  bool? amountOutstanding;
  bool? antennaScopes;
  bool? speakerMountingScopes;
  String? dwellingType;
  String? storeyDwelling;
  String? roofing;
  bool? doesRoofHaveManhole; // 36
  String? cabling; // 37
  bool? newOutletNeeded; // 38
  String? ductRequired;
  String? speciallAdderRequirement;
  String? strataBodyCorporatePermissionTaken;
  String? mountingSection;
  bool? roofAccessGiven; // 43
  bool? powerPointInlocationIfWirelessSpeakers; // 44
  String? screenSize; // 76

  String? picComments;
  bool? picChecked;
  bool? sMSChecked;
  String? oldPreInstallCallAttempts;

  int? jobVisitId;
  int? jobId;
  int? numericUpDown1;
  int? loggedWorkerId;
  bool? isPICInfoCreated;

  SavePicInformationReqDto(
      this.updatedRoutingAlert,
      this.goodsAtHome,
      this.timeSlotConfirmed,
      this.addressConfirmed,
      this.scopesConfirmed,
      this.amountOutstanding,
      this.antennaScopes,
      this.speakerMountingScopes,
      this.dwellingType,
      this.storeyDwelling,
      this.roofing,
      this.doesRoofHaveManhole,
      this.cabling,
      this.newOutletNeeded,
      this.ductRequired,
      this.speciallAdderRequirement,
      this.strataBodyCorporatePermissionTaken,
      this.mountingSection,
      this.roofAccessGiven,
      this.powerPointInlocationIfWirelessSpeakers,
      this.screenSize,
      this.picComments,
      this.picChecked,
      this.sMSChecked,
      this.oldPreInstallCallAttempts,
      this.jobVisitId,
      this.jobId,
      this.numericUpDown1,
      this.loggedWorkerId,
      this.isPICInfoCreated);

  factory SavePicInformationReqDto.fromJson(Map<String, dynamic> json) {
    return SavePicInformationReqDto(
        json['updatedRoutingAlert'],
        json['goodsAtHome'],
        json['timeSlotConfirmed'],
        json['addressConfirmed'],
        json['scopesConfirmed'],
        json['amountOutstanding'],
        json['antennaScopes'],
        json['speakerMountingScopes'],
        json['dwellingType'],
        json['storeyDwelling'],
        json['roofing'],
        json['doesRoofHaveManhole'],
        json['cabling'],
        json['newOutletNeeded'],
        json['ductRequired'],
        json['speciallAdderRequirement'],
        json['strataBodyCorporatePermissionTaken'],
        json['mountingSection'],
        json['roofAccessGiven'],
        json['powerPointInlocationIfWirelessSpeakers'],
        json['screenSize'],
        json['picComments'],
        json['picChecked'],
        json['sMSChecked'],
        json['oldPreInstallCallAttempts'],
        json['jobVisitId'],
        json['jobId'],
        json['numericUpDown1'],
        json['loggedWorkerId'],
        json['isPICInfoCreated']);
  }
}

class CustomerCommunicationSaveDto {
  int? customerId;
  String? comment;
  int? reasonId;
  bool requireFollowUp = false;
  int siteId = 0;

  CustomerCommunicationSaveDto(this.customerId, this.comment, this.reasonId,
      this.requireFollowUp, this.siteId);

  factory CustomerCommunicationSaveDto.fromJson(Map<String, dynamic> json) {
    return CustomerCommunicationSaveDto(json['customerId'], json['comment'],
        json['reasonId'], json['requireFollowUp'], json['siteId']);
  }
}

class LogDto {
  int logId = 0;
  int? id; // jobVisitId
  String idtype = 'JobVisit';
  String logType = 'DispatchComment';

  int? workerId;
  DateTime eventDate = DateTime.now();
  DateTime logDate = DateTime.now();
  String? eventDesc;
  String? tableChanged;
  String? fieldChanged;
  String? oldValue;
  String? newValue;
  double? amount;
  int? silcarId;

  LogDto(
      this.logId,
      this.id,
      this.idtype,
      this.logType,
      this.workerId,
      this.eventDate,
      this.logDate,
      this.eventDesc,
      this.tableChanged,
      this.fieldChanged,
      this.oldValue,
      this.newValue,
      this.amount,
      this.silcarId);

  factory LogDto.fromJson(Map<String, dynamic> json) {
    return LogDto(
        json['logId'],
        json['id'],
        json['idtype'],
        json['logType'],
        json['workerId'],
        DateTime.parse(json['eventDate']),
        DateTime.parse(json['logDate']),
        json['eventDesc'],
        json['tableChanged'],
        json['fieldChanged'],
        json['oldValue'],
        json['newValue'],
        json['amount'],
        json['silcarId']);
  }
}
