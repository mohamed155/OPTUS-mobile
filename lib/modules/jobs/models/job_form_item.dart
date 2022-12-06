class JobFormDto {
  late int formId;
  late String formName;
  String? formDesc;
  late int jobNumber;
  String? frequency;
  late bool mandatory;
  late int filled;
  late String formCompleted;
  late String formAction;
  String? linkEvent;
  late int formResponseId;
  late DateTime? dateCreated;

  JobFormDto(
      this.formId,
      this.formName,
      this.formDesc,
      this.jobNumber,
      this.frequency,
      this.mandatory,
      this.filled,
      this.formCompleted,
      this.formAction,
      this.linkEvent,
      this.formResponseId,
      this.dateCreated);

  factory JobFormDto.fromJson(Map<String, dynamic> json) {
    return JobFormDto(
        json['formId'],
        json['formName'],
        json['formDesc'],
        json['jobNumber'],
        json['frequency'],
        json['mandatory'],
        json['filled'],
        json['formCompleted'],
        json['formAction'],
        json['linkEvent'],
        json['formResponseId'],
        json['dateCreated']
    );
  }
}
