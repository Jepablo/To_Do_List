import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../../utils/fetch_pixels.dart';
import '../../utils/form_style.dart';
import '../../utils/widget_utils.dart';

class RegisterTilePage extends StatefulWidget {
  final Function(String? name, String? email, String? password)? onSubmitted;
  const RegisterTilePage({this.onSubmitted,Key? key}) : super(key: key);

  @override
  State<RegisterTilePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterTilePage> {
  late final String name,email,password;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .04),
            const Text(
              "Sign Up,",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              "Enter detail to sign up to your account",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              labelText: "Name",
              // errorText: nameError,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: "Email Address",
              // errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: "Password",
              // errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            getVerSpace(FetchPixels.getPixelHeight(20)),
            SizedBox(height: 10,),
            Row(
              children:[
                FormButton(
                  text: "Sign Up",
                  // onPressed: submit,
                  onPressed: (){


                  },
                  // onPressed: _isChecked? (){
                  //   setState(() {
                  //     if (_isChecked != false)submit();
                  //   });
                  // }: null
                ),
              ],
            ),
            SizedBox(height: screenHeight * .025),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: const TextSpan(
                  text: "I'm already a member, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
