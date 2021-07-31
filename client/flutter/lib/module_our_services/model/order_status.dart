class OrderStatus {
  String? _error;

  OrderStatus.None();

  OrderStatus.Error(this._error);

  bool get hasError => _error != null;

  String get getError => _error ?? '';
}
