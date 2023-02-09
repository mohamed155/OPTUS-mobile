import 'package:flutter/material.dart';
import 'package:tech2/modules/jobs/models/items.dart';
import 'package:tech2/modules/jobs/services/items_service.dart';
import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/dropdown.dart';
import 'package:tech2/widgets/number_input.dart';

class AddItem extends StatefulWidget {
  final List<JobItemTaskCodesDto> items;
  final int jobId;
  final int jobVisitId;
  final int projectId;

  const AddItem(
      {Key? key,
      required this.items,
      required this.jobId,
      required this.jobVisitId,
      required this.projectId})
      : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int selectedItemId = 0;
  int qty = 0;
  bool loading = false;

  cancelHandler() {
    Navigator.pop(context);
  }

  okHandler() {
    setState(() => loading = true);
    var model = AddTaskCodeItemDto(
        selectedItemId,
        widget.jobId,
        qty,
        widget.jobVisitId,
        widget.projectId,
        SecurityService.workerId,
        true,
        qty);
    ItemsService.addTaskCodeItem(model).whenComplete(() {
      setState(() => loading = false);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 272,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Dropdown<int>(
              label: 'Select Item',
              labelColor: Colors.black,
              items: widget.items,
              valueProp: 'itemId',
              labelProp: 'itemCodeName',
              value: selectedItemId,
              borderColor: Colors.black54,
              onChanged: (value) {
                setState(() {
                  selectedItemId = value!;
                });
              },
            ),
            NumberInput(
              label: 'Quantity',
              labelColor: Colors.black,
              value: qty,
              onChange: (value) => setState(() => qty = value),
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
                )),
                Expanded(
                    child: TextButton(
                  onPressed: (loading || qty <= 0) ? null : okHandler,
                  child: Text(loading ? 'Loading...' : 'OK'),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
