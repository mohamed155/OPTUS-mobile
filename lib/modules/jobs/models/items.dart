class JobItemTaskCodesDto {
  int jobItemId;
  int? jobId;
  int? itemId;
  String itemCode;
  String itemName;
  int? quoteJobVisitId;
  int? usedJobVisitId;
  String techAgreeCode;
  String saleAmount;
  String discountAmount;
  String netAmount;
  String itemCodeName;
  bool itemDeleted;
  int? invoiceId;
  int? franchiseePaymentId;
  int? franchiseeDrpaymentId;
  int? projectPeriodId;
  int? payPeriodId;
  int? billToCustomerId;
  int? customerContractEntitlementId;
  bool oktoBill;
  bool oktoPay;
  String invoiceNumber;
  DateTime? paymentDate;
  String createdByProcess;
  int? parentJobItemId;
  String jobStatusType;
  String fullName;
  bool? outofhours;
  String companyName;
  int jobItemTransIdPay;
  double? quoteQty;
  double? qty;
  String adminAgreeCode;
  double workUnits;
  bool skipNextClaim;
  bool skipNextPayment;
  String custAgreeCode;
  bool isExtractedBill;
  bool isExtractedPay;
  bool isLockedBill;
  bool isLockedPay;
  bool enableOutOfHours;
  String? periodEndDate;
  int visitStatusId;
  String navId;

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
}
