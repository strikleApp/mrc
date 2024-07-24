import 'package:flutter/material.dart';
import 'package:milk_calculator/modals/records.dart';
import 'package:milk_calculator/screen/result_screen.dart';
import 'package:milk_calculator/screen/loading_screen.dart';
import 'package:milk_calculator/shared_preferences_keys.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.error,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                'Reset',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            onPressed: () async {
              await UnityAds.load(
                placementId:
                    'Interstitial_Android_66698fb1_a43d_47f3_b578_2d22e99f48e8',
                onComplete: (_) async {
                  await UnityAds.showVideoAd(
                    placementId:
                        'Interstitial_Android_66698fb1_a43d_47f3_b578_2d22e99f48e8',
                  );
                },
              );
              Records.mapOfRecords.clear();
              LoadingScreen.preferences!.remove(kRecords);
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoadingScreen(
                      isFirstTime: false,
                    ),
                  ),
                );
              }
            },
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 2,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () async {
                double? oneLiterRate =
                    LoadingScreen.preferences!.getDouble(kRateKey);
                if (oneLiterRate == null || oneLiterRate <= 0) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('No Rate Found!'),
                      content:
                          Text('Please Enter valid 1 Liter Rate to Calculate'),
                    ),
                  );
                } else {
                  double totalMilliliter = 0;
                  double totalPrice = 0;
                  Records.mapOfRecords.forEach((String k, Records v) {
                    Records record = v;
                    totalMilliliter += record.getTotalMillilitre();
                    totalPrice += record.getTotalRate(oneLiterRate);
                  });
                  double totalLiter = totalMilliliter / 1000;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        oneLiterRate: oneLiterRate,
                        totalLiter: totalLiter,
                        totalPrice: totalPrice,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
