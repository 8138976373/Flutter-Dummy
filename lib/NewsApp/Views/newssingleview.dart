// import 'package:dummy/controller/networkcontroller.dart';

import 'package:dummy/commoncontroller/networkcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsSingleView extends StatelessWidget {
  // const NewsSingleView({ Key? key }) : super(key: key);
  final NetworkController networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  // article.url ??
                  "https://upload.wikimedia.org/wikipedia/commons/5/5f/Larkmead_School%2C_Abingdon%2C_Oxfordshire.png",
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
