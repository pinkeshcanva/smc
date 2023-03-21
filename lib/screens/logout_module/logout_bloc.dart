// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class LogoutBloc {
  StreamController<bool> loadDataController = BehaviorSubject<bool>();

  Stream<bool> get loadDataStream => loadDataController.stream;

  Sink<bool> get loadDataSink => loadDataController.sink;

  getLoadData(bool data) {
    loadDataSink.add(data);
  }

  void dispose() {
    loadDataController.close();
  }
}

final LogoutBloc logoutBloc = LogoutBloc();
