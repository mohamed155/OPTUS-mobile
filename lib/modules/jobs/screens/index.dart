import 'package:flutter/material.dart';

import 'package:tech2/services/security.dart';
import 'package:tech2/widgets/date_range_input.dart';
import 'package:tech2/widgets/multiselect_dropdown.dart';
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
  List<ListDto<int, String>> listOfSubRegions = [];

  List<int> selectedProjectRegionIds = [];
  List<String> selectedJobStatuses = [];
  List<int> selectedSubRegions = [];

  bool isProjectRegionLoading = false;
  bool isJobStatusLoading = false;
  bool isJobSubRegionsLoading = false;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.utc(2100);

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

  onChangeProjectSelection(List<int> value) {
    setState(() {
      selectedProjectRegionIds = value;
      isJobSubRegionsLoading = true;
    });
    if (selectedProjectRegionIds.isNotEmpty) {
      ListService.loadSubRegionListByProjectRegionId(selectedProjectRegionIds)
          .then((List<ListDto<int, String>> data) => setState(() {
        listOfSubRegions = data;
        isJobSubRegionsLoading = false;
      }));
    }
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
            ], stops: [0.1, 10])
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MultiselectDropdown<int>(
                  label: "Project Region",
                  items: listOfProjectRegion,
                  value: selectedProjectRegionIds,
                  valueProp: 'key',
                  labelProp: 'value',
                  isLoading: isProjectRegionLoading,
                  onChanged: onChangeProjectSelection),
              MultiselectDropdown<int>(
                  label: "Sub Region",
                  items: listOfSubRegions,
                  value: selectedSubRegions,
                  valueProp: 'key',
                  labelProp: 'value',
                  isLoading: isJobSubRegionsLoading,
                  onChanged: (dynamic value) =>
                      setState(() => selectedSubRegions = value)),
              MultiselectDropdown<String>(
                  label: "Status",
                  items: listOfJobStatuses,
                  value: selectedJobStatuses,
                  valueProp: 'key',
                  labelProp: 'value',
                  isLoading: isJobStatusLoading,
                  onChanged: (dynamic value) =>
                      setState(() => selectedJobStatuses = value)),
              DateRangeInput(
                startDate: startDate,
                endDate: endDate,
                onChange: (DateTime startDate, DateTime endDate) => setState(() {
                  this.startDate = startDate;
                  this.endDate = endDate;
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
