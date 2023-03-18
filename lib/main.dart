import 'package:clima_app/get_weather.dart';
import 'package:clima_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main(){
  runApp(Climate());
}

class Climate extends StatelessWidget {
  const Climate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
      }
}