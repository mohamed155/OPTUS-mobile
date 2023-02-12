import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tech2/modules/jobs/models/docs.dart';
import 'package:tech2/modules/jobs/services/docs_service.dart';
import 'package:tech2/services/toast_service.dart';

class JobDocuments extends StatefulWidget {
  final int jobId;

  const JobDocuments({Key? key, required this.jobId}) : super(key: key);

  @override
  State<JobDocuments> createState() => _JobDocumentsState();
}

class _JobDocumentsState extends State<JobDocuments> {
  List<LinkedDocumentDto>? docsList;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    loadDocsList();
  }

  loadDocsList() {
    setState(() => loading = true);
    DocsService.getListOfLinkedDocumentAndFormResponse(widget.jobId, 'Job')
        .then((value) => setState(() => docsList = value))
        .whenComplete(() => setState(() => loading = false));
  }

  Future downloadDocument(int linkedDocumentId, String filename) {
    int index =
        docsList!.indexWhere((doc) => doc.linkedDocumentId == linkedDocumentId);
    setState(() {
      var docs = docsList!;
      docs[index].loading = true;
      docsList = docs;
    });
    return DocsService.downloadLinkedDocument(linkedDocumentId)
        .then((Uint8List fileContent) async {
      Directory appDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDir.path}/$filename';
      File file = File(filePath);
      file.writeAsBytesSync(fileContent);
    }).whenComplete(() {
      setState(() {
        var docs = docsList!;
        docs[index].loading = false;
        docsList = docs;
      });
    });
  }

  openDocument(int linkedDocumentId, String filename) async {
    downloadDocument(linkedDocumentId, filename).then((_) async {
      Directory appDir = await getApplicationDocumentsDirectory();
      OpenFilex.open('${appDir.path}/$filename');
    });
  }

  downloadDocumentHandler(int linkedDocumentId, String filename) {
    downloadDocument(linkedDocumentId, filename).then((_) {
      ToastService.showSuccessMessage('Document downloaded successfully');
    });
  }

  deleteDocument(int linkedDocumentId) {
    setState(() => loading = true);
    DocsService.deleteLinkedDocument(linkedDocumentId)
        .whenComplete(() => setState(() => loading = false));
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
              gradient: RadialGradient(radius: 1, colors: [
            Colors.black87,
            Colors.black,
          ], stops: [
            0.1,
            10
          ])),
          child: !loading && docsList != null
              ? docsList!.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: docsList!.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              onTap: () => openDocument(
                                  docsList![index].linkedDocumentId,
                                  docsList![index].docFileName),
                              visualDensity: const VisualDensity(
                                  horizontal: 1, vertical: 2),
                              leading: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: docsList![index].loading
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : const Icon(Icons.file_copy,
                                              color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(
                                docsList![index].docFileName,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              subtitle: Text(
                                docsList![index].docDescription,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 12),
                              ),
                              trailing: PopupMenuButton(
                                color: Colors.white,
                                itemBuilder: (_) =>
                                [
                                  PopupMenuItem(
                                      onTap: () => downloadDocumentHandler(
                                          docsList![index].linkedDocumentId,
                                          docsList![index].docFileName),
                                      child: const Text('Download')),
                                  PopupMenuItem(
                                      onTap: () => deleteDocument(
                                          docsList![index].linkedDocumentId),
                                      child: const Text('Delete')),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.white24,
                              height: 1,
                            )
                          ],
                        );
                      })
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
        ));
  }
}
