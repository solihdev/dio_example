import 'package:dio_example/ui/sample_usage.dart';
import 'package:dio_example/ui/sample_usage_category.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [
    SampleUsage(),
    SampleUsageCategory(),
  ];
  int index=0;

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().toString());
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (value){
          setState((){
            index=value;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: ""),
        ],
      ),
    );
  }
}