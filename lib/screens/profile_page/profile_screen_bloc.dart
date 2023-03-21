// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:rxdart/rxdart.dart';

class ProfileEditBloc {
  StreamController<bool> breastCancerController = BehaviorSubject<bool>();
  StreamController<bool> loadDataController = BehaviorSubject<bool>();

  Stream<bool> get breastCancerStream => breastCancerController.stream;
  Stream<bool> get loadDataStream => loadDataController.stream;

  Sink<bool> get breastCancerSink => breastCancerController.sink;
  Sink<bool> get loadDataSink => loadDataController.sink;

  getBreastCancerError(bool data) {
    breastCancerSink.add(data);
  }
  getLoadData(bool data) {
    loadDataSink.add(data);
  }

  void dispose() {
    breastCancerController.close();
    loadDataController.close();
  }
}

final ProfileEditBloc profileEditBloc = ProfileEditBloc();
