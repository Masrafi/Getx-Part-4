import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Home extends StatelessWidget {
  var emailEditingController = TextEditingController();
  var storage = GetStorage();

  var show;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get Stroge & Email Validation"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  controller: emailEditingController,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text("Write"),
                  onPressed: () {
                    if (GetUtils.isEmail(emailEditingController.text)) {
                      storage.write("email", emailEditingController.text);
                    } else {
                      Get.snackbar(
                          "InCorrect Email", "Provide Email in valid format",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                child: Text("Read"),
                onPressed: () {
                  print("The Email is ${storage.read('email')}");
                  show = storage.read('email');
                },
              ),
              Text(show ?? null)
            ],
          ),
        ),
      ),
    );
  }
}

//To lissten for changes
//var listen= storage.listen(() {print("Email Chnaged");} );

//when subscribeed to listen event it should be disposed by using
//storage.removeListen(listen);

//To listen for changes in key
//storage.listenKey('email', (value){print('new key is $value');});

//Remove a key
//storage.remove('email');

//erase the container
//storage.erase();

//create container with a name
//GetStorage g = GetStorage('MyStorage');
//await GetStorage.init('MyStorage');
