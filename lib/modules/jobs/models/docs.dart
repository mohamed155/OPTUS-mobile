import 'package:tech2/interfaces/has_map.dart';

class LinkedDocumentDto implements Mappable {
  LinkedDocumentDto({
    required this.linkedDocumentId,
    required this.linkId,
    required this.linkIdType,
    this.categoryId,
    required this.docDescription,
    required this.docFileName,
    required this.documentType,
    required this.fileSourceAsBase64String,
    this.formResponseLinkId,
    this.formResponseIdType,
    required this.dateCreated,
    required this.createdByWorkerId,
    this.doc,
  });

  LinkedDocumentDto.fromJSON(Map<String, dynamic> json)
      : linkedDocumentId = json['linkedDocumentId'] as int,
        linkId = json['linkId'] as int,
        linkIdType = json['linkIdType'] as String,
        categoryId = json['categoryId'] as int?,
        docDescription = json['docDescription'] as String,
        docFileName = json['docFileName'] as String,
        documentType = json['documentType'] as String,
        fileSourceAsBase64String = json['fileSourceAsBase64String'] as String?,
        formResponseLinkId = json['formResponseLinkId'] as int?,
        formResponseIdType = json['formResponseIdType'] as String?,
        dateCreated = DateTime.parse(json['dateCreated'] as String),
        createdByWorkerId = json['createdByWorkerId'] as int,
        doc = json['doc'];

  int linkedDocumentId;
  int linkId;
  String linkIdType;
  int? categoryId;
  String docDescription;
  String docFileName;
  String documentType;
  String? fileSourceAsBase64String;
  int? formResponseLinkId;
  String? formResponseIdType;
  DateTime dateCreated;
  int createdByWorkerId;
  dynamic doc;

  bool? loading = false;

  @override
  Map<String, dynamic> toMap() {
    return {
      'linkedDocumentId': linkedDocumentId,
      'linkId': linkId,
      'linkIdType': linkIdType,
      'categoryId': categoryId,
      'docDescription': docDescription,
      'docFileName': docFileName,
      'documentType': documentType,
      'fileSourceAsBase64String': fileSourceAsBase64String,
      'formResponseLinkId': formResponseLinkId,
      'formResponseIdType': formResponseIdType,
      'dateCreated': dateCreated.toIso8601String(),
      'createdByWorkerId': createdByWorkerId,
      'doc': doc,
    };
  }
}
