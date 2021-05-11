import 'package:flutter/material.dart';
import 'package:matterport/provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, bottom: 40),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          width: size.height / 10,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: size.height / 15,
                color: Color(0xFF29434e),
              ),
              onPressed: () {
                Provider.of<Data>(context, listen: false).changeToTrue();
              }),
        ),
      ),
    );
  }
}
