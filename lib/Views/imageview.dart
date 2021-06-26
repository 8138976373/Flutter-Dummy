import 'package:dummy/Views/homepage.dart';
import 'package:dummy/Views/imagecontainer.dart';
import 'package:dummy/controller/imagecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ImageView extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());
  double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
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
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
               
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (imageController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
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
            }),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
      FloatingActionButton(child:  new Image.asset('assets/images/flotting.png',width: 25,height: 25,),backgroundColor: Colors.orange[700], onPressed: (){},),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton( icon:new Image.asset('assets/images/homed.png',),iconSize:iconSize,padding:EdgeInsets.fromLTRB(15,5,0,5),onPressed: (){
                  HomePage();
                },),
                IconButton( icon:new Image.asset('assets/images/likes.png',),iconSize:iconSize,padding:EdgeInsets.fromLTRB(0,0,20,0), onPressed: (){},),
                IconButton( icon:new Image.asset('assets/images/calender.png',),iconSize:iconSize,padding:EdgeInsets.fromLTRB(20,5,0,0), onPressed: (){},),
                IconButton( icon:new Image.asset('assets/images/aaaa.png',), iconSize:iconSize, padding:EdgeInsets.fromLTRB(0,10,15.0,5),onPressed: (){},),
              ],
            ),
          )),
    );
  }
}