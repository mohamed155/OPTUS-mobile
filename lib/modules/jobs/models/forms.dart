import 'package:tech2/interfaces/has_map.dart';
import 'package:tech2/models/list_dto.dart';

class FormDetailInput {
  FormDetailInput({
    required this.formId,
    required this.formResponseId,
    required this.jobVisitId,
    required this.formName,
  });

  int formId;
  int formResponseId;
  int jobVisitId;
  String formName;
}

class FormResponseModelDto implements Mappable {
  FormResponseModelDto(
    this.formResponseDto,
    this.listOfFields, {
    required this.isWizard,
  });

  FormResponseModelDto.fromJson(Map<String, dynamic> json)
      : isWizard = json['isWizard'] as bool,
        formResponseDto = FormResponseDto.fromJson(
          json['formResponseDto'] as Map<String, dynamic>,
        ),
        listOfFields = List.of(json['listOfFields'] as Iterable<dynamic>)
            .map(
              (field) => IDynamicFieldConfigModel.fromJson(
                field as Map<String, dynamic>,
              ),
            )
            .toList();

  bool isWizard;
  FormResponseDto formResponseDto;
  List<IDynamicFieldConfigModel> listOfFields;

  @override
  Map<String, dynamic> toMap() {
    return {
      'isWizard': isWizard,
      'formResponseDto': formResponseDto.toMap(),
      'listOfFields': listOfFields.map((item) => item.toMap()).toList()
    };
  }
}

class FormResponseDto implements Mappable {
  FormResponseDto(this.formId, this.idType, this.id);

  FormResponseDto.fromJson(Map<String, dynamic> json)
      : formId = json['formId'] as int,
        idType = json['idType'] as String?,
        id = json['id'] as int;

  int formId;
  String? idType;
  int id;

  @override
  Map<String, dynamic> toMap() {
    return {'formId': formId, 'idType': idType, 'id': id};
  }
}

class IDynamicFieldConfigModel implements Mappable {
  IDynamicFieldConfigModel(
    this.formFieldId,
    this.parentFormField,
    this.parentFormFieldValue,
    this.index,
    this.label,
    this.name,
    this.type,
    this.placeholder,
    dynamic value,
    this.additionalComments,
    this.options,
    this.checkboxes,
    this.validations, {
    required this.mandatory,
    required this.visited,
  }) {
    if (type == 'Date') {
      this.value = DateTime.tryParse(value as String);
    } else {
      this.value = value;
    }
  }

  factory IDynamicFieldConfigModel.fromJson(Map<String, dynamic> json) {
    return IDynamicFieldConfigModel(
      json['formFieldId'] as int,
      json['parentFormField'] as int?,
      json['parentFormFieldValue'] as String?,
      json['index'] as int,
      json['label'] as String?,
      json['name'] as String,
      json['type'] as String,
      json['placeholder'] as String?,
      json['value'],
      json['additionalComments'] != null
          ? IDynamicFieldConfigModel.fromJson(
              json['additionalComments'] as Map<String, dynamic>,
            )
          : null,
      json['options'] != null
          ? List.of(json['options'] as Iterable<dynamic>)
              .map(
                (json) => ListDto<dynamic, dynamic>.fromJSON(
                  json as Map<String, dynamic>,
                ),
              )
              .toList()
          : null,
      json['checkboxes'] != null
          ? List.of(json['checkboxes'] as Iterable<dynamic>)
              .map(
                (json) => IDynamicFieldCheckboxesModel.fromJson(
                  json as Map<String, dynamic>,
                ),
              )
              .toList()
          : null,
      json['validations'] != null
          ? List.of(json['validations'] as Iterable<dynamic>)
              .map(
                (json) => IDynamicFieldValidatorModel.fromJson(
                  json as Map<String, dynamic>,
                ),
              )
              .toList()
          : null,
      mandatory: json['mandatory'] as bool,
      visited: json['visited'] as bool,
    );
  }

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
  List<ListDto<dynamic, dynamic>>? options;
  List<IDynamicFieldCheckboxesModel>? checkboxes;
  List<IDynamicFieldValidatorModel>? validations;

  @override
  Map<String, dynamic> toMap() {
    return {
      'formFieldId': formFieldId,
      'parentFormField': parentFormField,
      'parentFormFieldValue': parentFormFieldValue,
      'index': index,
      'label': label,
      'name': name,
      'type': type,
      'placeholder': placeholder,
      'value': value,
      'mandatory': mandatory,
      'visited': visited,
      'additionalComments': additionalComments?.toMap(),
      'options': options?.map((item) => item.toMap()).toList(),
      'checkboxes': checkboxes?.map((item) => item.toMap()).toList(),
      'validations': validations?.map((item) => item.toMap()).toList(),
    };
  }
}

class IDynamicFieldCheckboxesModel implements Mappable {
  IDynamicFieldCheckboxesModel(
    this.id,
    this.label,
    this.name, {
    required this.value,
  });

  IDynamicFieldCheckboxesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        label = json['label'] as String,
        name = json['name'] as String,
        value = json['value'] as bool;

  int id;
  String label;
  String name;
  bool value;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'name': name,
      'value': value,
    };
  }
}

class IDynamicFieldValidatorModel implements Mappable {
  IDynamicFieldValidatorModel(this.name, this.pattern, this.message);

  factory IDynamicFieldValidatorModel.fromJson(Map<String, dynamic> json) {
    return IDynamicFieldValidatorModel(
      json['name'] as String,
      json['pattern'] as String?,
      json['message'] as String,
    );
  }

  String name;
  String? pattern;
  String message;

  @override
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'pattern': pattern,
      'message': message,
    };
  }
}
