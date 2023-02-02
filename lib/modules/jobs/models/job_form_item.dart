//TODO: refactor these models from factory constructors to named constructors

class JobFormDto {
  int formId;
  String formName;
  String? formDesc;
  int jobNumber;
  String? frequency;
  bool mandatory;
  int filled;
  String formCompleted;
  String formAction;
  String? linkEvent;
  int formResponseId;
  DateTime? dateCreated;

  JobFormDto(this.formId,
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
        json['dateCreated'] != null ? DateTime.parse(json['dateCreated']) : null
    );
  }
}
