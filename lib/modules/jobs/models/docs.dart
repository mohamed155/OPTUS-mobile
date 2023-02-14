import 'package:tech2/interfaces/has_map.dart';

class LinkedDocumentDto implements Mappable {
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

  bool loading = false;

  LinkedDocumentDto.name(
      this.linkedDocumentId,
      this.linkId,
      this.linkIdType,
      this.categoryId,
      this.docDescription,
      this.docFileName,
      this.documentType,
      this.fileSourceAsBase64String,
      this.formResponseLinkId,
      this.formResponseIdType,
      this.dateCreated,
      this.createdByWorkerId,
      this.doc,
      this.loading);

  LinkedDocumentDto(
      {required this.linkedDocumentId,
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
      this.doc});

  LinkedDocumentDto.fromJSON(Map<String, dynamic> json)
      : linkedDocumentId = json['linkedDocumentId'],
        linkId = json['linkId'],
        linkIdType = json['linkIdType'],
        categoryId = json['categoryId'],
        docDescription = json['docDescription'],
        docFileName = json['docFileName'],
        documentType = json['documentType'],
        fileSourceAsBase64String = json['fileSourceAsBase64String'],
        formResponseLinkId = json['formResponseLinkId'],
        formResponseIdType = json['formResponseIdType'],
        dateCreated = DateTime.parse(json['dateCreated']),
        createdByWorkerId = json['createdByWorkerId'],
        doc = json['doc'];

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
