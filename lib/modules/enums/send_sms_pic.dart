enum SendSMSPIC {
  no(0),
  autoSend(1),
  manualSend(2);

  final int value;
  const SendSMSPIC(this.value);
}