class JobVisitModel {
  JobVisitModel(Map<String, dynamic> json)
      : jobDetailsDto = JobDetailsDto(
          json['jobDetailsDto'] as Map<String, dynamic>,
        ),
        siteDetailsDto = SiteDetailsDto(
          json['siteDetailsDto'] as Map<String, dynamic>,
        ),
        jobTypeDetailsDto = JobTypeDetailsDto(
          json['jobTypeDetailsDto'] as Map<String, dynamic>,
        ),
        projectDetailsDto = ProjectDetailsDto(
          json['projectDetailsDto'] as Map<String, dynamic>,
        ),
        jobStatusDetailsDto = JobStatusDetailsDto(
          json['jobStatusDetailsDto'] as Map<String, dynamic>,
        ),
        jobClassDetailsDto = JobClassDetailsDto(
          json['jobClassDetailsDto'] as Map<String, dynamic>,
        ),
        regionDetailsDto = RegionDetailsDto(
          json['regionDetailsDto'] as Map<String, dynamic>,
        ),
        workerJobDetailsDto = WorkerJobDetailsDto(
          json['workerJobDetailsDto'] as Map<String, dynamic>,
        ),
        jobVisitModelDetailsDto = JobVisitModelDetailsDto(
          json['jobVisitModelDetailsDto'] as Map<String, dynamic>,
        ),
        originalValuesDto = OriginalValuesDto(
          json['originalValuesDto'] as Map<String, dynamic>,
        ),
        lockClass = json['lockClass'] as String?,
        customerCreditInfoId = json['customerCreditInfoId'] as int,
        summaryLockMessage = json['summaryLockMessage'] as String?,
        lockMessage = json['lockMessage'] as String?,
        bigStatus = json['bigStatus'] as String?,
        sliceLockMessage = json['sliceLockMessage'] as int?,
        timeOfDayRunTime = json['timeOfDayRunTime'] as DateTime?,
        status = json['status'] as String?,
        fulfillmentTotal = json['fulfillmentTotal'] as String?,
        equipmentTotal = json['equipmentTotal'] as String?,
        jobTotalTextBox = json['jobTotalTextBox'] as String?,
        firstCollectionDate = json['firstCollectionDate'] != null
            ? DateTime.parse(json['firstCollectionDate'] as String)
            : null,
        firstCollectionByWorkerId = json['firstCollectionByWorkerId'] as int,
        firstCollectionWorkerName = json['firstCollectionWorkerName'] as String,
        secondCollectionDate = json['secondCollectionDate'] != null
            ? DateTime.parse(json['secondCollectionDate'] as String)
            : null,
        secondCollectionByWorkerId = json['secondCollectionByWorkerId'] as int,
        secondCollectionWorkerName =
            json['secondCollectionWorkerName'] as String,
        collectionLetterDate = json['collectionLetterDate'] != null
            ? DateTime.parse(json['collectionLetterDate'] as String)
            : null,
        collectionLetterByWorkerId = json['collectionLetterByWorkerId'] as int,
        collectionLetterWorkerName =
            json['collectionLetterWorkerName'] as String,
        collectionAgencyDate = json['collectionAgencyDate'] != null
            ? DateTime.parse(json['collectionAgencyDate'] as String)
            : null,
        collectionAgencyByWorkerId = json['collectionAgencyByWorkerId'] as int,
        collectionAgencyWorkerName =
            json['collectionAgencyWorkerName'] as String,
        sendCollectionLetterDate = json['sendCollectionLetterDate'] != null
            ? DateTime.parse(json['sendCollectionLetterDate'] as String)
            : null,
        sendCollectionLetterByWorkerId =
            json['sendCollectionLetterByWorkerId'] as int,
        sendCollectionLetterByWorkerName =
            json['sendCollectionLetterByWorkerName'] as String,
        isMissingPaymentAction = json['isMissingPaymentAction'] as bool,
        oktobillallowed = json['oktobillallowed'] as bool,
        jobEnterDiscount = json['jobEnterDiscount'] as bool?,
        jobDeleteConfirmedPayment = json['jobDeleteConfirmedPayment'] as bool?,
        jobAllowLockOverride = json['jobAllowLockOverride'] as bool?,
        jobPayRefundLessThan375 = json['jobPayRefundLessThan375'] as bool?,
        jobPayRefundBetween375And750 =
            json['jobPayRefundBetween375And750'] as bool?,
        jobPayRefundGreaterThan750 =
            json['jobPayRefundGreaterThan750'] as bool?,
        jobAllowReopenClosedCob = json['jobAllowReopenClosedCob'] as bool?,
        jobLimitedUser = json['jobLimitedUser'] as bool?,
        jobCheckCollectionAgency = json['jobCheckCollectionAgency'] as bool?,
        jobUnClaimGeFinanceInvoice =
            json['jobUnClaimGeFinanceInvoice'] as bool?,
        jobPayGeFinanceInvoice = json['jobPayGeFinanceInvoice'] as bool?,
        jobChargeToGeFinance = json['jobChargeToGeFinance'] as bool?,
        crmEditStoreWarehouseDetails =
            json['crmEditStoreWarehouseDetails'] as bool?,
        jobAddNegativeQuantity = json['jobAddNegativeQuantity'] as bool?,
        jobShowExpiredPromotions = json['jobShowExpiredPromotions'] as bool?,
        jobEditClientVisitNumber = json['jobEditClientVisitNumber'] as bool?,
        oktopayallowed = json['oktopayallowed'] as bool?,
        jobChangeReasonCode = json['jobChangeReasonCode'] as bool?,
        jobTickSkipClaimPayment = json['jobTickSkipClaimPayment'] as bool?,
        jobEditClientRefNumber = json['jobEditClientRefNumber'] as bool?,
        jobPicCompletedOverride = json['jobPicCompletedOverride'] as bool?,
        jobPicSmsSentOverride = json['jobPicSmsSentOverride'] as bool?,
        jobClearDirtyTow = json['jobClearDirtyTow'] as bool?,
        jobChangeNpsScore = json['jobChangeNpsScore'] as bool?,
        isUnlockJobVisit = json['isUnlockJobVisit'] as bool?,
        saveJobLogsReqDto = json['saveJobLogsReqDto'] != null
            ? SaveJobLogsReqDto(
                json['saveJobLogsReqDto'] as Map<String, dynamic>)
            : null,
        savePicInformationReqDto = json['savePicInformationReqDto'] != null
            ? SavePicInformationReqDto(
                json['savePicInformationReqDto'] as Map<String, dynamic>,
              )
            : null,
        isSendSmsMissingPaymentCall =
            json['isSendSmsMissingPaymentCall'] as bool?,
        isCheckFirstMissingPaymentCall =
            json['isCheckFirstMissingPaymentCall'] as bool?,
        isCheckSecondMissingPaymentCall =
            json['isCheckSecondMissingPaymentCall'] as bool?,
        jobOpenTime = json['jobOpenTime'] != null
            ? DateTime.parse(json['jobOpenTime'] as String)
            : null,
        customerEmail = json['customerEmail'] as String,
        customerMobile = json['customerMobile'] as String,
        isCloseIssue = json['isCloseIssue'] as bool?,
        lastUpdated = json['lastUpdated'] != null
            ? DateTime.parse(json['lastUpdated'] as String)
            : null;

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
}

class JobDetailsDto {
  JobDetailsDto(Map<String, dynamic> json)
      : jobId = json['jobId'] as int?,
        sourceCustomerId = json['sourceCustomerId'] as int?,
        jobSourceProductId = json['jobSourceProductId'] as int?,
        jobNumber = json['jobNumber'] as int?,
        cancelDate = json['cancelDate'] != null
            ? DateTime.parse(
                json['cancelDate'] as String,
              )
            : null,
        clientJobNumber = json['clientJobNumber'] as String,
        completedDate = json['completedDate'] != null
            ? DateTime.parse(json['completedDate'] as String)
            : null,
        contactName = json['contactName'] as String?,
        custContactName = json['custContactName'] as String?,
        custEmail = json['custEmail'] as String?,
        jobClassId = json['jobClassId'] as int?,
        custContact1 = json['custContact1'] as String?,
        custContact2 = json['custContact2'] as String?,
        requestDate = json['requestDate'] != null
            ? DateTime.parse(json['requestDate'] as String)
            : null,
        requestDateStr = json['requestDateStr'] as String?,
        jobDesc = json['jobDesc'] as String,
        followUpDate = json['followUpDate'] != null
            ? DateTime.parse(json['followUpDate'] as String)
            : null,
        followUpTime = json['followUpTime'] != null
            ? DateTime.parse(json['followUpTime'] as String)
            : null,
        followUpTimeStr = json['followUpTimeStr'] as String?,
        followUpDateAndTime = json['followUpDateAndTime'] as String?,
        jobSourceId = json['jobSourceId'] as int?,
        whlocationId = json['whlocationId'] as int?,
        jobField1 = json['jobField1'] as String?,
        hnSalesPerson = json['hnSalesPerson'] as String?,
        whDistance = json['whDistance'] as double?,
        contractNo = json['contractNo'] as String?,
        jobSaleWorkerId = json['jobSaleWorkerId'] as int?,
        jobSaleWorkerIdStr = json['jobSaleWorkerIdStr'] as String?,
        clientRefNo = json['clientRefNo'] as String?,
        workerEmail = json['workerEmail'] as String?,
        workerLeaderEmail = json['workerLeaderEmail'] as String?,
        quoteProvidedDate = json['quoteProvidedDate'] != null
            ? DateTime.parse(json['quoteProvidedDate'] as String)
            : null,
        npsScore = json['npsScore'] as int?,
        fsdStartDate = json['fsdStartDate'] != null
            ? DateTime.parse(json['fsdStartDate'] as String)
            : null,
        nbnCivilsStartDate = json['nbnCivilsStartDate'] != null
            ? DateTime.parse(json['nbnCivilsStartDate'] as String)
            : null,
        jobLeadWorkerId = json['jobLeadWorkerId'] as int?,
        jobLeadWorkerIdStr = json['jobLeadWorkerIdStr'] as String?,
        routedTo = json['routedTo'] as String,
        bal = json['bal'] as String,
        balance = json['balance'] as String,
        sameVisit = json['sameVisit'] as bool?,
        isLockedJob = json['isLockedJob'] as bool?,
        lockMessage = json['lockMessage'] as String?,
        lockUserName = json['lockUserName'] as String?,
        lockedTime = json['lockedTime'] != null
            ? DateTime.parse(json['lockedTime'] as String)
            : null,
        picComments = json['picComments'] as String?,
        jobField2 = json['jobField2'] as String?,
        jobField3 = json['jobField3'] as String?,
        jobField4 = json['jobField4'] as String?,
        jobField5 = json['jobField5'] as String?,
        jobField6 = json['jobField6'] as String?,
        jobField8 = json['jobField8'] as String?,
        jobField7 = json['jobField7'] as String?,
        jobField7New = json['jobField7New'],
        jobField9 = json['jobField9'] as String?,
        jobField9New = json['jobField9New'],
        jobField10 = json['jobField10'] as String?,
        jobField10New = json['jobField10New'],
        jobField11 = json['jobField11'] as String?,
        jobField12 = json['jobField12'] as String?,
        jobField13 = json['jobField13'] as String?,
        jobField14 = json['jobField14'] as String?,
        jobField15 = json['jobField15'] as String?,
        jobField16 = json['jobField16'] as String?,
        jobField17 = json['jobField17'] as String?,
        jobField18 = json['jobField18'] as String?,
        jobField19 = json['jobField19'] as String?,
        jobCheck1 = json['jobCheck1'] as bool?,
        jobCheck2 = json['jobCheck2'] as bool?,
        jobCheck3 = json['jobCheck3'] as bool?,
        jobCheck4 = json['jobCheck4'] as bool?,
        jobCheck5 = json['jobCheck5'] as bool?,
        jobCheck6 = json['jobCheck6'] as bool?,
        jobCheck7 = json['jobCheck7'] as bool?,
        jobCheck8 = json['jobCheck8'] as bool?,
        jobCheck9 = json['jobCheck9'] as bool?,
        jobCheck10 = json['jobCheck10'] as bool?,
        jobCheck11 = json['jobCheck11'] as bool?,
        jobCheck12 = json['jobCheck12'] as bool?,
        jobCheck13 = json['jobCheck13'] as bool?,
        jobCheck14 = json['jobCheck14'] as bool?,
        jobCheck15 = json['jobCheck15'] as bool?,
        addressConfirmed = json['addressConfirmed'] as bool?,
        scopeConfirmed = json['scopeConfirmed'] as bool?,
        antennaScope = json['antennaScope'] as bool?,
        newOutletNeededResponse = json['newOutletNeededResponse'] as bool?,
        speakerMountingScope = json['speakerMountingScope'] as bool?,
        roofAccessGiven = json['roofAccessGiven'] as bool?,
        powerPointInLocation = json['powerPointInLocation'] as bool?,
        timeSlotConfirmed = json['timeSlotConfirmed'] as bool?,
        amountOutstanding = json['amountOutstanding'] as bool?,
        goodsAtHome = json['goodsAtHome'] as bool?,
        lastUpdated = json['lastUpdated'] != null
            ? DateTime.parse(json['lastUpdated'] as String)
            : null;

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
}

class SiteDetailsDto {
  SiteDetailsDto(Map<String, dynamic> json)
      : siteId = json['siteId'] as int?,
        latitude = json['latitude'] as double?,
        longitude = json['longitude'] as double?,
        simpleAddress = json['simpleAddress'] as String?,
        siteInfo = json['siteInfo'] as String?,
        siteCustomerId = json['siteCustomerId'] as int?,
        siteNameSimpleAddress = json['siteNameSimpleAddress'] as String?,
        customField1 = json['customField1'] as String?,
        customField2 = json['customField2'] as String?,
        customField3 = json['customField3'] as String?,
        customField4 = json['customField4'] as String?,
        customField5 = json['customField5'] as String?,
        customField6 = json['customField6'] as String?,
        customField7 = json['customField7'] as String?,
        customField8 = json['customField8'] as String?,
        customField9 = json['customField9'] as String?,
        customField10 = json['customField10'] as String?;

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
}

class JobTypeDetailsDto {
  JobTypeDetailsDto(Map<String, dynamic> json)
      : custMarkerColor = json['custMarkerColor'] as String?,
        rescheduleWizardId = json['rescheduleWizardId'] as int?,
        scheduleWizardId = json['scheduleWizardId'] as int?,
        cancelWizardId = json['cancelWizardId'] as int?,
        closingWizardId = json['closingWizardId'] as int?,
        flexibleScheduling = json['flexibleScheduling'] as bool?,
        jobTypeCode = json['jobTypeCode'] as String,
        truckRoll = json['truckRoll'] as bool?,
        mainJobType = json['mainJobType'] as bool?,
        contractSupportQueue = json['contractSupportQueue'] as bool?,
        itSetupSupportQueue = json['itSetupSupportQueue'] as bool?,
        operationSupportQueue = json['operationSupportQueue'] as bool?,
        revenueJobType = json['revenueJobType'] as bool?;

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
}

class ProjectDetailsDto {
  ProjectDetailsDto(Map<String, dynamic> json)
      : requireCommentOnStockRemove =
            json['requireCommentOnStockRemove'] as bool?,
        preInstallMaxCalls = json['preInstallMaxCalls'] as int?,
        allowCustomerCommunicationTrace =
            json['allowCustomerCommunicationTrace'] as bool?,
        projectCustomerId = json['projectCustomerId'] as int?,
        overrideStatusChange = json['overrideStatusChange'] as bool?,
        allowedStatusByJobType = json['allowedStatusByJobType'] as bool?,
        allowOpenClosedJob = json['allowOpenClosedJob'] as bool?,
        allowChangeJobType = json['allowChangeJobType'] as bool?,
        projectName = json['projectName'] as String?,
        projectCode = json['projectCode'] as String?,
        projectId = json['projectId'] as int?,
        isTpgProject = json['isTpgProject'] as bool?,
        projectCodeRegionName = json['projectCodeRegionName'] as String,
        jobVisitField1Desc = json['jobVisitField1Desc'] as String?,
        jobVisitField2Desc = json['jobVisitField2Desc'] as String?,
        jobVisitField3Desc = json['jobVisitField3Desc'] as String?,
        jobVisitField4Desc = json['jobVisitField4Desc'] as String?,
        jobVisitField5Desc = json['jobVisitField5Desc'] as String?,
        jobVisitField6Desc = json['jobVisitField6Desc'] as String?,
        jobVisitField7Desc = json['jobVisitField7Desc'] as String?,
        jobVisitField8Desc = json['jobVisitField8Desc'] as String?,
        jobVisitField9Desc = json['jobVisitField9Desc'] as String?,
        jobVisitField10Desc = json['jobVisitField10Desc'] as String?,
        jobVisitField11Desc = json['jobVisitField11Desc'] as String?,
        jobVisitField12Desc = json['jobVisitField12Desc'] as String?,
        jobVisitField13Desc = json['jobVisitField13Desc'] as String?,
        jobVisitField14Desc = json['jobVisitField14Desc'] as String?,
        jobVisitField15Desc = json['jobVisitField15Desc'] as String?,
        jobVisitField16Desc = json['jobVisitField16Desc'] as String?,
        jobVisitField17Desc = json['jobVisitField17Desc'] as String?,
        jobVisitField18Desc = json['jobVisitField18Desc'] as String?,
        jobVisitField19Desc = json['jobVisitField19Desc'] as String?,
        jobVisitField20Desc = json['jobVisitField20Desc'] as String?,
        siteField1Desc = json['siteField1Desc'] as String?,
        siteField2Desc = json['siteField2Desc'] as String?,
        siteField3Desc = json['siteField3Desc'] as String?,
        siteField4Desc = json['siteField4Desc'] as String?,
        siteField5Desc = json['siteField5Desc'] as String?,
        siteField6Desc = json['siteField6Desc'] as String?,
        siteField7Desc = json['siteField7Desc'] as String?,
        siteField8Desc = json['siteField8Desc'] as String?,
        siteField9Desc = json['siteField9Desc'] as String?,
        siteField10Desc = json['siteField10Desc'] as String?,
        check1Desc = json['check1Desc'] as String?,
        check2Desc = json['check2Desc'] as String?,
        check3Desc = json['check3Desc'] as String?,
        check4Desc = json['check4Desc'] as String?,
        check5Desc = json['check5Desc'] as String?,
        check6Desc = json['check6Desc'] as String?,
        check7Desc = json['check7Desc'] as String?,
        check8Desc = json['check8Desc'] as String?,
        check9Desc = json['check9Desc'] as String?,
        check10Desc = json['check10Desc'] as String?,
        check11Desc = json['check11Desc'] as String?,
        check12Desc = json['check12Desc'] as String?,
        check13Desc = json['check13Desc'] as String?,
        check14Desc = json['check14Desc'] as String?,
        check15Desc = json['check15Desc'] as String?,
        jobField1Desc = json['jobField1Desc'] as String?,
        jobField2Desc = json['jobField2Desc'] as String?,
        jobField3Desc = json['jobField3Desc'] as String?,
        jobField4Desc = json['jobField4Desc'] as String?,
        jobField5Desc = json['jobField5Desc'] as String?,
        jobField6Desc = json['jobField6Desc'] as String?,
        jobField7Desc = json['jobField7Desc'] as String?,
        jobField8Desc = json['jobField8Desc'] as String?,
        jobField9Desc = json['jobField9Desc'] as String?,
        jobField10Desc = json['jobField10Desc'] as String?,
        jobField11Desc = json['jobField11Desc'] as String?,
        jobField12Desc = json['jobField12Desc'] as String?,
        jobField13Desc = json['jobField13Desc'] as String?,
        jobField14Desc = json['jobField14Desc'] as String?,
        jobField15Desc = json['jobField15Desc'] as String?,
        jobField16Desc = json['jobField16Desc'] as String?,
        jobField17Desc = json['jobField17Desc'] as String?,
        jobField18Desc = json['jobField18Desc'] as String?,
        jobField19Desc = json['jobField19Desc'] as String?;

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
}

class JobStatusDetailsDto {
  JobStatusDetailsDto(Map<String, dynamic> json)
      : allowChangeInJobDetails = json['allowChangeInJobDetails'] as bool?,
        jobStatusType = json['jobStatusType'] as String,
        jobStatusDesc = json['jobStatusDesc'] as String,
        jobStatusCode = json['jobStatusCode'] as String,
        jobStatus = json['jobStatus'] as String,
        quotedProvided = json['quotedProvided'] as String?,
        mainJobStatusType = json['mainJobStatusType'] as String;

  bool? allowChangeInJobDetails;
  String jobStatusType;
  String jobStatusDesc;
  String jobStatusCode;
  String jobStatus;
  String? quotedProvided;
  String mainJobStatusType;
}

class JobClassDetailsDto {
  JobClassDetailsDto(Map<String, dynamic> json)
      : jobClassName = json['jobClassName'] as String?,
        jobClassCode = json['jobClassCode'] as String?;

  String? jobClassName;
  String? jobClassCode;
}

class RegionDetailsDto {
  RegionDetailsDto(Map<String, dynamic> json)
      : regionName = json['regionName'] as String?,
        timeOffset = json['timeOffset'] as double?,
        timeOffsetDateTime = json['timeOffsetDateTime'] != null
            ? DateTime.parse(json['timeOffsetDateTime'] as String)
            : null,
        timeOfDay = json['timeOfDay'] != null
            ? DateTime.parse(json['timeOfDay'] as String)
            : null;

  String? regionName;
  double? timeOffset;
  DateTime? timeOffsetDateTime;
  DateTime? timeOfDay;
}

class WorkerJobDetailsDto {
  WorkerJobDetailsDto(Map<String, dynamic> json)
      : workerFullName = json['workerFullName'] as String?,
        createdByWorkerName = json['createdByWorkerName'] as String?;

  String? workerFullName;
  String? createdByWorkerName;
}

class JobVisitModelDetailsDto {
  JobVisitModelDetailsDto(Map<String, dynamic> json)
      : paymentMethodId = json['paymentMethodId'] as int?,
        visitWorkerId = json['visitWorkerId'] as int?,
        createdByWorkerId = json['createdByWorkerId'] as int?,
        workerStartTimeAgree = json['workerStartTimeAgree'] as int?,
        workerFinishTimeAgree = json['workerFinishTimeAgree'] as int?,
        workerPaymentCollectedAgree =
            json['workerPaymentCollectedAgree'] as int?,
        workerPaymentMethodAgree = json['workerPaymentMethodAgree'] as int?,
        paymentDue = json['paymentDue'] as double?,
        paymentDueStr = json['paymentDueStr'] as String?,
        reminderMessage = json['reminderMessage'] as String?,
        reminderTime = json['reminderTime'] != null
            ? DateTime.parse(json['reminderTime'] as String)
            : null,
        visitStatusReasonId = json['visitStatusReasonId'] as int?,
        visitStatusReasonId2 = json['visitStatusReasonId2'] as int?,
        visitStatusReasonId3 = json['visitStatusReasonId3'] as int?,
        supervisorCode = json['supervisorCode'] as String?,
        startTime = json['startTime'] != null
            ? DateTime.parse(json['startTime'] as String)
            : null,
        finishTime = json['finishTime'] != null
            ? DateTime.parse(json['finishTime'] as String)
            : null,
        paymentCollected = json['paymentCollected'] as double?,
        paymentCollectedStr = json['paymentCollectedStr'] as String?,
        customerSmsSentDate = json['customerSmsSentDate'] != null
            ? DateTime.parse(json['customerSmsSentDate'] as String)
            : null,
        customerSendsms = json['customerSendsms'] as bool?,
        jobIdRef = json['jobIdRef'] as int?,
        siteIdRef = json['siteIdRef'] as int?,
        jobTypeIdRef = json['jobTypeIdRef'] as int?,
        jobTypeId = json['jobTypeId'] as int?,
        visitWorkerIdRef = json['visitWorkerIdRef'] as int?,
        loggedWorkerId = json['loggedWorkerId'] as int?,
        jobPoints = json['jobPoints'] as int?,
        preInstallCallAttempts = json['preInstallCallAttempts'] as int?,
        preInstallCallCompleted = json['preInstallCallCompleted'] as bool?,
        visitStatusId = json['visitStatusId'] as int?,
        logisticsConfirmed = json['logisticsConfirmed'] as bool?,
        clientVisitNumber = json['clientVisitNumber'] as String?,
        isShowTimeDifference = json['isShowTimeDifference'] as bool?,
        bookedDate = json['bookedDate'] != null
            ? DateTime.parse(json['bookedDate'] as String)
            : null,
        bookedDateStr = json['bookedDateStr'] as String?,
        projectRegionId = json['projectRegionId'] as int?,
        jobVisitId = json['jobVisitId'] as int?,
        createdByProcess = json['createdByProcess'] as String?,
        dateCreated = DateTime.parse(json['dateCreated'] as String),
        dateReconciled = json['dateReconciled'] != null
            ? DateTime.parse(json['dateReconciled'] as String)
            : null,
        technicianId = json['technicianId'] as String?,
        bookedTimeSlot = json['bookedTimeSlot'] as String?,
        routeSequence = json['routeSequence'] as String?,
        jobViewedDate = json['jobViewedDate'] as String?,
        acceptedDate = json['acceptedDate'] as String?,
        otherFsts = json['otherFsts'] as String?,
        partner = json['partner'] as String?,
        product = json['product'] as String?,
        storeLocation = json['storeLocation'] as String?,
        pabtimeslot = json['pabtimeslot'] as String?,
        pabDate = json['pabDate'] != null
            ? DateTime.parse(json['pabDate'] as String)
            : null,
        pabDateStr = json['pabDateStr'] as String?,
        nextCallDate = json['nextCallDate'] != null
            ? DateTime.parse(json['nextCallDate'] as String)
            : null,
        isNextCallDate = json['isNextCallDate'] as bool?,
        isActionDuedate = json['isActionDuedate'] as bool?,
        actionDueTime = json['actionDueTime'] != null
            ? DateTime.parse(json['actionDueTime'] as String)
            : null,
        otdRescheduleRequested = json['otdRescheduleRequested'] as bool?,
        routingAlert = json['routingAlert'] as String?,
        smsSentDate = json['smsSentDate'] != null
            ? DateTime.parse(json['smsSentDate'] as String)
            : null,
        viewedDate = json['viewedDate'] != null
            ? DateTime.parse(json['viewedDate'] as String)
            : null,
        acceptDate = json['acceptDate'] != null
            ? DateTime.parse(json['acceptDate'] as String)
            : null,
        priority = json['priority'] as String?,
        jobVisitField1 = json['jobVisitField1'] as String?,
        jobVisitField2 = json['jobVisitField2'] as String?,
        jobVisitField3 = json['jobVisitField3'] as String?,
        jobVisitField4 = json['jobVisitField4'] as String?,
        jobVisitField5 = json['jobVisitField5'] as String?,
        jobVisitField6 = json['jobVisitField6'] as String?,
        jobVisitField7 = json['jobVisitField7'] as String?,
        jobVisitField8 = json['jobVisitField8'] as String?,
        jobVisitField9 = json['jobVisitField9'] as String?,
        jobVisitField10 = json['jobVisitField10'] as String?,
        jobVisitField11 = json['jobVisitField11'] as String?,
        jobVisitField12 = json['jobVisitField12'] as String?,
        jobVisitField13 = json['jobVisitField13'] as String?,
        jobVisitField14 = json['jobVisitField14'] as String?,
        jobVisitField15 = json['jobVisitField15'] as String?,
        jobVisitField16 = json['jobVisitField16'] as String?,
        jobVisitField17 = json['jobVisitField17'] as String?,
        jobVisitField18 = json['jobVisitField18'] as String?,
        jobVisitField19 = json['jobVisitField19'],
        jobVisitField20 = json['jobVisitField20'],
        customerSatisfaction = json['customerSatisfaction'] as int?,
        overallInspection = json['overallInspection'] as int?,
        surveyRequired = json['surveyRequired'] as bool?,
        surveyCompleted = json['surveyCompleted'] as bool?,
        qiRequired = json['qiRequired'] as bool?,
        qiCompleted = json['qiCompleted'] as bool?,
        discontinued = json['discontinued'] as bool?,
        itemTypeId = json['itemTypeId'] as int?,
        timeSlotId = json['timeSlotId'] as int?,
        limitedUser = json['limitedUser'] as bool?,
        isRequestSchedule = json['isRequestSchedule'] as bool?,
        technicianName = json['technicianName'] as String?,
        whPickupLocation = json['whPickupLocation'] as String?,
        salesRepId = json['salesRepId'] as String?,
        smsSendDate = json['smsSendDate'] as String?,
        overrideRoutingWarningMessage =
            json['overrideRoutingWarningMessage'] as String?;

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
  String? bookedTimeSlot;
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
}

class OriginalValuesDto {
  OriginalValuesDto(Map<String, dynamic> json)
      : jobVisitField1 = json['jobVisitField1'] as String?,
        jobVisitField2 = json['jobVisitField2'] as String?,
        jobVisitField3 = json['jobVisitField3'] as String?,
        jobVisitField4 = json['jobVisitField4'] as String?,
        jobVisitField5 = json['jobVisitField5'] as String?,
        jobVisitField6 = json['jobVisitField6'] as String?,
        jobVisitField7 = json['jobVisitField7'] as String?,
        jobVisitField8 = json['jobVisitField8'] as String?,
        jobVisitField9 = json['jobVisitField9'] as String?,
        jobVisitField10 = json['jobVisitField10'] as String?,
        jobVisitField11 = json['jobVisitField11'] as String?,
        jobVisitField12 = json['jobVisitField12'] as String?,
        jobVisitField13 = json['jobVisitField13'] as String?,
        jobVisitField14 = json['jobVisitField14'] as String?,
        jobVisitField15 = json['jobVisitField15'] as String?,
        jobVisitField16 = json['jobVisitField16'] as String?,
        jobVisitField17 = json['jobVisitField17'] as String?,
        jobVisitField18 = json['jobVisitField18'] as String?,
        jobVisitField19 = json['jobVisitField19'] as String?,
        jobVisitField20 = json['jobVisitField20'] as String?,
        jobCheck1 = json['jobCheck1'] as bool?,
        jobCheck2 = json['jobCheck2'] as bool?,
        jobCheck3 = json['jobCheck3'] as bool?,
        jobCheck4 = json['jobCheck4'] as bool?,
        jobCheck5 = json['jobCheck5'] as bool?,
        jobCheck6 = json['jobCheck6'] as bool?,
        jobCheck7 = json['jobCheck7'] as bool?,
        jobCheck8 = json['jobCheck8'] as bool?,
        jobCheck9 = json['jobCheck9'] as bool?,
        jobCheck10 = json['jobCheck10'] as bool?,
        jobCheck11 = json['jobCheck11'] as bool?,
        jobCheck12 = json['jobCheck12'] as bool?,
        jobCheck13 = json['jobCheck13'] as bool?,
        jobCheck14 = json['jobCheck14'] as bool?,
        jobCheck15 = json['jobCheck15'] as bool?,
        jobField1 = json['jobField1'] as String?,
        jobField2 = json['jobField2'] as String?,
        jobField3 = json['jobField3'] as String?,
        jobField4 = json['jobField4'] as String?,
        jobField5 = json['jobField5'] as String?,
        jobField6 = json['jobField6'] as String?,
        jobField7 = json['jobField7'] as String?,
        jobField8 = json['jobField8'] as String?,
        jobField9 = json['jobField9'] as String?,
        jobField10 = json['jobField10'] as String?,
        jobField11 = json['jobField11'] as String?,
        jobField12 = json['jobField12'] as String?,
        jobField13 = json['jobField13'] as String?,
        jobField14 = json['jobField14'] as String?,
        jobField15 = json['jobField15'] as String?,
        jobField16 = json['jobField16'] as String?,
        jobField17 = json['jobField17'] as String?,
        jobField18 = json['jobField18'] as String?,
        jobField19 = json['jobField19'] as String?;

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
}

class SaveJobLogsReqDto {
  SaveJobLogsReqDto(Map<String, dynamic> json)
      : communicationSaveDtoList =
            List.of(json['communicationSaveDtoList'] as Iterable<dynamic>)
                .map((item) => CustomerCommunicationSaveDto(
                      item as Map<String, dynamic>,
                    ))
                .toList(),
        logDtoList = List.of(json['logDtoList'] as Iterable<dynamic>)
            .map((item) => LogDto(item as Map<String, dynamic>))
            .toList();

  List<CustomerCommunicationSaveDto> communicationSaveDtoList = [];
  List<LogDto> logDtoList = [];
}

class SavePicInformationReqDto {
  SavePicInformationReqDto(Map<String, dynamic> json)
      : updatedRoutingAlert = json['updatedRoutingAlert'] as String?,
        goodsAtHome = json['goodsAtHome'] as bool?,
        timeSlotConfirmed = json['timeSlotConfirmed'] as bool?,
        addressConfirmed = json['addressConfirmed'] as bool?,
        scopesConfirmed = json['scopesConfirmed'] as bool?,
        amountOutstanding = json['amountOutstanding'] as bool?,
        antennaScopes = json['antennaScopes'] as bool?,
        speakerMountingScopes = json['speakerMountingScopes'] as bool?,
        dwellingType = json['dwellingType'] as String?,
        storeyDwelling = json['storeyDwelling'] as String?,
        roofing = json['roofing'] as String?,
        doesRoofHaveManhole = json['doesRoofHaveManhole'] as bool?,
        cabling = json['cabling'] as String?,
        newOutletNeeded = json['newOutletNeeded'] as bool?,
        ductRequired = json['ductRequired'] as String?,
        speciallAdderRequirement = json['speciallAdderRequirement'] as String?,
        strataBodyCorporatePermissionTaken =
            json['strataBodyCorporatePermissionTaken'] as String?,
        mountingSection = json['mountingSection'] as String?,
        roofAccessGiven = json['roofAccessGiven'] as bool?,
        powerPointInlocationIfWirelessSpeakers =
            json['powerPointInlocationIfWirelessSpeakers'] as bool?,
        screenSize = json['screenSize'] as String?,
        picComments = json['picComments'] as String?,
        picChecked = json['picChecked'] as bool?,
        sMSChecked = json['sMSChecked'] as bool?,
        oldPreInstallCallAttempts =
            json['oldPreInstallCallAttempts'] as String?,
        jobVisitId = json['jobVisitId'] as int?,
        jobId = json['jobId'] as int?,
        numericUpDown1 = json['numericUpDown1'] as int?,
        loggedWorkerId = json['loggedWorkerId'] as int?,
        isPICInfoCreated = json['isPICInfoCreated'] as bool?;

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
}

class CustomerCommunicationSaveDto {
  CustomerCommunicationSaveDto(Map<String, dynamic> json)
      : customerId = json['customerId'] as int?,
        comment = json['comment'] as String?,
        reasonId = json['reasonId'] as int?,
        requireFollowUp = json['requireFollowUp'] as bool,
        siteId = json['siteId'] as int;

  int? customerId;
  String? comment;
  int? reasonId;
  bool requireFollowUp = false;
  int siteId = 0;
}

class LogDto {
  LogDto(Map<String, dynamic> json)
      : logId = json['logId'] as int,
        id = json['id'] as int?,
        idtype = json['idtype'] as String,
        logType = json['logType'] as String,
        workerId = json['workerId'] as int?,
        eventDate = DateTime.parse(json['eventDate'] as String),
        logDate = DateTime.parse(json['logDate'] as String),
        eventDesc = json['eventDesc'] as String?,
        tableChanged = json['tableChanged'] as String?,
        fieldChanged = json['fieldChanged'] as String?,
        oldValue = json['oldValue'] as String?,
        newValue = json['newValue'] as String?,
        amount = json['amount'] as double?,
        silcarId = json['silcarId'] as int?;

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
}
