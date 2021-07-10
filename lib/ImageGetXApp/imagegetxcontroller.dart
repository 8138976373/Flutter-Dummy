import 'package:dummy/commonservices/getit.dart';
import 'package:get/get.dart';

import 'image.dart';
import 'imageservice.dart';

class ImageController extends GetxController {
  RxBool isLoading = true.obs;
  RxList imageList = <Images>[].obs;
  RxString url = 'photos'.obs;
  RxString error = "".obs;
  DioServices _dioServices = locator<DioServices>();

  @override
  void onInit() {
    error.value = "";
    if (isLoading.isTrue) {
      fetchImages();
    }

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void fetchImages() async {
    try {
      isLoading(true);
      List images = await _dioServices.getAPI(url.toString());
      // dioServices.getAPI(url).catchError(onError)
      // DioServices.postData();
      if (images != null) {
        imageList.value = images;
        // print(imageList.value);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
