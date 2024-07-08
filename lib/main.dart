import 'package:bloc_practice/bloc_practice_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "assets/config/.env");
  runApp(
    const BlocPracticeApp(),
  );
}
