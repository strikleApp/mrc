import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:milk_calculator/modals/records.dart';
import 'package:milk_calculator/screen/first_screen.dart';
import 'package:milk_calculator/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  final bool isFirstTime;

  const LoadingScreen({super.key, required this.isFirstTime});

  static SharedPreferences? preferences;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Future getFuture;

  Future<void> initial() async {
    try {
      if (widget.isFirstTime) {
        await Future.delayed(const Duration(seconds: 1));
      }
      LoadingScreen.preferences = await SharedPreferences.getInstance();
      String? savedInstance = LoadingScreen.preferences!.getString(kRecords);
      if (savedInstance != null) {
        Map<String, dynamic> map = jsonDecode(savedInstance);
        map.forEach((k, v) {
          Records.addInMap(key: k, record: Records.fromJson(v));
        });
      }
    } catch (_) {}
  }

  @override
  void initState() {
    super.initState();
    getFuture = initial();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const FirstScreen();
        }
        return Scaffold(
          body: Image.asset(
            "assets/logo.png",
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
