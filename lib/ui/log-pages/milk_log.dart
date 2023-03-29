import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_onboarding/ui/log-pages/log_style.dart';

class MilkLog extends StatefulWidget {
  const MilkLog({super.key, required this.setMilk});

  final void Function(String milk) setMilk;

  @override
  State<MilkLog> createState() => _MilkLogState();
}

class _MilkLogState extends State<MilkLog> {
  TextEditingController editingController = TextEditingController();
  String milk = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogStyle.makeQuestion(
              "How many bottles of milk did your baby drink today?"),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  milk = text;
                });
              },
              controller: editingController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: "Number of bottles",
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: LogStyle.makeNextRow(
                milk.isNotEmpty, () => widget.setMilk(milk)),
          ),
        ],
      ),
    );
  }
}
