import 'package:fire1/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Successfully Loggedout")));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(user!.email.toString()),
      ),
    );
  }
}
