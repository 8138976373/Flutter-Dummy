import 'package:dummy/Views/imagecontainer.dart';
import 'package:dummy/Widget/CustomButton.dart';
import 'package:dummy/Widget/CustomText.dart';
import 'package:dummy/controller/imagecontroller.dart';
import 'package:dummy/controller/networkcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ImageView extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());
  final NetworkController networkController = Get.put(NetworkController());

  double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.ac_unit,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Images',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: buildObx(),
          )
        ],
      ),
    );
  }

  Obx buildObx() {
    return Obx(() {
      if (!networkController.isNetworkAvailable.value) {
        return Column(
          children: [
            CustomText(
              text: "Please check the network ",
              size: 20,
              alignment: MainAxisAlignment.center,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.network_check),
              iconSize: 150,
              padding: EdgeInsets.only(top: 20),
            )
          ],
        );
      } else if (imageController.isLoading.value)
        return Center(
            child: CircularProgressIndicator(
          strokeWidth: 6,
        ));
      else if (imageController.error.isNotEmpty) {
        return Column(
          children: [
            CustomText(
              text: imageController.error.toString(),
              size: 20,
              alignment: MainAxisAlignment.center,
            ),
            IconButton(
              onPressed: () {
                imageController.fetchImages();
                buildObx();
              },
              icon: Image.asset("assets/images/refresh.png"),
              iconSize: 150,
              padding: EdgeInsets.only(top: 20),
            )
          ],
        );
      } else
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: imageController.imageList.length,
          crossAxisSpacing: 16,
          padding: EdgeInsets.all(5),
          mainAxisSpacing: 16,
          itemBuilder: (context, index) {
            return ImageContainer(imageController.imageList[index]);
          },
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        );
    });
  }
}
