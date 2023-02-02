class LinkedDocumentDto {
  int linkedDocumentId;
  int linkId;
  String linkIdType;
  int? categoryId;
  String docDescription;
  String docFileName;
  String documentType;
  dynamic fileSourceAsBase64String;
  int formResponseLinkId;
  String formResponseIdType;
  DateTime dateCreated;
  int createdByWorkerId;
  dynamic doc;

  LinkedDocumentDto(Map<String, dynamic> json)
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
}
