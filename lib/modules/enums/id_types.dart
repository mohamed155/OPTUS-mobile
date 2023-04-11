enum IdTypes {
  activity('Activity'),
  jobDefect('JobDefect'),
  complianceStatusId('ComplianceStatusID'),
  company('Company'),
  customer('Customer'),
  inv('Inv'),
  jobVisit('JobVisit'),
  worker('Worker'),
  job('Job'),
  jobItem('JobItem'),
  customerContract('CustomerContract'),
  salesEnquiry('SalesEnquiry'),
  test('Test'),
  group('Group'),
  course('Course'),
  incident('Incident'),
  project('Project'),
  task('Task'),
  projectRegion('ProjectRegion');

  const IdTypes(this.value);

  final String value;
}
