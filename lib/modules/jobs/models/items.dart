import 'package:tech2/interfaces/has_map.dart';

class JobItemTaskCodesDto implements Mappable {
  JobItemTaskCodesDto(Map<String, dynamic> json)
      : jobItemId = json['jobItemId'] as int?,
        jobId = json['jobId'] as int?,
        itemId = json['itemId'] as int?,
        itemCode = json['itemCode'] as String,
        itemName = json['itemName'] as String,
        quoteJobVisitId = json['quoteJobVisitId'] as int?,
        usedJobVisitId = json['usedJobVisitId'] as int?,
        techAgreeCode = json['techAgreeCode'] as String?,
        saleAmount = json['saleAmount'] as String,
        discountAmount = json['discountAmount'] as String,
        netAmount = json['netAmount'] as String,
        itemCodeName = json['itemCodeName'] as String,
        itemDeleted = json['itemDeleted'] as bool?,
        invoiceId = json['invoiceId'] as int?,
        franchiseePaymentId = json['franchiseePaymentId'] as int?,
        franchiseeDrpaymentId = json['franchiseeDrpaymentId'] as int?,
        projectPeriodId = json['projectPeriodId'] as int?,
        payPeriodId = json['payPeriodId'] as int?,
        billToCustomerId = json['billToCustomerId'] as int?,
        customerContractEntitlementId =
            json['customerContractEntitlementId'] as int?,
        oktoBill = json['oktoBill'] as bool?,
        oktoPay = json['oktoPay'] as bool?,
        invoiceNumber = json['invoiceNumber'] as String?,
        paymentDate = json['paymentDate'] != null
            ? DateTime.parse(json['paymentDate'] as String)
            : null,
        createdByProcess = json['createdByProcess'] as String?,
        parentJobItemId = json['parentJobItemId'] as int?,
        jobStatusType = json['jobStatusType'] as String?,
        fullName = json['fullName'] as String,
        outofhours = json['outofhours'] as bool?,
        companyName = json['companyName'] as String,
        jobItemTransIdPay = json['jobItemTransIdPay'] as int?,
        quoteQty = json['quoteQty'] as double?,
        qty = json['qty'] as double?,
        adminAgreeCode = json['adminAgreeCode'] as String?,
        workUnits = json['workUnits'] as double,
        skipNextClaim = json['skipNextClaim'] as bool?,
        skipNextPayment = json['skipNextPayment'] as bool?,
        custAgreeCode = json['custAgreeCode'] as String?,
        isExtractedBill = json['isExtractedBill'] as bool?,
        isExtractedPay = json['isExtractedPay'] as bool?,
        isLockedBill = json['isLockedBill'] as bool?,
        isLockedPay = json['isLockedPay'] as bool?,
        enableOutOfHours = json['enableOutOfHours'] as bool?,
        periodEndDate = json['periodEndDate'] as String?,
        visitStatusId = json['visitStatusId'] as int?,
        navId = json['navId'] as String?;

  int? jobItemId;
  int? jobId;
  int? itemId;
  String itemCode;
  String itemName;
  int? quoteJobVisitId;
  int? usedJobVisitId;
  String? techAgreeCode;
  String saleAmount;
  String discountAmount;
  String netAmount;
  String itemCodeName;
  bool? itemDeleted;
  int? invoiceId;
  int? franchiseePaymentId;
  int? franchiseeDrpaymentId;
  int? projectPeriodId;
  int? payPeriodId;
  int? billToCustomerId;
  int? customerContractEntitlementId;
  bool? oktoBill;
  bool? oktoPay;
  String? invoiceNumber;
  DateTime? paymentDate;
  String? createdByProcess;
  int? parentJobItemId;
  String? jobStatusType;
  String fullName;
  bool? outofhours;
  String companyName;
  int? jobItemTransIdPay;
  double? quoteQty;
  double? qty;
  String? adminAgreeCode;
  double workUnits;
  bool? skipNextClaim;
  bool? skipNextPayment;
  String? custAgreeCode;
  bool? isExtractedBill;
  bool? isExtractedPay;
  bool? isLockedBill;
  bool? isLockedPay;
  bool? enableOutOfHours;
  String? periodEndDate;
  int? visitStatusId;
  String? navId;

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobItemId': jobItemId,
      'jobId': jobId,
      'itemId': itemId,
      'itemCode': itemCode,
      'itemName': itemName,
      'quoteJobVisitId': quoteJobVisitId,
      'usedJobVisitId': usedJobVisitId,
      'techAgreeCode': techAgreeCode,
      'saleAmount': saleAmount,
      'discountAmount': discountAmount,
      'netAmount': netAmount,
      'itemCodeName': itemCodeName,
      'itemDeleted': itemDeleted,
      'invoiceId': invoiceId,
      'franchiseePaymentId': franchiseePaymentId,
      'franchiseeDrpaymentId': franchiseeDrpaymentId,
      'projectPeriodId': projectPeriodId,
      'payPeriodId': payPeriodId,
      'billToCustomerId': billToCustomerId,
      'customerContractEntitlementId': customerContractEntitlementId,
      'oktoBill': oktoBill,
      'oktoPay': oktoPay,
      'invoiceNumber': invoiceNumber,
      'paymentDate': paymentDate,
      'createdByProcess': createdByProcess,
      'parentJobItemId': parentJobItemId,
      'jobStatusType': jobStatusType,
      'fullName': fullName,
      'outofhours': outofhours,
      'companyName': companyName,
      'jobItemTransIdPay': jobItemTransIdPay,
      'quoteQty': quoteQty,
      'qty': qty,
      'adminAgreeCode': adminAgreeCode,
      'workUnits': workUnits,
      'skipNextClaim': skipNextClaim,
      'skipNextPayment': skipNextPayment,
      'custAgreeCode': custAgreeCode,
      'isExtractedBill': isExtractedBill,
      'isExtractedPay': isExtractedPay,
      'isLockedBill': isLockedBill,
      'isLockedPay': isLockedPay,
      'enableOutOfHours': enableOutOfHours,
      'periodEndDate': periodEndDate,
      'visitStatusId': visitStatusId,
      'navId': navId
    };
  }
}

class JobTypeItemByWorkerPermissionDto implements Mappable {
  JobTypeItemByWorkerPermissionDto(
    this.itemTypeid,
    this.jobTypeId,
    this.workerId, {
    required this.discontinued,
  });

  bool discontinued;
  int itemTypeid;
  int jobTypeId;
  int workerId;

  @override
  Map<String, dynamic> toMap() {
    return {
      'itemTypeid': itemTypeid,
      'jobTypeId': jobTypeId,
      'workerId': workerId,
      'discontinued': discontinued,
    };
  }
}

class JobItemsArgs {
  JobItemsArgs(
    this.jobId,
    this.jobTypeId,
    this.jobVisitId,
    this.projectId,
    this.projectRegionId,
    this.sourceCustomerId,
  );

  int jobId;
  int jobTypeId;
  int jobVisitId;
  int projectId;
  int projectRegionId;
  int sourceCustomerId;
}

class AddTaskCodeItemDto implements Mappable {
  AddTaskCodeItemDto(
    this.itemId,
    this.jobId,
    this.quantity,
    this.jobVisitId,
    this.projectId,
    this.loggedWorkerId,
    this.quantityTasks, {
    required this.isCheckMandatory,
  });

  int itemId;
  int jobId;
  int quantity;
  int jobVisitId;
  int projectId;
  int loggedWorkerId;
  bool isCheckMandatory;
  int quantityTasks;

  @override
  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'jobId': jobId,
      'quantity': quantity,
      'jobVisitId': jobVisitId,
      'projectId': projectId,
      'loggedWorkerId': loggedWorkerId,
      'isCheckMandatory': isCheckMandatory,
      'quantityTasks': quantityTasks
    };
  }
}

class DeleteItemDto implements Mappable {
  DeleteItemDto(
    this.jobItemId,
    this.jobId,
    this.jobVisitId,
    this.projectId,
    this.projectRegionId,
    this.sourceCustomerId,
    this.loggedWorkerId, {
    required this.isDeleted,
    required this.isCheckMandatory,
    required this.isShowDeleted,
  });

  bool isDeleted;
  bool isCheckMandatory;
  int jobItemId;
  int jobId;
  int jobVisitId;
  int projectId;
  int projectRegionId;
  int sourceCustomerId;
  int loggedWorkerId;
  bool isShowDeleted;

  @override
  Map<String, dynamic> toMap() {
    return {
      'isDeleted': isDeleted,
      'isCheckMandatory': isCheckMandatory,
      'jobItemId': jobItemId,
      'jobId': jobId,
      'jobVisitId': jobVisitId,
      'projectId': projectId,
      'projectRegionId': projectRegionId,
      'sourceCustomerId': sourceCustomerId,
      'loggedWorkerId': loggedWorkerId,
      'isShowDeleted': isShowDeleted
    };
  }
}

class SaveJobItemDto implements Mappable {
  SaveJobItemDto(
    this.jobItemId,
    this.quantity,
    this.discountAmount,
    this.jobVisitId,
    this.jobId,
    this.itemId, {
    required this.isJobAddNegativeQuantity,
    required this.okToPay,
    required this.okToBill,
    required this.skipNextClaim,
    required this.skipNextPayment,
    required this.isCheckMandatory,
  });

  int jobItemId;
  double quantity;
  bool isJobAddNegativeQuantity;
  bool okToPay;
  bool okToBill;
  double discountAmount;
  int jobVisitId;
  bool skipNextClaim;
  bool skipNextPayment;
  bool isCheckMandatory;
  int jobId;
  int itemId;

  @override
  Map<String, dynamic> toMap() {
    return {
      'jobItemId': jobItemId,
      'quantity': quantity,
      'isJobAddNegativeQuantity': isJobAddNegativeQuantity,
      'okToPay': okToPay,
      'okToBill': okToBill,
      'discountAmount': discountAmount,
      'jobVisitId': jobVisitId,
      'skipNextClaim': skipNextClaim,
      'skipNextPayment': skipNextPayment,
      'isCheckMandatory': isCheckMandatory,
      'jobId': jobId,
      'itemId': itemId,
    };
  }
}
