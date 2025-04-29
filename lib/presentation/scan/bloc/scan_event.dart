abstract class ScanEvent {}

class LoadScans extends ScanEvent {}

class AddScanEvent extends ScanEvent {
  final String qrContent;

  AddScanEvent(this.qrContent);
}

class DeleteScanEvent extends ScanEvent {
  final int id;

  DeleteScanEvent(this.id);
}