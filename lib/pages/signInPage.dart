import 'package:flutter/material.dart';
import 'package:matterport/provider/authentication.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            child: Image(
              image: AssetImage("assets/building.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              height: size.height / 2,
              width: size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.height / 3.2,
                    height: size.height / 15,
                    child: TextField(
                      cursorColor: Color(0xFF29434e),
                      textAlign: TextAlign.center,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "כתובת מייל",
                        hintStyle: TextStyle(fontSize: size.height / 60),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF29434e), width: 2.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height / 15,
                    width: size.height / 3.2,
                    child: TextField(
                      obscureText: true,
                      cursorColor: Color(0xFF29434e),
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "סיסמא",
                        hintStyle: TextStyle(fontSize: size.height / 60),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF29434e), width: 2.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: size.height / 3.2,
                    height: size.height / 20,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xFF29434e)),
                      onPressed: () {
                        context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                      },
                      child: Text(
                        "התחבר",
                        style: TextStyle(fontSize: size.height / 60),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
