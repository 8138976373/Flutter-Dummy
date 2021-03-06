import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../imagegetxcontroller.dart';

class ViewImage extends StatelessWidget {
  final int index;
  ViewImage({required this.index});
  // final ImageController imageController = Get.find(tag: 'images');
  // String url = Get.find<ImageController>(tag: 'images').url as String;
  List image = Get.find<ImageController>(tag: 'images').imageList;

  @override
  Widget build(BuildContext context) {
    String url = image[index].urls!.full!;
    late String categories;
    if (image[index].categories as String != "") {
      categories = image[index].categories.toString();
    } else {
      categories = "No Category Available";
    }

    return Scaffold(
      body: Obx(() {
        return Card(
          margin: EdgeInsets.only(top: 30),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 8,
                ),
                Row(
                  children: [
                    Text(
                      categories,
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.w800),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    if (image[index].likes != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              image[index].categories.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(width: 50),
                    Text('\$${image[index].likes}',
                        style: TextStyle(fontSize: 32)),
                  ],
                ),
                Text(image[index].description.toString())
              ],
            ),
          ),
        );
      }),
    );
  }
}
