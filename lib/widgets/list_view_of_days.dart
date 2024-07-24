import 'package:flutter/material.dart';
import 'package:milk_calculator/modals/records.dart';

class ListViewOfDays extends StatefulWidget {
  const ListViewOfDays({super.key});

  @override
  State<ListViewOfDays> createState() => _ListViewOfDaysState();
}

class _ListViewOfDaysState extends State<ListViewOfDays> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 31,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        int days = index + 1;
        int litreValue = Records.getLitre(id: days.toString());
        int millilitreValue = Records.getMillilitre(id: days.toString());

        return Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Day $days",
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<int>(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Text("L"),
                    alignment: Alignment.center,
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    value: litreValue,
                    items: <int>[0, 1, 2, 3, 4, 5].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        alignment: Alignment.center,
                        child: Text(
                          value.toString(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (int? value) async {
                      Records record = Records.mapOfRecords[days.toString()] ??
                          Records(id: days.toString());
                      record.setLitre(value ?? 0);
                      Records.addInMap(key: days.toString(), record: record);
                      setState(() {
                        litreValue = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<int>(
                    borderRadius: BorderRadius.circular(10),
                    alignment: Alignment.center,
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    icon: const Text("mL"),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    value: millilitreValue,
                    items: <int>[
                      0,
                      250,
                      500,
                      750,
                    ].map((int value) {
                      return DropdownMenuItem<int>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(
                          value.toString(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }).toList(),
                    onChanged: (int? value) async {
                      Records record = Records.mapOfRecords[days.toString()] ??
                          Records(id: days.toString());
                      record.setMillilitre(value ?? 0);
                      Records.addInMap(key: days.toString(), record: record);
                      setState(() {
                        millilitreValue = value!;
                      });
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "=",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${Records.getTotalLiter(days.toString())} L",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
