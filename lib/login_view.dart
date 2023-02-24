import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              controller: _email,
              decoration: const InputDecoration(
                labelText: "Enter your email",
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: _password,
              decoration: const InputDecoration(
                labelText: "Enter your password",
                border: OutlineInputBorder(),
                filled: true,
              ),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;

                try {
                  final userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  print(userCredential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == "user-not-found") {
                    print("User not found");
                  } else if (e.code == "wrong-password") {
                    print("Wrong password");
                  }
                }
              },
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).primaryColor)),
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: const Text(" Change to Register"),
            )
          ],
        ),
      ),
    );
  }
}
