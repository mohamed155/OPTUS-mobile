import 'package:tech2/interfaces/has_map.dart';

class JobVisitModel implements Mappable {
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
        customerCreditInfoId = json['customerCreditInfoId'] as int?,
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
        firstCollectionByWorkerId = json['firstCollectionByWorkerId'] as int?,
        firstCollectionWorkerName =
            json['firstCollectionWorkerName'] as String?,
        secondCollectionDate = json['secondCollectionDate'] != null
            ? DateTime.parse(json['secondCollectionDate'] as String)
            : null,
        secondCollectionByWorkerId = json['secondCollectionByWorkerId'] as int?,
        secondCollectionWorkerName =
            json['secondCollectionWorkerName'] as String?,
        collectionLetterDate = json['collectionLetterDate'] != null
            ? DateTime.parse(json['collectionLetterDate'] as String)
            : null,
        collectionLetterByWorkerId = json['collectionLetterByWorkerId'] as int?,
        collectionLetterWorkerName =
            json['collectionLetterWorkerName'] as String?,
        collectionAgencyDate = json['collectionAgencyDate'] != null
            ? DateTime.parse(json['collectionAgencyDate'] as String)
            : null,
        collectionAgencyByWorkerId = json['collectionAgencyByWorkerId'] as int?,
        collectionAgencyWorkerName =
            json['collectionAgencyWorkerName'] as String?,
        sendCollectionLetterDate = json['sendCollectionLetterDate'] != null
            ? DateTime.parse(json['sendCollectionLetterDate'] as String)
            : null,
        sendCollectionLetterByWorkerId =
            json['sendCollectionLetterByWorkerId'] as int?,
        sendCollectionLetterByWorkerName =
            json['sendCollectionLetterByWorkerName'] as String?,
        isMissingPaymentAction = json['isMissingPaymentAction'] as bool?,
        oktobillallowed = json['oktobillallowed'] as bool?,
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
                json['saveJobLogsReqDto'] as Map<String, dynamic>,
              )
            : null,
        savePicInformationReqDto = null,
        isSendSmsMissingPaymentCall =
            json['isSendSmsMissingPaymentCall'] as bool?,
        isCheckFirstMissingPaymentCall =
            json['isCheckFirstMissingPaymentCall'] as bool?,
        isCheckSecondMissingPaymentCall =
            json['isCheckSecondMissingPaymentCall'] as bool?,
        jobOpenTime = json['jobOpenTime'] != null
            ? DateTime.parse(json['jobOpenTime'] as String)
            : null,
        customerEmail = json['customerEmail'] as String?,
        customerMobile = json['customerMobile'] as String?,
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobDetailsDto': jobDetailsDto.toMap(),
      'siteDetailsDto': siteDetailsDto.toMap(),
      'jobTypeDetailsDto': jobTypeDetailsDto.toMap(),
      'projectDetailsDto': projectDetailsDto.toMap(),
      'jobStatusDetailsDto': jobStatusDetailsDto.toMap(),
      'jobClassDetailsDto': jobClassDetailsDto.toMap(),
      'regionDetailsDto': regionDetailsDto.toMap(),
      'workerJobDetailsDto': workerJobDetailsDto.toMap(),
      'jobVisitModelDetailsDto': jobVisitModelDetailsDto.toMap(),
      'originalValuesDto': originalValuesDto.toMap(),
      'lockClass': lockClass,
      'customerCreditInfoId': customerCreditInfoId,
      'summaryLockMessage': summaryLockMessage,
      'lockMessage': lockMessage,
      'bigStatus': bigStatus,
      'sliceLockMessage': sliceLockMessage,
      'timeOfDayRunTime': timeOfDayRunTime?.toIso8601String(),
      'status': status,
      'fulfillmentTotal': fulfillmentTotal,
      'equipmentTotal': equipmentTotal,
      'jobTotalTextBox': jobTotalTextBox,
      'firstCollectionDate': firstCollectionDate?.toIso8601String(),
      'firstCollectionByWorkerId': firstCollectionByWorkerId,
      'firstCollectionWorkerName': firstCollectionWorkerName,
      'secondCollectionDate': secondCollectionDate?.toIso8601String(),
      'secondCollectionByWorkerId': secondCollectionByWorkerId,
      'secondCollectionWorkerName': secondCollectionWorkerName,
      'collectionLetterDate': collectionLetterDate?.toIso8601String(),
      'collectionLetterByWorkerId': collectionLetterByWorkerId,
      'collectionLetterWorkerName': collectionLetterWorkerName,
      'collectionAgencyDate': collectionAgencyDate?.toIso8601String(),
      'collectionAgencyByWorkerId': collectionAgencyByWorkerId,
      'collectionAgencyWorkerName': collectionAgencyWorkerName,
      'sendCollectionLetterDate': sendCollectionLetterDate?.toIso8601String(),
      'sendCollectionLetterByWorkerId': sendCollectionLetterByWorkerId,
      'sendCollectionLetterByWorkerName': sendCollectionLetterByWorkerName,
      'isMissingPaymentAction': isMissingPaymentAction,
      'oktobillallowed': oktobillallowed,
      'jobEnterDiscount': jobEnterDiscount,
      'jobDeleteConfirmedPayment': jobDeleteConfirmedPayment,
      'jobAllowLockOverride': jobAllowLockOverride,
      'jobPayRefundLessThan375': jobPayRefundLessThan375,
      'jobPayRefundBetween375And750': jobPayRefundBetween375And750,
      'jobPayRefundGreaterThan750': jobPayRefundGreaterThan750,
      'jobAllowReopenClosedCob': jobAllowReopenClosedCob,
      'jobLimitedUser': jobLimitedUser,
      'jobCheckCollectionAgency': jobCheckCollectionAgency,
      'jobUnClaimGeFinanceInvoice': jobUnClaimGeFinanceInvoice,
      'jobPayGeFinanceInvoice': jobPayGeFinanceInvoice,
      'jobChargeToGeFinance': jobChargeToGeFinance,
      'crmEditStoreWarehouseDetails': crmEditStoreWarehouseDetails,
      'jobAddNegativeQuantity': jobAddNegativeQuantity,
      'jobShowExpiredPromotions': jobShowExpiredPromotions,
      'jobEditClientVisitNumber': jobEditClientVisitNumber,
      'oktopayallowed': oktopayallowed,
      'jobChangeReasonCode': jobChangeReasonCode,
      'jobTickSkipClaimPayment': jobTickSkipClaimPayment,
      'jobEditClientRefNumber': jobEditClientRefNumber,
      'jobPicCompletedOverride': jobPicCompletedOverride,
      'jobPicSmsSentOverride': jobPicSmsSentOverride,
      'jobClearDirtyTow': jobClearDirtyTow,
      'jobChangeNpsScore': jobChangeNpsScore,
      'isUnlockJobVisit': isUnlockJobVisit,
      'saveJobLogsReqDto': saveJobLogsReqDto?.toMap(),
      'savePicInformationReqDto': savePicInformationReqDto?.toMap(),
      'isSendSmsMissingPaymentCall': isSendSmsMissingPaymentCall,
      'isCheckFirstMissingPaymentCall': isCheckFirstMissingPaymentCall,
      'isCheckSecondMissingPaymentCall': isCheckSecondMissingPaymentCall,
      'jobOpenTime': jobOpenTime?.toIso8601String(),
      'customerEmail': customerEmail,
      'customerMobile': customerMobile,
      'isCloseIssue': isCloseIssue,
      'lastUpdated': DateTime.now().toIso8601String(),
    };
  }
}

class JobDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobId': jobId,
      'sourceCustomerId': sourceCustomerId,
      'jobSourceProductId': jobSourceProductId,
      'jobNumber': jobNumber,
      'cancelDate': cancelDate?.toIso8601String(),
      'clientJobNumber': clientJobNumber,
      'completedDate': completedDate?.toIso8601String(),
      'contactName': contactName,
      'custContactName': custContactName,
      'custEmail': custEmail,
      'jobClassId': jobClassId,
      'custContact1': custContact1,
      'custContact2': custContact2,
      'requestDate': requestDate?.toIso8601String(),
      'requestDateStr': requestDateStr,
      'jobDesc': jobDesc,
      'followUpDate': followUpDate?.toIso8601String(),
      'followUpTime': followUpTime?.toIso8601String(),
      'followUpTimeStr': followUpTimeStr,
      'followUpDateAndTime': followUpDateAndTime,
      'jobSourceId': jobSourceId,
      'whlocationId': whlocationId,
      'jobField1': jobField1,
      'hnSalesPerson': hnSalesPerson,
      'whDistance': whDistance,
      'contractNo': contractNo,
      'jobSaleWorkerId': jobSaleWorkerId,
      'jobSaleWorkerIdStr': jobSaleWorkerIdStr,
      'clientRefNo': clientRefNo,
      'workerEmail': workerEmail,
      'workerLeaderEmail': workerLeaderEmail,
      'quoteProvidedDate': quoteProvidedDate?.toIso8601String(),
      'npsScore': npsScore,
      'fsdStartDate': fsdStartDate?.toIso8601String(),
      'nbnCivilsStartDate': nbnCivilsStartDate?.toIso8601String(),
      'jobLeadWorkerId': jobLeadWorkerId,
      'jobLeadWorkerIdStr': jobLeadWorkerIdStr,
      'routedTo': routedTo,
      'bal': bal,
      'balance': balance,
      'sameVisit': sameVisit,
      'isLockedJob': isLockedJob,
      'lockMessage': lockMessage,
      'lockUserName': lockUserName,
      'lockedTime': lockedTime?.toIso8601String(),
      'picComments': picComments,
      'jobField2': jobField2,
      'jobField3': jobField3,
      'jobField4': jobField4,
      'jobField5': jobField5,
      'jobField6': jobField6,
      'jobField8': jobField8,
      'jobField7': jobField7,
      'jobField7New': jobField7New,
      'jobField9': jobField9,
      'jobField9New': jobField9New,
      'jobField10': jobField10,
      'jobField10New': jobField10New,
      'jobField11': jobField11,
      'jobField12': jobField12,
      'jobField13': jobField13,
      'jobField14': jobField14,
      'jobField15': jobField15,
      'jobField16': jobField16,
      'jobField17': jobField17,
      'jobField18': jobField18,
      'jobField19': jobField19,
      'jobCheck1': jobCheck1,
      'jobCheck2': jobCheck2,
      'jobCheck3': jobCheck3,
      'jobCheck4': jobCheck4,
      'jobCheck5': jobCheck5,
      'jobCheck6': jobCheck6,
      'jobCheck7': jobCheck7,
      'jobCheck8': jobCheck8,
      'jobCheck9': jobCheck9,
      'jobCheck10': jobCheck10,
      'jobCheck11': jobCheck11,
      'jobCheck12': jobCheck12,
      'jobCheck13': jobCheck13,
      'jobCheck14': jobCheck14,
      'jobCheck15': jobCheck15,
      'addressConfirmed': addressConfirmed,
      'scopeConfirmed': scopeConfirmed,
      'antennaScope': antennaScope,
      'newOutletNeededResponse': newOutletNeededResponse,
      'speakerMountingScope': speakerMountingScope,
      'roofAccessGiven': roofAccessGiven,
      'powerPointInLocation': powerPointInLocation,
      'timeSlotConfirmed': timeSlotConfirmed,
      'amountOutstanding': amountOutstanding,
      'goodsAtHome': goodsAtHome,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }
}

class SiteDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'siteId': siteId,
      'latitude': latitude,
      'longitude': longitude,
      'simpleAddress': simpleAddress,
      'siteInfo': siteInfo,
      'siteCustomerId': siteCustomerId,
      'siteNameSimpleAddress': siteNameSimpleAddress,
      'customField1': customField1,
      'customField2': customField2,
      'customField3': customField3,
      'customField4': customField4,
      'customField5': customField5,
      'customField6': customField6,
      'customField7': customField7,
      'customField8': customField8,
      'customField9': customField9,
      'customField10': customField10,
    };
  }
}

class JobTypeDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'custMarkerColor': custMarkerColor,
      'rescheduleWizardId': rescheduleWizardId,
      'scheduleWizardId': scheduleWizardId,
      'cancelWizardId': cancelWizardId,
      'closingWizardId': closingWizardId,
      'flexibleScheduling': flexibleScheduling,
      'jobTypeCode': jobTypeCode,
      'truckRoll': truckRoll,
      'mainJobType': mainJobType,
      'contractSupportQueue': contractSupportQueue,
      'itSetupSupportQueue': itSetupSupportQueue,
      'operationSupportQueue': operationSupportQueue,
      'revenueJobType': revenueJobType,
    };
  }
}

class ProjectDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'requireCommentOnStockRemove': requireCommentOnStockRemove,
      'preInstallMaxCalls': preInstallMaxCalls,
      'allowCustomerCommunicationTrace': allowCustomerCommunicationTrace,
      'projectCustomerId': projectCustomerId,
      'overrideStatusChange': overrideStatusChange,
      'allowedStatusByJobType': allowedStatusByJobType,
      'allowOpenClosedJob': allowOpenClosedJob,
      'allowChangeJobType': allowChangeJobType,
      'projectName': projectName,
      'projectCode': projectCode,
      'projectId': projectId,
      'isTpgProject': isTpgProject,
      'projectCodeRegionName': projectCodeRegionName,
      'jobVisitField1Desc': jobVisitField1Desc,
      'jobVisitField2Desc': jobVisitField2Desc,
      'jobVisitField3Desc': jobVisitField3Desc,
      'jobVisitField4Desc': jobVisitField4Desc,
      'jobVisitField5Desc': jobVisitField5Desc,
      'jobVisitField6Desc': jobVisitField6Desc,
      'jobVisitField7Desc': jobVisitField7Desc,
      'jobVisitField8Desc': jobVisitField8Desc,
      'jobVisitField9Desc': jobVisitField9Desc,
      'jobVisitField10Desc': jobVisitField10Desc,
      'jobVisitField11Desc': jobVisitField11Desc,
      'jobVisitField12Desc': jobVisitField12Desc,
      'jobVisitField13Desc': jobVisitField13Desc,
      'jobVisitField14Desc': jobVisitField14Desc,
      'jobVisitField15Desc': jobVisitField15Desc,
      'jobVisitField16Desc': jobVisitField16Desc,
      'jobVisitField17Desc': jobVisitField17Desc,
      'jobVisitField18Desc': jobVisitField18Desc,
      'jobVisitField19Desc': jobVisitField19Desc,
      'jobVisitField20Desc': jobVisitField20Desc,
      'siteField1Desc': siteField1Desc,
      'siteField2Desc': siteField2Desc,
      'siteField3Desc': siteField3Desc,
      'siteField4Desc': siteField4Desc,
      'siteField5Desc': siteField5Desc,
      'siteField6Desc': siteField6Desc,
      'siteField7Desc': siteField7Desc,
      'siteField8Desc': siteField8Desc,
      'siteField9Desc': siteField9Desc,
      'siteField10Desc': siteField10Desc,
      'check1Desc': check1Desc,
      'check2Desc': check2Desc,
      'check3Desc': check3Desc,
      'check4Desc': check4Desc,
      'check5Desc': check5Desc,
      'check6Desc': check6Desc,
      'check7Desc': check7Desc,
      'check8Desc': check8Desc,
      'check9Desc': check9Desc,
      'check10Desc': check10Desc,
      'check11Desc': check11Desc,
      'check12Desc': check12Desc,
      'check13Desc': check13Desc,
      'check14Desc': check14Desc,
      'check15Desc': check15Desc,
      'jobField1Desc': jobField1Desc,
      'jobField2Desc': jobField2Desc,
      'jobField3Desc': jobField3Desc,
      'jobField4Desc': jobField4Desc,
      'jobField5Desc': jobField5Desc,
      'jobField6Desc': jobField6Desc,
      'jobField7Desc': jobField7Desc,
      'jobField8Desc': jobField8Desc,
      'jobField9Desc': jobField9Desc,
      'jobField10Desc': jobField10Desc,
      'jobField11Desc': jobField11Desc,
      'jobField12Desc': jobField12Desc,
      'jobField13Desc': jobField13Desc,
      'jobField14Desc': jobField14Desc,
      'jobField15Desc': jobField15Desc,
      'jobField16Desc': jobField16Desc,
      'jobField17Desc': jobField17Desc,
      'jobField18Desc': jobField18Desc,
      'jobField19Desc': jobField19Desc,
    };
  }
}

class JobStatusDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'allowChangeInJobDetails': allowChangeInJobDetails,
      'jobStatusType': jobStatusType,
      'jobStatusDesc': jobStatusDesc,
      'jobStatusCode': jobStatusCode,
      'jobStatus': jobStatus,
      'quotedProvided': quotedProvided,
      'mainJobStatusType': mainJobStatusType,
    };
  }
}

class JobClassDetailsDto implements Mappable {
  JobClassDetailsDto(Map<String, dynamic> json)
      : jobClassName = json['jobClassName'] as String?,
        jobClassCode = json['jobClassCode'] as String?;

  String? jobClassName;
  String? jobClassCode;

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobClassName': jobClassName,
      'jobClassCode': jobClassCode,
    };
  }
}

class RegionDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'regionName': regionName,
      'timeOffset': timeOffset,
      'timeOffsetDateTime': timeOffsetDateTime?.toIso8601String(),
      'timeOfDay': timeOfDay?.toIso8601String(),
    };
  }
}

class WorkerJobDetailsDto implements Mappable {
  WorkerJobDetailsDto(Map<String, dynamic> json)
      : workerFullName = json['workerFullName'] as String?,
        createdByWorkerName = json['createdByWorkerName'] as String?;

  String? workerFullName;
  String? createdByWorkerName;

  @override
  Map<String, dynamic> toMap() {
    return {
      'workerFullName': workerFullName,
      'createdByWorkerName': createdByWorkerName,
    };
  }
}

class JobVisitModelDetailsDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'paymentMethodId': paymentMethodId,
      'visitWorkerId': visitWorkerId,
      'createdByWorkerId': createdByWorkerId,
      'workerStartTimeAgree': workerStartTimeAgree,
      'workerFinishTimeAgree': workerFinishTimeAgree,
      'workerPaymentCollectedAgree': workerPaymentCollectedAgree,
      'workerPaymentMethodAgree': workerPaymentMethodAgree,
      'paymentDue': paymentDue,
      'paymentDueStr': paymentDueStr,
      'reminderMessage': reminderMessage,
      'reminderTime': reminderTime?.toIso8601String(),
      'visitStatusReasonId': visitStatusReasonId,
      'visitStatusReasonId2': visitStatusReasonId2,
      'visitStatusReasonId3': visitStatusReasonId3,
      'supervisorCode': supervisorCode,
      'startTime': startTime?.toIso8601String(),
      'finishTime': finishTime?.toIso8601String(),
      'paymentCollected': paymentCollected,
      'paymentCollectedStr': paymentCollectedStr,
      'customerSmsSentDate': customerSmsSentDate?.toIso8601String(),
      'customerSendsms': customerSendsms,
      'jobIdRef': jobIdRef,
      'siteIdRef': siteIdRef,
      'jobTypeIdRef': jobTypeIdRef,
      'jobTypeId': jobTypeId,
      'visitWorkerIdRef': visitWorkerIdRef,
      'loggedWorkerId': loggedWorkerId,
      'jobPoints': jobPoints,
      'preInstallCallAttempts': preInstallCallAttempts,
      'preInstallCallCompleted': preInstallCallCompleted,
      'visitStatusId': visitStatusId,
      'logisticsConfirmed': logisticsConfirmed,
      'clientVisitNumber': clientVisitNumber,
      'isShowTimeDifference': isShowTimeDifference,
      'bookedDate': bookedDate?.toIso8601String(),
      'bookedDateStr': bookedDateStr,
      'projectRegionId': projectRegionId,
      'jobVisitId': jobVisitId,
      'createdByProcess': createdByProcess,
      'dateCreated': dateCreated.toIso8601String(),
      'dateReconciled': dateReconciled?.toIso8601String(),
      'technicianId': technicianId,
      'bookedTimeSlot': bookedTimeSlot,
      'routeSequence': routeSequence,
      'jobViewedDate': jobViewedDate,
      'acceptedDate': acceptedDate,
      'otherFsts': otherFsts,
      'partner': partner,
      'product': product,
      'storeLocation': storeLocation,
      'pabtimeslot': pabtimeslot,
      'pabDate': pabDate?.toIso8601String(),
      'pabDateStr': pabDateStr,
      'nextCallDate': nextCallDate?.toIso8601String(),
      'isNextCallDate': isNextCallDate,
      'isActionDuedate': isActionDuedate,
      'actionDueTime': actionDueTime?.toIso8601String(),
      'otdRescheduleRequested': otdRescheduleRequested,
      'routingAlert': routingAlert,
      'smsSentDate': smsSentDate?.toIso8601String(),
      'viewedDate': viewedDate?.toIso8601String(),
      'acceptDate': acceptDate?.toIso8601String(),
      'priority': priority,
      'jobVisitField1': jobVisitField1,
      'jobVisitField2': jobVisitField2,
      'jobVisitField3': jobVisitField3,
      'jobVisitField4': jobVisitField4,
      'jobVisitField5': jobVisitField5,
      'jobVisitField6': jobVisitField6,
      'jobVisitField7': jobVisitField7,
      'jobVisitField8': jobVisitField8,
      'jobVisitField9': jobVisitField9,
      'jobVisitField10': jobVisitField10,
      'jobVisitField11': jobVisitField11,
      'jobVisitField12': jobVisitField12,
      'jobVisitField13': jobVisitField13,
      'jobVisitField14': jobVisitField14,
      'jobVisitField15': jobVisitField15,
      'jobVisitField16': jobVisitField16,
      'jobVisitField17': jobVisitField17,
      'jobVisitField18': jobVisitField18,
      'jobVisitField19': jobVisitField19,
      'jobVisitField20': jobVisitField20,
      'customerSatisfaction': customerSatisfaction,
      'overallInspection': overallInspection,
      'surveyRequired': surveyRequired,
      'surveyCompleted': surveyCompleted,
      'qiRequired': qiRequired,
      'qiCompleted': qiCompleted,
      'discontinued': discontinued,
      'itemTypeId': itemTypeId,
      'timeSlotId': timeSlotId,
      'limitedUser': limitedUser,
      'isRequestSchedule': isRequestSchedule,
      'technicianName': technicianName,
      'whPickupLocation': whPickupLocation,
      'salesRepId': salesRepId,
      'smsSendDate': smsSendDate,
      'overrideRoutingWarningMessage': overrideRoutingWarningMessage,
    };
  }
}

class OriginalValuesDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobVisitField1': jobVisitField1,
      'jobVisitField2': jobVisitField2,
      'jobVisitField3': jobVisitField3,
      'jobVisitField4': jobVisitField4,
      'jobVisitField5': jobVisitField5,
      'jobVisitField6': jobVisitField6,
      'jobVisitField7': jobVisitField7,
      'jobVisitField8': jobVisitField8,
      'jobVisitField9': jobVisitField9,
      'jobVisitField10': jobVisitField10,
      'jobVisitField11': jobVisitField11,
      'jobVisitField12': jobVisitField12,
      'jobVisitField13': jobVisitField13,
      'jobVisitField14': jobVisitField14,
      'jobVisitField15': jobVisitField15,
      'jobVisitField16': jobVisitField16,
      'jobVisitField17': jobVisitField17,
      'jobVisitField18': jobVisitField18,
      'jobVisitField19': jobVisitField19,
      'jobVisitField20': jobVisitField20,
      'jobCheck1': jobCheck1,
      'jobCheck2': jobCheck2,
      'jobCheck3': jobCheck3,
      'jobCheck4': jobCheck4,
      'jobCheck5': jobCheck5,
      'jobCheck6': jobCheck6,
      'jobCheck7': jobCheck7,
      'jobCheck8': jobCheck8,
      'jobCheck9': jobCheck9,
      'jobCheck10': jobCheck10,
      'jobCheck11': jobCheck11,
      'jobCheck12': jobCheck12,
      'jobCheck13': jobCheck13,
      'jobCheck14': jobCheck14,
      'jobCheck15': jobCheck15,
      'jobField1': jobField1,
      'jobField2': jobField2,
      'jobField3': jobField3,
      'jobField4': jobField4,
      'jobField5': jobField5,
      'jobField6': jobField6,
      'jobField7': jobField7,
      'jobField8': jobField8,
      'jobField9': jobField9,
      'jobField10': jobField10,
      'jobField11': jobField11,
      'jobField12': jobField12,
      'jobField13': jobField13,
      'jobField14': jobField14,
      'jobField15': jobField15,
      'jobField16': jobField16,
      'jobField17': jobField17,
      'jobField18': jobField18,
      'jobField19': jobField19,
    };
  }
}

class SaveJobLogsReqDto implements Mappable {
  SaveJobLogsReqDto(Map<String, dynamic> json)
      : communicationSaveDtoList =
            List.of(json['communicationSaveDtoList'] as Iterable<dynamic>)
                .map(
                  (item) => CustomerCommunicationSaveDto(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList(growable: false),
        logDtoList = List.of(json['logDtoList'] as Iterable<dynamic>)
            .map((item) => LogDto(item as Map<String, dynamic>))
            .toList(growable: false);

  List<CustomerCommunicationSaveDto> communicationSaveDtoList = [];
  List<LogDto> logDtoList = [];

  @override
  Map<String, dynamic> toMap() {
    return {
      'communicationSaveDtoList': communicationSaveDtoList
          .map((e) => e.toMap())
          .toList(growable: false),
      'logDtoList': logDtoList.map((e) => e.toMap()).toList(growable: false),
    };
  }
}

class SavePicInformationReqDto implements Mappable {
  SavePicInformationReqDto({
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
    this.isPICInfoCreated,
  });

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

  @override
  Map<String, dynamic> toMap() {
    return {
      'updatedRoutingAlert': updatedRoutingAlert,
      'goodsAtHome': goodsAtHome,
      'timeSlotConfirmed': timeSlotConfirmed,
      'addressConfirmed': addressConfirmed,
      'scopesConfirmed': scopesConfirmed,
      'amountOutstanding': amountOutstanding,
      'antennaScopes': antennaScopes,
      'speakerMountingScopes': speakerMountingScopes,
      'dwellingType': dwellingType,
      'storeyDwelling': storeyDwelling,
      'roofing': roofing,
      'doesRoofHaveManhole': doesRoofHaveManhole,
      'cabling': cabling,
      'newOutletNeeded': newOutletNeeded,
      'ductRequired': ductRequired,
      'speciallAdderRequirement': speciallAdderRequirement,
      'strataBodyCorporatePermissionTaken': strataBodyCorporatePermissionTaken,
      'mountingSection': mountingSection,
      'roofAccessGiven': roofAccessGiven,
      'powerPointInlocationIfWirelessSpeakers':
          powerPointInlocationIfWirelessSpeakers,
      'screenSize': screenSize,
      'picComments': picComments,
      'picChecked': picChecked,
      'sMSChecked': sMSChecked,
      'oldPreInstallCallAttempts': oldPreInstallCallAttempts,
      'jobVisitId': jobVisitId,
      'jobId': jobId,
      'numericUpDown1': numericUpDown1,
      'loggedWorkerId': loggedWorkerId,
      'isPICInfoCreated': isPICInfoCreated,
    };
  }
}

class CustomerCommunicationSaveDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'comment': comment,
      'reasonId': reasonId,
      'requireFollowUp': requireFollowUp,
      'siteId': siteId,
    };
  }
}

class LogDto implements Mappable {
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

  @override
  Map<String, dynamic> toMap() {
    return {
      'logId': logId,
      'id': id,
      'idtype': idtype,
      'logType': logType,
      'workerId': workerId,
      'eventDate': eventDate.toIso8601String(),
      'logDate': logDate.toIso8601String(),
      'eventDesc': eventDesc,
      'tableChanged': tableChanged,
      'fieldChanged': fieldChanged,
      'oldValue': oldValue,
      'newValue': newValue,
      'amount': amount,
      'silcarId': silcarId,
    };
  }
}
