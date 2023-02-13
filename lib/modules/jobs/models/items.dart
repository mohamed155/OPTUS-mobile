import 'package:tech2/interfaces/has_map.dart';

class JobItemTaskCodesDto implements Mappable {
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

  JobItemTaskCodesDto(Map<String, dynamic> json)
      : jobItemId = json['jobItemId'],
        jobId = json['jobId'],
        itemId = json['itemId'],
        itemCode = json['itemCode'],
        itemName = json['itemName'],
        quoteJobVisitId = json['quoteJobVisitId'],
        usedJobVisitId = json['usedJobVisitId'],
        techAgreeCode = json['techAgreeCode'],
        saleAmount = json['saleAmount'],
        discountAmount = json['discountAmount'],
        netAmount = json['netAmount'],
        itemCodeName = json['itemCodeName'],
        itemDeleted = json['itemDeleted'],
        invoiceId = json['invoiceId'],
        franchiseePaymentId = json['franchiseePaymentId'],
        franchiseeDrpaymentId = json['franchiseeDrpaymentId'],
        projectPeriodId = json['projectPeriodId'],
        payPeriodId = json['payPeriodId'],
        billToCustomerId = json['billToCustomerId'],
        customerContractEntitlementId = json['customerContractEntitlementId'],
        oktoBill = json['oktoBill'],
        oktoPay = json['oktoPay'],
        invoiceNumber = json['invoiceNumber'],
        paymentDate = json['paymentDate'] != null
            ? DateTime.parse(json['paymentDate'])
            : null,
        createdByProcess = json['createdByProcess'],
        parentJobItemId = json['parentJobItemId'],
        jobStatusType = json['jobStatusType'],
        fullName = json['fullName'],
        outofhours = json['outofhours'],
        companyName = json['companyName'],
        jobItemTransIdPay = json['jobItemTransIdPay'],
        quoteQty = json['quoteQty'],
        qty = json['qty'],
        adminAgreeCode = json['adminAgreeCode'],
        workUnits = json['workUnits'],
        skipNextClaim = json['skipNextClaim'],
        skipNextPayment = json['skipNextPayment'],
        custAgreeCode = json['custAgreeCode'],
        isExtractedBill = json['isExtractedBill'],
        isExtractedPay = json['isExtractedPay'],
        isLockedBill = json['isLockedBill'],
        isLockedPay = json['isLockedPay'],
        enableOutOfHours = json['enableOutOfHours'],
        periodEndDate = json['periodEndDate'],
        visitStatusId = json['visitStatusId'],
        navId = json['navId'];

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
  bool discontinued;
  int itemTypeid;
  int jobTypeId;
  int workerId;

  JobTypeItemByWorkerPermissionDto(
      this.discontinued, this.itemTypeid, this.jobTypeId, this.workerId);

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
  int jobId;
  int jobTypeId;
  int jobVisitId;
  int projectId;
  int projectRegionId;
  int sourceCustomerId;

  JobItemsArgs(this.jobId, this.jobTypeId, this.jobVisitId, this.projectId,
      this.projectRegionId, this.sourceCustomerId);
}

class AddTaskCodeItemDto implements Mappable {
  int itemId;
  int jobId;
  int quantity;
  int jobVisitId;
  int projectId;
  int loggedWorkerId;
  bool isCheckMandatory;
  int quantityTasks;

  AddTaskCodeItemDto(
      this.itemId,
      this.jobId,
      this.quantity,
      this.jobVisitId,
      this.projectId,
      this.loggedWorkerId,
      this.isCheckMandatory,
      this.quantityTasks);

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

  DeleteItemDto(
      this.isDeleted,
      this.isCheckMandatory,
      this.jobItemId,
      this.jobId,
      this.jobVisitId,
      this.projectId,
      this.projectRegionId,
      this.sourceCustomerId,
      this.loggedWorkerId,
      this.isShowDeleted);

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

  SaveJobItemDto(
      this.jobItemId,
      this.quantity,
      this.isJobAddNegativeQuantity,
      this.okToPay,
      this.okToBill,
      this.discountAmount,
      this.jobVisitId,
      this.skipNextClaim,
      this.skipNextPayment,
      this.isCheckMandatory,
      this.jobId,
      this.itemId);

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
