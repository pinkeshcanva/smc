import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RegistrationBloc {
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

final RegistrationBloc registrationBloc = RegistrationBloc();
