import 'package:flutter/material.dart';
import 'package:matterport/widgets/newCard.dart';
import 'package:matterport/provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';

class NewFolder extends StatefulWidget {
  NewFolder({required this.cards, required this.title, required this.index});

  final List<NewCard> cards;
  final String title;
  final int index;

  @override
  _NewFolderState createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  bool enterFolder = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Provider.of<Data>(context, listen: false)
            .changeToTrueAndChangeGrid(widget.cards);
        Provider.of<Data>(context, listen: false)
            .changeFolderIndex(widget.index);
      },
      child: Container(
        width: size.height / 3,
        height: size.height / 3,
        decoration: BoxDecoration(
          // color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(size.height / 50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.height / 5,
              child: Icon(
                Icons.folder,
                size: size.height / 15,
                color: Color(0xFF546e7a),
              ),
            ),
            Container(
              // color: Colors.green,
              width: size.height / 5,
              child: AutoSizeText(
                widget.title,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontSize: size.height / 40),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
