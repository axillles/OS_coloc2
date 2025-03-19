import 'package:flutter/material.dart';
import 'package:hackathon/screens/search_screen.dart';
import 'package:hackathon/screens/all_addresses_screen.dart';
import 'package:hackathon/screens/alarm_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCHS App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
              child: Text('Поиск'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllAddressesScreen())),
              child: Text('Список всех'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AlarmScreen())),
              child: Text('Тревога'),
            ),
          ],
        ),
      ),
    );
  }
}