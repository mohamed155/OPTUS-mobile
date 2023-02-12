import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:tech2/config/app_config.dart';
import 'package:tech2/modules/jobs/models/docs.dart';
import 'package:tech2/services/connectivity.dart';
import 'package:tech2/utilities/json_converter.dart';

class DocsService {
  static Future<List<LinkedDocumentDto>> getListOfLinkedDocumentAndFormResponse(
      int linkId, String linkIdType) {
    String url =
        '${apiBaseUrl}LinkedDocument/GetListOfLinkedDocumentAndFormResponse/$linkId/$linkIdType';
    return ConnectivityService.getData(url).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is String) {
        body = result;
      }
      return List.of(JSONConverter.decode(body))
          .map((item) => LinkedDocumentDto(item))
          .toList();
    });
  }

  static Future<Uint8List> downloadLinkedDocument(int linkedDocumentId) {
    String url =
        '${s3ApiBaseUrl}Download/DownloadLinkedDocument/$linkedDocumentId';
    return ConnectivityService.getData(url).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.bodyBytes;
      } else if (result is String) {
        body = result;
      }
      return body;
    });
  }

  static Future<bool> deleteLinkedDocument(int linkedDocumentId) {
    String url =
        '${s3ApiBaseUrl}Delete/DeleteFileById?LinkedDocumetID=$linkedDocumentId';
    return ConnectivityService.deleteData(url).then((result) {
      dynamic body;
      if (result is Response) {
        body = result.body;
      } else if (result is bool) {
        body = result;
      }
      return body;
    });
  }
}
