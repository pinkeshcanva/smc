import 'dart:async';
import 'dart:developer';
import 'package:smc/networks/db_constants.dart';
import 'package:rxdart/rxdart.dart';

class HomepageBloc {
  List<Map> categoryList = [];
  StreamController<bool> homepageLoadingController = BehaviorSubject<bool>();
  StreamController<List<Map>> categoriesListController =
      BehaviorSubject<List<Map>>();

  Stream<bool> get homepageLoadingStream => homepageLoadingController.stream;

  Stream<List<Map>> get categoriesListStream => categoriesListController.stream;

  Sink<bool> get homepageLoadingSink => homepageLoadingController.sink;

  Sink<List<Map>> get categoriesListSink => categoriesListController.sink;

  getHomepageLoading(bool data) {
    homepageLoadingSink.add(data);
  }

  Future addCategory(String categoryName) async {
    getHomepageLoading(true);
    String? key = ref.push().key;
    await ref.child("categories").child(key!).set({
      'key': key,
      'label': categoryName.toUpperCase(),
    }).then((value) {
      getCategoryList();
    });
  }

  Future getCategoryList() async {
    final snapshot = await ref.child("categories").get();
    if (snapshot.exists) {
      Map temp = snapshot.value as Map;
      categoryList.clear();
      temp.forEach((key, value) {
        categoryList.add(value);
      });
      getHomepageLoading(false);
      homepageBloc.categoriesListSink.add(categoryList);
    } else {
      log("No data available");
      getHomepageLoading(false);
      homepageBloc.categoriesListSink.add([]);
    }
  }

  void dispose() {
    homepageLoadingController.close();
    categoriesListController.close();
  }
}

final HomepageBloc homepageBloc = HomepageBloc();
