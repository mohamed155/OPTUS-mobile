import 'dart:typed_data';

import 'package:tech2/config/app_config.dart';
import 'package:tech2/interfaces/has_map.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/modules/jobs/models/docs.dart';
import 'package:tech2/services/connection.dart';
import 'package:tech2/utilities/json_converter.dart';

class DocsService {
  factory DocsService() {
    return _instance;
  }

  DocsService._create();

  static final _instance = DocsService._create();

  Future<List<LinkedDocumentDto>> getListOfLinkedDocumentAndFormResponse(
    int linkId,
    String linkIdType,
  ) {
    final url =
        '${apiBaseUrl}LinkedDocument/GetListOfLinkedDocumentAndFormResponse/$linkId/$linkIdType';
    return ConnectionService().getData(url).then((result) {
      return List.of(JSONConverter().decode(result.body) as Iterable<dynamic>)
          .map(
            (item) => LinkedDocumentDto.fromJSON(item as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<List<ListDto<int, String>>> getListOfCategory(
    String linkIdType,
  ) {
    final url = '${apiBaseUrl}LinkedDocument/GetListOfCategory/$linkIdType';
    return ConnectionService().getData(url).then((result) {
      return List.of(JSONConverter().decode(result.body) as Iterable<dynamic>)
          .map(
            (item) =>
                ListDto<int, String>.fromJSON(item as Map<String, dynamic>),
          )
          .toList();
    });
  }

  Future<Uint8List> downloadLinkedDocument(int linkedDocumentId) {
    final url =
        '${s3ApiBaseUrl}Download/DownloadLinkedDocument/$linkedDocumentId';
    return ConnectionService().getData(url).then((result) {
      return result.bodyBytes;
    });
  }

  Future<bool> deleteLinkedDocument(int linkedDocumentId) {
    final url =
        '${s3ApiBaseUrl}Delete/DeleteFileById?LinkedDocumetID=$linkedDocumentId';
    return ConnectionService().deleteData(url).then((result) {
      return result.body as bool;
    });
  }

  Future<void> uploadLinkedDocuments(List<LinkedDocumentDto> model) {
    const url = '${s3ApiBaseUrl}Upload/UploadLinkedDocuments';
    return ConnectionService().sendData(url, MappableList(model));
  }
}
