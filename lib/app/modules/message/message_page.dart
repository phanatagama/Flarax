import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/utils/utilities.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/data/models/user_model.dart';
import 'package:flarax/app/modules/message/controller/message_controller.dart';
import 'package:flarax/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MessagePage extends GetView<MessageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Const.MESSAGE.toUpperCase(),
          style: TextStyle(color: titleColor),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Column(
              children: [
                buildSearchBar(),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: MessageController.getStreamFireStore(
                        Const.PATHUSERCOLLECTION,
                        controller.limit.value,
                        controller.keyword.value),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        if ((snapshot.data?.docs.length ?? 0) > 0) {
                          controller.items.value = snapshot.data!.docs;
                          return Obx(() {
                            List data = (controller.itemsAfterFilter.isNotEmpty)
                                ? controller.itemsAfterFilter
                                : controller.items;
                            if (controller.keyword.value.isNotEmpty &&
                                controller.itemsAfterFilter.isEmpty) {
                              return Center(
                                child: Lottie.asset(Const.NOTFOUNDANIMATE),
                              );
                            }
                            return buildItem(context, data);
                          });
                        } else {
                          return Center(
                            child: Text("No users"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: blueColor,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),

            // Loading
            Positioned(
              child: controller.isLoading.value
                  ? CircularProgressIndicator()
                  : SizedBox.shrink(),
            )
          ],
        ),
        onWillPop: () {
          Get.back();
          return Future.value(false);
        },
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: controller.searchBarTec,
                  onChanged: (value) {
                    controller.searchDebouncer.run(() {
                      if (value.isNotEmpty) {
                        controller.btnClearController.add(true);
                        controller.keyword.value = value;
                      } else {
                        controller.btnClearController.add(false);
                        controller.keyword.value = "";
                      }
                      controller.filterUser();
                    });
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: Const.SEARCHCONTACT,
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                  style: TextStyle(fontSize: 13),
                ),
              ),
              StreamBuilder<bool>(
                  stream: controller.btnClearController.stream,
                  builder: (context, snapshot) {
                    return snapshot.data == true
                        ? GestureDetector(
                            onTap: () {
                              controller.searchBarTec.clear();
                              controller.btnClearController.add(false);
                              controller.keyword.value = "";
                              controller.filterUser();
                            },
                            child: Icon(Icons.clear_rounded,
                                color: blueColor, size: 20))
                        : SizedBox.shrink();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, List document) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        if (document[index] != null) {
          Map<String, dynamic> userChatData =
              document[index].data() as Map<String, dynamic>;
          UserModel userChat = UserModel.fromMap(userChatData);
          if (userChat.uid == controller.currentUserId) {
            return SizedBox.shrink();
          } else {
            return Container(
              child: TextButton(
                child: Row(
                  children: <Widget>[
                    Material(
                      child: userChat.photoUrl.isNotEmpty
                          ? Image.network(
                              userChat.photoUrl,
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  width: 50,
                                  height: 50,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: blueColor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                      null &&
                                                  loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (context, object, stackTrace) {
                                return Icon(
                                  Icons.account_circle,
                                  size: 50,
                                  color: defaultGreenColor,
                                );
                              },
                            )
                          : Icon(
                              Icons.account_circle,
                              size: 50,
                              color: borderGreenColor,
                            ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      clipBehavior: Clip.hardEdge,
                    ),
                    Flexible(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                '${userChat.fullname.capitalize}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        color: blueColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
                            ),
                            Container(
                              child: Text(
                                userChat.email,
                                maxLines: 1,
                                style: TextStyle(color: blueColor),
                              ),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(left: 20),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  if (Utilities.isKeyboardShowing()) {
                    Utilities.closeKeyboard(context);
                  }
                  Get.toNamed(Routes.CHAT, arguments: [
                    userChat.uid,
                    userChat.photoUrl,
                    userChat.fullname
                  ]);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white70),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            );
          }
        } else {
          return SizedBox.shrink();
        }
      },
      itemCount: document.length,
      controller: controller.listScrollController,
    );
    //   if (document != null) {
    //     Map <String, dynamic> userChatData = document.data() as Map<String, dynamic>;
    //     UserModel userChat = UserModel.fromMap(userChatData);
    //     if (userChat.uid == controller.currentUserId ) {
    //       return SizedBox.shrink();
    //     } else {
    //       return Container(
    //         child: TextButton(
    //           child: Row(
    //             children: <Widget>[
    //               Material(
    //                 child: userChat.photoUrl.isNotEmpty
    //                     ? Image.network(
    //                         userChat.photoUrl,
    //                         fit: BoxFit.cover,
    //                         width: 48,
    //                         height: 48,
    //                         loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    //                           if (loadingProgress == null) return child;
    //                           return Container(
    //                             width: 50,
    //                             height: 50,
    //                             child: Center(
    //                               child: CircularProgressIndicator(
    //                                 color: blueColor,
    //                                 value: loadingProgress.expectedTotalBytes != null &&
    //                                         loadingProgress.expectedTotalBytes != null
    //                                     ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
    //                                     : null,
    //                               ),
    //                             ),
    //                           );
    //                         },
    //                         errorBuilder: (context, object, stackTrace) {
    //                           return Icon(
    //                             Icons.account_circle,
    //                             size: 50,
    //                             color: defaultGreenColor,
    //                           );
    //                         },
    //                       )
    //                     : Icon(
    //                         Icons.account_circle,
    //                         size: 50,
    //                         color: borderGreenColor,
    //                       ),
    //                 borderRadius: BorderRadius.all(Radius.circular(25)),
    //                 clipBehavior: Clip.hardEdge,
    //               ),
    //               Flexible(
    //                 child: Container(
    //                   child: Column(
    //                     children: <Widget>[
    //                       Container(
    //                         child: Text(
    //                           'Nickname: ${userChat.fullname}',
    //                           maxLines: 1,
    //                           style: TextStyle(color: blueColor),
    //                         ),
    //                         alignment: Alignment.centerLeft,
    //                         margin: EdgeInsets.fromLTRB(10, 0, 0, 5),
    //                       ),
    //                       Container(
    //                         child: Text(
    //                           userChat.email,
    //                           maxLines: 1,
    //                           style: TextStyle(color: blueColor),
    //                         ),
    //                         alignment: Alignment.centerLeft,
    //                         margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
    //                       )
    //                     ],
    //                   ),
    //                   margin: EdgeInsets.only(left: 20),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           onPressed: () {
    //             if (Utilities.isKeyboardShowing()) {
    //               Utilities.closeKeyboard(context);
    //             }
    //             Get.toNamed(Routes.CHAT, arguments: [
    //               userChat.uid,
    //               userChat.photoUrl,
    //               userChat.fullname
    //               ]);
    //           },
    //           style: ButtonStyle(
    //             backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
    //             shape: MaterialStateProperty.all<OutlinedBorder>(
    //               RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
    //               ),
    //             ),
    //           ),
    //         ),
    //         margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
    //       );
    //     }
    //   } else {
    //     return SizedBox.shrink();
    //   }
  }
}
