import 'package:fbanime/screens/loginSignup.dart';
import 'package:flutter/material.dart';

Future navPushReplacement(context, route) =>
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
