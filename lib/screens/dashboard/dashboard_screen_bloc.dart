// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  StreamController<bool> dashboardLoadingController = BehaviorSubject<bool>();

  Stream<bool> get dashboardLoadingStream => dashboardLoadingController.stream;

  Sink<bool> get dashboardLoadingSink => dashboardLoadingController.sink;

  getDashboardLoading(bool data) {
    dashboardLoadingSink.add(data);
  }

  void dispose() {
    dashboardLoadingController.close();
  }
}

final DashboardBloc dashboardBloc = DashboardBloc();
