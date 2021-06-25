import 'package:dummy/model/image.dart';
import 'package:dummy/services/apicall.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

class ImageController extends GetxController {
  var isLoading = true.obs;
  var imageList =<Images>[].obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  void fetchImages() async {
    try {
      isLoading(true);
      var images = await  ApiCall.fetchImages();
      if (images != null) {
        imageList.value = images;
        print(images);
      }
    } finally {
      isLoading(false);
    }
  }
}