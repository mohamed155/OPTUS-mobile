import 'package:tech2/models/list_dto.dart';

class FormDetailInput {
  int formId;
  int formResponseId;
  int jobVisitId;
  String formName;

  FormDetailInput(
      {required this.formId,
      required this.formResponseId,
      required this.jobVisitId,
      required this.formName});
}

class FormResponseModelDto {
  bool isWizard;
  FormResponseDto formResponseDto;
  List<IDynamicFieldConfigModel> listOfFields;

  FormResponseModelDto(this.isWizard, this.formResponseDto, this.listOfFields);

  factory FormResponseModelDto.fromJson(Map<String, dynamic> json) {
    return FormResponseModelDto(
        json['isWizard'],
        FormResponseDto.fromJson(json['formResponseDto']),
        List.of(json['listOfFields'])
            .map((field) => IDynamicFieldConfigModel.fromJson(field))
            .toList());
  }
}

class FormResponseDto {
  int formId;
  String idType;
  int id;

  FormResponseDto(this.formId, this.idType, this.id);

  factory FormResponseDto.fromJson(Map<String, dynamic> json) {
    return FormResponseDto(
        json['formId'], json['idType'] ?? 'JobVisit', json['id']);
  }
}

class IDynamicFieldConfigModel {
  int formFieldId;
  int? parentFormField;
  String? parentFormFieldValue;
  int index;
  String? label;
  String name;
  String type;
  String? placeholder;
  dynamic value;
  bool mandatory;
  bool visited;
  IDynamicFieldConfigModel? additionalComments;
  List<ListDto>? options;
  List<IDynamicFieldCheckboxesModel>? checkboxes;
  List<IDynamicFieldValidatorModel>? validations;

  IDynamicFieldConfigModel(
      this.formFieldId,
      this.parentFormField,
      this.parentFormFieldValue,
      this.index,
      this.label,
      this.name,
      this.type,
      this.placeholder,
      value,
      this.mandatory,
      this.visited,
      this.additionalComments,
      this.options,
      this.checkboxes,
      this.validations) {
    if (type == 'Date') {
      this.value = DateTime.tryParse(value);
    } else {
      this.value = value;
    }
  }

  factory IDynamicFieldConfigModel.fromJson(Map<String, dynamic> json) {
    return IDynamicFieldConfigModel(
        json['formFieldId'],
        json['parentFormField'],
        json['parentFormFieldValue'],
        json['index'],
        json['label'],
        json['name'],
        json['type'],
        json['placeholder'],
        json['value'],
        json['mandatory'],
        json['visited'],
        json['additionalComments'] != null
            ? IDynamicFieldConfigModel.fromJson(json['additionalComments'])
            : null,
        json['options'] != null
            ? List.of(json['options'])
                .map((json) => ListDto.fromJSON(json))
                .toList()
            : null,
        json['checkboxes'] != null
            ? List.of(json['checkboxes'])
                .map((json) => IDynamicFieldCheckboxesModel.fromJson(json))
                .toList()
            : null,
        json['validations'] != null
            ? List.of(json['validations'])
                .map((json) => IDynamicFieldValidatorModel.fromJson(json))
                .toList()
            : null);
  }
}

class IDynamicFieldCheckboxesModel {
  int id;
  String label;
  String name;
  bool value;

  IDynamicFieldCheckboxesModel(this.id, this.label, this.name, this.value);

  factory IDynamicFieldCheckboxesModel.fromJson(Map<String, dynamic> json) {
    return IDynamicFieldCheckboxesModel(
        json['id'], json['label'], json['name'], json['value']);
  }
}

class IDynamicFieldValidatorModel {
  String name;
  String? pattern;
  String message;

  IDynamicFieldValidatorModel(this.name, this.pattern, this.message);

  factory IDynamicFieldValidatorModel.fromJson(Map<String, dynamic> json) {
    return IDynamicFieldValidatorModel(
        json['name'], json['pattern'], json['message']);
  }
}
