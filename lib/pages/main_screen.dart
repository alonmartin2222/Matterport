// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:matterport/widgets/back_arrow.dart';
import 'package:matterport/widgets/logout_button.dart';
import 'package:matterport/widgets/main_grid.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

import 'dart:html';

import '../provider/provider.dart';

class MainScreen extends StatefulWidget {
  final String email;

  MainScreen({required this.email});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String title = "";

  changeTitle(String name) {
    setState(() {
      title = name;
    });
  }

  user(String email, String collection, String name) {
    if (widget.email == email) {
      CollectionReference users =
          FirebaseFirestore.instance.collection(collection);
      startFirestore(users);
      changeTitle(name);
    }
  }

  checkUserConnected() {
    user("alonmartin2222@gmail.com", "denia", "דניה סיבוס");
    user("test@gmail.com", "africa", "אפריקה ישראל");
    user("onsight@gmail.com", "onsight", "אונסייט");
  }

  @override
  void initState() {
    checkUserConnected();
    super.initState();
  }

  Future<void> startFirestore(users) async {
    await users.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Provider.of<Data>(context, listen: false).addNewFolder(doc);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LogoutButton(size: size),
        ),
        toolbarHeight: size.height / 10,
        centerTitle: true,
        backgroundColor: Color(0xFF29434e),
        title: Text(
          title,
          style: TextStyle(fontSize: size.height / 40),
        ),
      ),
      body: Stack(
        children: [
          Background(size: size),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Provider.of<Data>(context).gridMode == 2
                            ? BackArrow(size: size)
                            : Container(),
                        MainGrid(size: size)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Image(
        image: AssetImage("assets/building.jpg"),
        fit: BoxFit.fill,
      ),
    );
  }
}
