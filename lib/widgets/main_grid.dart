import 'package:flutter/material.dart';
import 'package:matterport/provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class MainGrid extends StatelessWidget {
  const MainGrid({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.height / 13),
      child: Provider.of<Data>(context).gridMode == 2
          ? GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: size.height / 10,
              mainAxisSpacing: size.height / 20,
              children: Provider.of<Data>(context)
                  .newFolder[Provider.of<Data>(context).folderIndex]
                  .cards,
            )
          : Provider.of<Data>(context).gridMode == 1
              ? GridView.count(
                  crossAxisSpacing: size.height / 10,
                  mainAxisSpacing: size.height / 20,
                  crossAxisCount: 5,
                  children: Provider.of<Data>(context).newFolder,
                )
              : Container(),
    );
  }
}
