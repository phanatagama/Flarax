import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flarax/app/core/values/colors.dart';
import 'package:flarax/app/core/values/constant.dart';
import 'package:flarax/app/modules/product/contoller/product_controller.dart';
import 'package:flarax/app/modules/product/widgets/product_grid_card_widget.dart';
import 'package:flarax/app/modules/product/widgets/product_list_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProductPage extends GetView<ProductController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              focusNode: ProductController.focusNode,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: Const.HINTSEARCHPRODUCT,
                border: InputBorder.none,
              ),
              onChanged: (query){
                controller.keyword.value = query;
                controller.filterProduct();
              },
            ),
          ),
        ),
      ),
      body: buildBody()
    );
  }
  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            height: 64,
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: [Expanded(child: 
             ListView.builder(
               shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Const.CATEGORYPRODUCT.length,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                var item = Const.CATEGORYPRODUCT[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Obx(() => FilterChip(
                                  selectedColor: blueColor,
                                  selected: controller.isSelectFilter(item),
                                  onSelected: (isSelected) {
                                    controller.selectFilter(isSelected, item);
                                    controller.filterProduct();
                                  },
                                  shadowColor: greyBlueColor,
                                  shape: StadiumBorder(side: BorderSide(color: blueColor)),
                                  pressElevation: 5,
                                  checkmarkColor: Colors.white,
                                  label: Text(item, style: Theme.of(Get.context!).textTheme.button!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                                ),),
                );
              },
            ),
         ),Obx(() => IconButton(
                                  icon: controller.layoutGrid.value
                                      ? Icon(
                                          Icons.format_list_bulleted,
                                          color: blueColor,
                                        )
                                      :  Icon(
                                          Icons.grid_view,
                                          color: blueColor,
                                        ),
                                  onPressed: () => controller.layoutGrid.toggle(),
                                ),), ],),),
        Expanded(
          child: Scrollbar(
            child: StreamBuilder(
              stream: ProductController.getAllProducts(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if(snapshots.data!.docs.isEmpty){
                    return Center(child: Lottie.asset(Const.NOTINTERNETANIMATE),);
                  }
                  controller.items.value = snapshots.data!.docs;
                  return Obx(() {
                  List data = (controller.itemsAfterFilter.isNotEmpty) ? controller.itemsAfterFilter : controller.items;
                  if (controller.keyword.value.isNotEmpty && controller.itemsAfterFilter.isEmpty){
                    return Center(child: Lottie.asset(Const.NOTFOUNDANIMATE),);
                  }
                    return controller.layoutGrid.value
                      ? productGridCard( data) : productListCard( data);
                }
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ],
    );
  }
}