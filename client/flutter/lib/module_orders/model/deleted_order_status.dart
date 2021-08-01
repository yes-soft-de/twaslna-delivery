class DeletedOrderStatus {
  String? error;

  DeletedOrderStatus.error(this.error);
  DeletedOrderStatus.empty();
  bool get hasError => error != null ;
}