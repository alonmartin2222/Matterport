import 'package:flutter/material.dart';
import 'package:matterport/provider/authentication.dart';
import 'package:matterport/provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "התנתק",
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      disabledColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: size.height / 20,
      icon: Icon(Icons.logout),
      onPressed: () {
        context.read<Data>().restartFolders();
        context.read<AuthenticationService>().signOut();
      },
    );
  }
}
