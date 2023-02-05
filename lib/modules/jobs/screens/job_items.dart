import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/modules/jobs/services/items_service.dart';

class JobItems extends StatefulWidget {
  final int jobId;

  const JobItems({Key? key, required this.jobId}) : super(key: key);

  @override
  State<JobItems> createState() => _JobItemsState();
}

class _JobItemsState extends State<JobItems> {
  List<JobItemTaskCodesDto>? items;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadJobItems();
  }

  loadJobItems() {
    setState(() => loading = true);
    ItemsService.getJobItemTaskCodes(widget.jobId, true)
        .then((res) => setState(() => items = res))
        .whenComplete(() => setState(() => loading = false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Items'),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
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
          child: !loading && items != null
              ? items!.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: items!.length,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                                visualDensity: const VisualDensity(
                                    horizontal: 1, vertical: 2),
                                title: Text(
                                  items![index].itemName,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: PopupMenuButton(
                                  color: Colors.white,
                                  itemBuilder: (BuildContext context) => [
                                    PopupMenuItem(
                                        value: 'delete',
                                        child: Row(
                                          children: const [
                                            Icon(Icons.delete),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Delete')
                                          ],
                                        ))
                                  ],
                                )),
                            const Divider(
                              color: Colors.white24,
                              height: 1,
                            )
                          ],
                        );
                      })
                  : const Center(
                      child: Text(
                      'No items for this job',
                      style: TextStyle(color: Colors.white),
                    ))
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
