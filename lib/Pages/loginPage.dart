import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/loginimage.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.00,
            ),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.00,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.00, horizontal: 32.00),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Name.",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your Password.",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20.00,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Hii Devansh");
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
