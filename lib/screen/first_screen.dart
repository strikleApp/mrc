import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:milk_calculator/widgets/bottom_buttons.dart';
import 'package:milk_calculator/widgets/list_view_of_days.dart';
import 'package:milk_calculator/widgets/upper_row.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Milk Recorder and Calculator'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              AdaptiveTheme.of(context).toggleThemeMode(useSystem: false);
            },
            icon: const Icon(Icons.color_lens_rounded),
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UpperRow(),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: ListViewOfDays(),
          ),
          BottomButtons()
        ],
      ),
    );
  }
}
