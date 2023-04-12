import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/modules/jobs/models/docs.dart';
import 'package:tech2/modules/jobs/services/docs_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/services/toast_service.dart';
import 'package:tech2/widgets/dropdown.dart';

class JobDocuments extends StatefulWidget {
  const JobDocuments({super.key, required this.jobId});

  final int jobId;

  @override
  State<JobDocuments> createState() => _JobDocumentsState();
}

class _JobDocumentsState extends State<JobDocuments> {
  List<LinkedDocumentDto>? docsList;
  List<ListDto<int, String>>? listOfCategories;
  bool loading = false;
  bool uploading = false;
  String? fileToUploadBase64;

  @override
  void initState() {
    super.initState();

    loadDocsList();
    loadCategoriesList();
  }

  void loadCategoriesList() {
    DocsService()
        .getListOfCategory('Job')
        .then((data) => listOfCategories = data);
  }

  void loadDocsList() {
    setState(() => loading = true);
    DocsService()
        .getListOfLinkedDocumentAndFormResponse(widget.jobId, 'Job')
        .then((value) => setState(() => docsList = value))
        .whenComplete(() => setState(() => loading = false));
  }

  Future<void> downloadDocument(int linkedDocumentId, String filename) {
    final index =
        docsList!.indexWhere((doc) => doc.linkedDocumentId == linkedDocumentId);
    setState(() {
      final docs = docsList!;
      docs[index].loading = true;
      docsList = docs;
    });
    return DocsService()
        .downloadLinkedDocument(linkedDocumentId)
        .then((Uint8List fileContent) async {
      final appDir = await getApplicationDocumentsDirectory();
      final filePath = '${appDir.path}/$filename';
      File(filePath).writeAsBytesSync(fileContent);
    }).whenComplete(() {
      setState(() {
        final docs = docsList!;
        docs[index].loading = false;
        docsList = docs;
      });
    });
  }

  Future<void> openDocument(int linkedDocumentId, String filename) async {
    unawaited(
      downloadDocument(linkedDocumentId, filename).then((_) async {
        final appDir = await getApplicationDocumentsDirectory();
        unawaited(OpenFilex.open('${appDir.path}/$filename'));
      }),
    );
  }

  void downloadDocumentHandler(int linkedDocumentId, String filename) {
    downloadDocument(linkedDocumentId, filename).then((_) {
      ToastService().showSuccessMessage('Document downloaded successfully');
    });
  }

  void deleteDocument(int linkedDocumentId) {
    setState(() => loading = true);
    DocsService()
        .deleteLinkedDocument(linkedDocumentId)
        .whenComplete(() => setState(() => loading = false));
  }

  Future<void> chooseFileToUpload() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      late final Uint8List bytes;
      if (kIsWeb) {
        bytes = result.files.single.bytes!;
      } else {
        final file = File(result.files.single.path!);
        bytes = file.readAsBytesSync();
      }
      final base64 = base64Encode(bytes);
      unawaited(
        showUploadDialog(base64, result.files.single.name)
            .then((_) => loadDocsList()),
      );
    }
  }

  Future<void> showUploadDialog(String base64, String fileName) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(10),
    );
    return showDialog(
      context: context,
      builder: (_) {
        int? selectedCategoryId;
        var docDesc = '';

        return AlertDialog(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          content: StatefulBuilder(
            builder: (context, setState) {
              void cancelHandler() => Navigator.pop(context);

              void uploadHandler() {
                setState(() => uploading = true);
                final model = LinkedDocumentDto(
                  linkedDocumentId: 0,
                  linkId: widget.jobId,
                  linkIdType: 'Job',
                  categoryId: selectedCategoryId,
                  docDescription: docDesc,
                  docFileName: fileName,
                  documentType: fileName.split('.').last,
                  fileSourceAsBase64String: base64,
                  dateCreated: DateTime.now(),
                  createdByWorkerId: SecurityService.workerId,
                );
                DocsService()
                    .uploadLinkedDocuments([model])
                    .then((_) => Navigator.of(context).pop())
                    .whenComplete(() => setState(() => uploading = false));
              }

              return Center(
                child: Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Dropdown<int>(
                        label: 'Category',
                        labelColor: Colors.black,
                        items: listOfCategories!,
                        value: selectedCategoryId,
                        valueProp: 'key',
                        labelProp: 'value',
                        borderColor: Colors.black54,
                        onChanged: (int? value) =>
                            setState(() => selectedCategoryId = value),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: TextField(
                          decoration: InputDecoration(
                            label: const Text('Description'),
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                          ),
                          onChanged: (String value) =>
                              setState(() => docDesc = value),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: cancelHandler,
                              child: const Text('Cancel'),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: uploading ? null : uploadHandler,
                              child: Text(uploading ? 'Loading...' : 'Upload'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Docs'),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [
              Colors.black87,
              Colors.black,
            ],
            stops: [0.1, 10],
          ),
        ),
        child: !loading && docsList != null
            ? docsList!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: docsList!.length,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () => openDocument(
                              docsList![index].linkedDocumentId,
                              docsList![index].docFileName,
                            ),
                            visualDensity:
                                const VisualDensity(horizontal: 1, vertical: 2),
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: docsList![index].loading!
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.file_copy,
                                            color: Colors.white,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            title: Text(
                              docsList![index].docFileName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              docsList![index].docDescription,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            trailing: PopupMenuButton(
                              color: Colors.white,
                              itemBuilder: (_) => [
                                PopupMenuItem<void>(
                                  onTap: () => downloadDocumentHandler(
                                    docsList![index].linkedDocumentId,
                                    docsList![index].docFileName,
                                  ),
                                  child: const Text('Download'),
                                ),
                                PopupMenuItem<void>(
                                  onTap: () => deleteDocument(
                                    docsList![index].linkedDocumentId,
                                  ),
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.white24,
                            height: 1,
                          )
                        ],
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No documents for this job',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
            : Center(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: SizedBox.expand(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: chooseFileToUpload,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
