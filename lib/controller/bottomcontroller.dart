


import 'package:dummy/model/image.dart';
import 'package:dummy/services/apicall.dart';
import 'package:get/get.dart';

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


//
// hideButtonController = new ScrollController();
// _hideButtonController.addListener(() {
// if (_hideButtonController.position.userScrollDirection ==
// ScrollDirection.reverse) {
// if(_isVisible)
// setState(() {
// _isVisible = false;
// print("**** $_isVisible up");
// });
// }
// if (_hideButtonController.position.userScrollDirection ==
// ScrollDirection.forward) {
// if(!_isVisible)
// setState(() {
// _isVisible = true;
// print("**** $_isVisible down");
// });
// }
// });