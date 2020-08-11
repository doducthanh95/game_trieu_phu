import 'dart:async';
import 'package:flutter/material.dart';

import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetWorkStatus {
  Future<bool> get isConnected;
}

class NetWorkStatusImpl implements NetWorkStatus {
  static final _instance = NetWorkStatusImpl._();

  factory NetWorkStatusImpl() => _instance;

  final ValueNotifier<bool> notifier = ValueNotifier<bool>(false);

  DataConnectionChecker _checker = DataConnectionChecker();

  NetWorkStatusImpl._() {
    _checker.onStatusChange.listen((status) {
      notifier.value = status == DataConnectionStatus.connected;
    });
  }

  Completer<bool> _checking;

  @override
  Future<bool> get isConnected {
    if (_checking?.isCompleted != false) {
      _checking = Completer<bool>();
      _checker.hasConnection.then((value) {
        notifier.value = value;
        _checking.complete(value);
      });
    }
    return _checking.future;
  }

  void dispose() {
    _checker = null;
    notifier.dispose();
  }
}
