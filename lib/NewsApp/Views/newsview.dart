import 'package:dummy/NewsApp/newsInfo.dart';
import 'package:dummy/Widget/CustomText.dart';
import 'package:dummy/NewsApp/newsblockController.dart';
import 'package:dummy/commoncontroller/networkcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewsView extends StatelessWidget {
  final _newsBloc = NewsBloc();
  final NetworkController networkController =
      Get.put(NetworkController(), tag: "network");

  // @override
  // void dispose() {
  //   _newsBloc.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    _newsBloc.eventSink.add(NewsAction.Fetch);
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: Container(
          child: Obx(
            () {
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
              }
              // } else if (imageController.isLoading.value)
              //   return Center(
              //       child: CircularProgressIndicator(
              //         strokeWidth: 6,
              //       ));
              else
                return StreamBuilder<List<Article>>(
                  stream: _newsBloc.newsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Column(
                        children: [
                          CustomText(
                            text: snapshot.error.toString(),
                            size: 20,
                            alignment: MainAxisAlignment.center,
                          ),
                          IconButton(
                            onPressed: () {
                              // imageController.fetchImages();
                              // buildObx();
                            },
                            icon: Image.asset("assets/images/refresh.png"),
                            iconSize: 150,
                            padding: EdgeInsets.only(top: 20),
                          )
                        ],
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var article = snapshot.data![index];
                            var formattedTime = DateFormat('dd MMM - HH:mm')
                                .format(article.publishedAt!);
                            return Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(
                                          article.url ??
                                              "https://upload.wikimedia.org/wikipedia/commons/5/5f/Larkmead_School%2C_Abingdon%2C_Oxfordshire.png",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(formattedTime),
                                        Text(
                                          article.title!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          article.description!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else
                      return Center(child: CircularProgressIndicator());
                  },
                );
            },
          ),
        ));
  }
}
