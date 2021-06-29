import 'package:dummy/model/image.dart';
import 'package:dummy/services/apicall.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  var isLoading = true.obs;
  var imageList = <Images>[].obs;
  var name = "", password = "";
  final phoneController = TextEditingController().obs;
  final nameController = TextEditingController().obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  void fetchImages() async {
    try {
      isLoading(true);
      var images = await  DioServices.getAPI();
      if (images != null) {
        imageList.value = images;
        print(images);
      }
    } finally {
      isLoading(false);
    }
  }
}