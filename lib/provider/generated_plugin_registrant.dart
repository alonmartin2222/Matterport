//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_functions_web/cloud_functions_web.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth_web/firebase_auth_web.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_core_web/firebase_core_web.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FirebaseFirestoreWeb.registerWith(registrar);
  FirebaseFunctionsWeb.registerWith(registrar);
  FirebaseAuthWeb.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
