import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double totalLiter;
  final double oneLiterRate;
  final double totalPrice;

  const ResultScreen(
      {super.key,
      required this.totalPrice,
      required this.oneLiterRate,
      required this.totalLiter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: const Text('Total Price'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultRow(
            text1: 'Total Liter Milk',
            text2: '${totalLiter.toString()} Liter',
          ),
          const SizedBox(
            height: 20.0,
          ),
          ResultRow(
            text1: 'Rate of 1Liter Milk',
            text2: '₹ ${oneLiterRate.toString()} Per Liter',
          ),
          const SizedBox(height: 20.0),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹ ${totalPrice.abs().round().toString()}',
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResultRow extends StatelessWidget {
  final String text1;
  final String text2;

  const ResultRow({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 22.0),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 22.0),
        ),
      ],
    );
  }
}
