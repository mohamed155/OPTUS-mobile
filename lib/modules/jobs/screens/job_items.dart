import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/modules/jobs/services/items_service.dart';
import 'package:tech2/modules/jobs/widgets/add_item.dart';
import 'package:tech2/services/security.dart';

class JobItems extends StatefulWidget {
  const JobItems({
    super.key,
    required this.jobId,
    required this.jobTypeId,
    required this.jobVisitId,
    required this.projectId,
    required this.projectRegionId,
    required this.sourceCustomerId,
  });

  final int jobId;
  final int jobTypeId;
  final int jobVisitId;
  final int projectId;
  final int projectRegionId;
  final int sourceCustomerId;

  @override
  State<JobItems> createState() => _JobItemsState();
}

class _JobItemsState extends State<JobItems> {
  List<JobItemTaskCodesDto>? items;
  List<JobItemTaskCodesDto>? addableItems = [];
  String? selectedItemId;
  bool loading = false;

  TextStyle labelFontStyle = const TextStyle(fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    loadJobItems();
    loadAddableItems();
  }

  void loadJobItems() {
    setState(() => loading = true);
    ItemsService()
        .getJobItemTaskCodes(widget.jobId, isShowAll: true)
        .then((res) => setState(() => items = res))
        .whenComplete(() => setState(() => loading = false));
  }

  void loadAddableItems() {
    final model = JobTypeItemByWorkerPermissionDto(
      2,
      widget.jobTypeId,
      SecurityService.workerId,
      discontinued: false,
    );
    ItemsService()
        .getJobTypeItemByWorkerPermission(model)
        .then((res) => setState(() => addableItems = res));
  }

  Future<void> openAddItem() {
    return showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.transparent,
        content: AddItem(
          items: addableItems!,
          jobId: widget.jobId,
          jobVisitId: widget.jobVisitId,
          projectId: widget.projectId,
        ),
      ),
    ).then((_) => loadJobItems());
  }

  void deleteItem(JobItemTaskCodesDto item) {
    setState(() => loading = true);
    final model = DeleteItemDto(
      item.jobItemId!,
      widget.jobId,
      widget.jobVisitId,
      widget.projectId,
      widget.projectRegionId,
      widget.sourceCustomerId,
      SecurityService.workerId,
      isCheckMandatory: true,
      isDeleted: true,
      isShowDeleted: true,
    );
    ItemsService().deleteTaskCodeItem(model).then((_) => loadJobItems());
  }

  void updateItem(JobItemTaskCodesDto item) {
    final model = SaveJobItemDto(
      item.jobItemId!,
      item.qty!,
      double.parse(item.discountAmount.replaceFirst('\$', '')),
      widget.jobVisitId,
      widget.jobId,
      item.itemId!,
      isCheckMandatory: false,
      isJobAddNegativeQuantity: false,
      okToPay: item.oktoPay!,
      okToBill: item.oktoBill!,
      skipNextClaim: item.skipNextClaim!,
      skipNextPayment: item.skipNextPayment!,
    );
    ItemsService().saveJobItem(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
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
        child: !loading && items != null
            ? items!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: items!.length,
                    itemBuilder: (_, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Code: ', style: labelFontStyle),
                                      Text(items![index].itemCodeName)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Actual: ', style: labelFontStyle),
                                      Text(items![index].qty.toString())
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Paid to worker: ',
                                        style: labelFontStyle,
                                      ),
                                      Text(items![index].fullName)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Retail: ', style: labelFontStyle),
                                      Text(items![index].saleAmount)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Discount: ', style: labelFontStyle),
                                      Text(items![index].discountAmount)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Net: ', style: labelFontStyle),
                                      Text(items![index].netAmount)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Company: ', style: labelFontStyle),
                                      Text(items![index].companyName)
                                    ],
                                  ),
                                  ...items![index].navId != null
                                      ? [
                                          Row(
                                            children: [
                                              Text(
                                                'NAV ID: ',
                                                style: labelFontStyle,
                                              ),
                                              Text(items![index].navId!)
                                            ],
                                          )
                                        ]
                                      : [],
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Pay: ', style: labelFontStyle),
                                          Checkbox(
                                            value: items![index].oktoPay,
                                            onChanged: (bool? value) {
                                              setState(
                                                () => items![index].oktoPay =
                                                    value,
                                              );
                                              updateItem(items![index]);
                                            },
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text('Bill: ', style: labelFontStyle),
                                          Checkbox(
                                            value: items![index].oktoBill,
                                            onChanged: (bool? value) {
                                              setState(
                                                () => items![index].oktoBill =
                                                    value,
                                              );
                                              updateItem(items![index]);
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: PopupMenuButton(
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    value: 'delete',
                                    onTap: () => deleteItem(items![index]),
                                    child: Row(
                                      children: const [
                                        Icon(Icons.delete),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Delete')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No items for this job',
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
        onPressed: openAddItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
