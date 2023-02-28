enum JobStatusTypes {
  open(4, 'Open'),
  started(5, 'Started');

  const JobStatusTypes(this.id, this.value);

  final int id;
  final String value;
}
