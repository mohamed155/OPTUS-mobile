enum SendSMSPIC {
  no(0),
  autoSend(1),
  manualSend(2);

  const SendSMSPIC(this.value);

  final int value;
}
