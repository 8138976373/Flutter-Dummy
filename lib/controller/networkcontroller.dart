import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  RxBool isNetworkAvailable = false.obs;
  StreamSubscription? sub;

  @override
  void onInit() {
    sub = Connectivity().onConnectivityChanged.listen((result) {
      isNetworkAvailable(result != ConnectivityResult.none);
    });
    super.onInit();
  }


  @override
  void dispose() {
    sub!.cancel();
    super.dispose();
  }
}