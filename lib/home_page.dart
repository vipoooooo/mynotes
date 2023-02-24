import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return LoginView();

            default:
              return const Text("Loading...");
          }
        },
      ),
    );
  }
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Please verify your email address"),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          },
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor)),
          child: const Text("Send email verification"),
        )
      ],
    );
  }
}
