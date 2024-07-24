import 'package:flutter/material.dart';
import 'package:milk_calculator/constants/strings.dart';
import 'package:milk_calculator/screen/loading_screen.dart';
import 'package:milk_calculator/shared_preferences_keys.dart';
import 'package:milk_calculator/widgets/decorated_container.dart';

class UpperRow extends StatefulWidget {
  const UpperRow({super.key});

  @override
  UpperRowState createState() => UpperRowState();
}

class UpperRowState extends State<UpperRow> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    double? rate = LoadingScreen.preferences!.getDouble(kRateKey) ?? 0;
    if (rate != 0) {
      _textEditingController.text = rate.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DecoratedContainer(
          widget: Text(
            kOneLiterRateInRupee,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        DecoratedContainer(
          widget: SizedBox(
            height: 25,
            child: TextField(
              autofocus: false,
              controller: _textEditingController,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.onPrimary),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Enter Rate"),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  try {
                    LoadingScreen.preferences!
                        .setDouble(kRateKey, double.parse(value));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Rate can only be numbers."),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
