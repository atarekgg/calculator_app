import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_task2/assets/app_images.dart';
import 'package:my_flutter_task2/bloc/calculator_bloc.dart';
import 'package:my_flutter_task2/screen/calculator_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
  super.initState();
    Future.delayed(const Duration(seconds: 5), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BlocProvider( 
        create: (context) => CalculatorBloc(),
        child: const CalculatorScreen(), 
      ),),
    );

  });
}
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.SplashScreenbg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            

          ],
        ),
      ),
    );
  }
}
