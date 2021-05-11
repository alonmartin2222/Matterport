import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:matterport/widgets/newCard.dart';
import 'package:matterport/widgets/new_folder.dart';

class Data extends ChangeNotifier {
  bool isFolder = false;
  List<NewCard> newcards = [];
  List<NewFolder> newFolder = [];

  List<NewFolder> newFoldersFromFirebase = [];
  int folderIndex = 0;
  int gridMode = 0;

  changeToTrueAndChangeGrid(List<NewCard> cards) {
    gridMode = 2;
    newcards = cards;

    notifyListeners();
  }

  changeToTrue() {
    gridMode = 1;
    notifyListeners();
  }

  restartFolders() {
    newFolder.clear();
    gridMode = 0;
    notifyListeners();
  }

  changeFolderIndex(index) {
    folderIndex = index;
    notifyListeners();
  }

  addNewFolder(doc) {
    newFoldersFromFirebase.add(NewFolder(
      cards: genareteCards(doc),
      title: doc.id,
      index: doc.data()["${0}"][4],
    ));

    print(doc.id);
    print(doc.data()["${0}"][4]);
    newFolder = newFoldersFromFirebase;

    gridMode = 1;
    // print(newFolder[1]);
    notifyListeners();
  }

  List<NewCard> genareteCards(doc) {
    List<NewCard> alon = [];
    for (var i = 0; i < doc.data().length; i++) {
      // print(doc.data()["${i}"][0]);

      final IFrameElement iframeElement = IFrameElement();

      String src = doc.data()["${i}"][0];
      String image = doc.data()["${i}"][1];
      String gif = doc.data()["${i}"][2];
      String title = doc.data()["${i}"][3];

      print(src);

      iframeElement.height = '500';
      iframeElement.width = '500';
      iframeElement.src = src;
      iframeElement.style.border = 'none';

      ui.platformViewRegistry
          .registerViewFactory('${src}', (int viewId) => iframeElement);

      alon.add(NewCard(
        src: src,
        image: image,
        gif: gif,
        title: title,
      ));

      print(alon);
    }

    return alon;
  }
}
