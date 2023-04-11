import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/services/connection.dart';
import 'package:tech2/utilities/json_converter.dart';

class FormsService {
  factory FormsService() {
    return _instance;
  }

  FormsService._create();

  static final _instance = FormsService._create();

  Future<FormResponseModelDto> getFormResponseModel(
    int formId,
    int formResponseId,
  ) {
    final url =
        '${apiBaseUrl}Form/GetFormResponseModel/$formId/$formResponseId';
    return ConnectionService().getData(url).then((result) {
      return FormResponseModelDto.fromJson(
        JSONConverter().decode(result.body) as Map<String, dynamic>,
      );
    });
  }

  Future<void> saveFormResponse(FormResponseModelDto model) {
    const url = '${apiBaseUrl}Form/SaveFormResponse';
    return ConnectionService().sendData(url, model);
  }
}
