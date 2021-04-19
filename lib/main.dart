import 'package:flutter/material.dart';
import 'package:thelastone/helper/platform_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String batteryLevelValue = 'Unklwom';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The last one'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/logo.png",
              width: 100.0,
              height: 100.0,
            ),
            TextButton(
              onPressed: () async {
                var batterielevel = await PlatformHelper.getBatteryLevel();
                print('battery level : $batterielevel');
                setState(() {
                  batteryLevelValue = batterielevel;
                });
              },
              child: Text('Get battery level'),
            ),
            Container(
              height: 16.0,
            ),
            Text(batteryLevelValue)
          ],
        ),
      ),
    );
  }
}
