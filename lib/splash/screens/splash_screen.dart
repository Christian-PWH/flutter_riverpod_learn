import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_learn/author/controller/author_controller.dart';
import 'package:flutter_riverpod_learn/author/screens/author_home.dart';
import 'package:flutter_riverpod_learn/common/controller/author_name_controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = '/splash_screen';

  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(authorNameControllerProvider.notifier).getAuthors();
    Timer(const Duration(seconds: 2),
        () => Navigator.popAndPushNamed(context, AuthorHomeScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.network(
                  "https://cdn.dribbble.com/users/1037957/screenshots/3484170/media/47a6ff2965356748b0987e5b155d6c12.png",
                ),
              ),
            ),
            const Text('from',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                )),
            const Text(
              "ENIGMA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
