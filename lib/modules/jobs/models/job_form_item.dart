class JobFormDto {
  JobFormDto(
    this.formId,
    this.formName,
    this.formDesc,
    this.jobNumber,
    this.frequency,
    this.filled,
    this.formCompleted,
    this.formAction,
    this.linkEvent,
    this.formResponseId,
    this.dateCreated, {
    required this.mandatory,
  });

  JobFormDto.fromJson(Map<String, dynamic> json)
      : formId = json['formId'] as int,
        formName = json['formName'] as String,
        formDesc = json['formDesc'] as String?,
        jobNumber = json['jobNumber'] as int,
        frequency = json['frequency'] as String?,
        mandatory = json['mandatory'] as bool,
        filled = json['filled'] as int,
        formCompleted = json['formCompleted'] as String?,
        formAction = json['formAction'] as String?,
        linkEvent = json['linkEvent'] as String?,
        formResponseId = json['formResponseId'] as int,
        dateCreated = json['dateCreated'] != null
            ? DateTime.parse(json['dateCreated'] as String)
            : null;

  int formId;
  String formName;
  String? formDesc;
  int jobNumber;
  String? frequency;
  bool mandatory;
  int filled;
  String? formCompleted;
  String? formAction;
  String? linkEvent;
  int formResponseId;
  DateTime? dateCreated;
}
