import 'package:http/http.dart';
import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/forms.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class FormsService {
  static Future<FormResponseModelDto> getFormResponseModel(int formId, int formResponseId) {
    String url =
        '${apiBaseUrl}Form/GetFormResponseModel/$formId/$formResponseId';
    return ConnectivityService.getData(url).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is String) {
        body = result;
      }
      return FormResponseModelDto.fromJson(JSONConverter.decode(body));
    });
  }

  static Future saveFormResponse(FormResponseModelDto model) {
    String url = '${apiBaseUrl}Form/SaveFormResponse';
    return ConnectivityService.sendData(url, model);
  }
}
