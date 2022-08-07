import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/shared_app_bar.dart';
import 'package:tech2/models/list_dto.dart';
import 'package:tech2/services/list_service.dart';

class JobsScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  const JobsScreen({Key? key, required this.openDrawer}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  List<ListDto<int, String>> listOfProjectRegion = [];
  List<ListDto<String, String>> listOfJobStatuses = [];

  List<int>? selectedProjectRegionIds;
  List<int>? selectedJobStatuses;

  bool isProjectRegionLoading = false;
  bool isJobStatusLoading = false;

  @override
  initState() {
    super.initState();

    loadControls();
  }

  loadControls() {
    loadWorkerProjectRegionList();
    loadJobStatusList();
  }

  loadWorkerProjectRegionList() async {
    setState(() => isProjectRegionLoading = true);
    ListService.loadWorkerProjectRegionList(SecurityService.workerId)
        .then((List<ListDto<int, String>> data) => setState(() {
              listOfProjectRegion = data;
              isProjectRegionLoading = false;
            }));
  }

  loadJobStatusList() {
    setState(() => isJobStatusLoading = true);
    ListService.loadJobStatusList()
        .then((List<ListDto<String, String>> data) => setState(() {
              listOfJobStatuses = data;
              isJobStatusLoading = false;
            }));
  }

  Widget buildDropDown(
      {required String label,
      required List<ListDto> items,
      required dynamic value,
      required void Function(dynamic) onChanged,
      required bool isLoading,
      required bool multiSelect}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: multiSelect
                  ? MultiSelectDialogField(
                      buttonIcon: isLoading
                          ? const Icon(Icons.downloading)
                          : const Icon(Icons.arrow_drop_down),
                      initialValue: value,
                      items: items
                          .map((item) => MultiSelectItem(item.key, item.value))
                          .toList(),
                      onConfirm: onChanged)
                  : DropdownButtonHideUnderline(
                      child: DropdownButton(
                          icon: isLoading
                              ? Container(
                                  width: 28,
                                  height: 28,
                                  margin: const EdgeInsets.all(10),
                                  child: const CircularProgressIndicator())
                              : const Icon(Icons.arrow_drop_down),
                          value: value,
                          items: items
                              .map((ListDto item) => DropdownMenuItem(
                                    value: item.key,
                                    child: Text(item.value),
                                  ))
                              .toList(),
                          isExpanded: true,
                          onChanged: onChanged),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        menuButtonHandler: widget.openDrawer,
        refreshButtonHandler: () {},
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(radius: 1, colors: [
          Colors.black87,
          Colors.black,
        ], stops: [
          0.1,
          10
        ])),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildDropDown(
                  label: "Project Region",
                  items: listOfProjectRegion,
                  value: selectedProjectRegionIds,
                  isLoading: isProjectRegionLoading,
                  multiSelect: true,
                  onChanged: (dynamic value) =>
                      setState(() => selectedProjectRegionIds = value)),
              buildDropDown(
                  label: "Status",
                  items: listOfJobStatuses,
                  value: selectedJobStatuses,
                  isLoading: isJobStatusLoading,
                  multiSelect: true,
                  onChanged: (dynamic value) =>
                      setState(() => selectedJobStatuses = value)),
            ],
          ),
        ),
      ),
    );
  }
}
