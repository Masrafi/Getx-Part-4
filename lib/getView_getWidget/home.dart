import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_part4/getView_getWidget/count_controller.dart';

//GetView
//Get.put(CountController());

//GetWidget
// Get.create(() => CountController());
class HomeGetView extends GetWidget<CountController> {
  @override
  Widget build(BuildContext context) {
    //Get.put(CountController());
    Get.create(() => CountController());
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("GetView"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    "The value is ${controller.count}",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                RaisedButton(
                  child: Text("Increment"),
                  onPressed: () {
                    print(controller.hashCode);
                    controller.increment();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
