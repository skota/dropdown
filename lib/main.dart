import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'DropDown Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class DayOfWeek {
  const DayOfWeek(this.id, this.name);

  final String name;
  final int id;
}

class _MyHomePageState extends State<MyHomePage> {
  DayOfWeek today;

  List<DayOfWeek> theWeek = <DayOfWeek>[
    const DayOfWeek(1, "Sunday"),
    const DayOfWeek(1, "Monday"),
    const DayOfWeek(2, "Tuesday"),
    const DayOfWeek(3, "Wednesday"),
    const DayOfWeek(4, "Thursday"),
    const DayOfWeek(5, "Friday"),
    const DayOfWeek(6, "Saturday"),
    const DayOfWeek(7, "Sunday"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Day of Week"),
            SizedBox(height: 10),
            DropdownButton<DayOfWeek>(
              value: today,
              onChanged: (DayOfWeek val) {
                setState(() {
                  today = val;
                });
              },
              items: theWeek.map((item) {
                return DropdownMenuItem<DayOfWeek>(
                  value: item,
                  child: Text(
                    item.name,
                    style: TextStyle(
                        color: Colors.black, decoration: TextDecoration.none),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
