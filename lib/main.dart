import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain/cubit/app_cubit_logics.dart';
import 'package:mountain/cubit/app_cubits.dart';
import 'package:mountain/pages/detail_page.dart';
import 'package:mountain/pages/navpages/main_page.dart';
import 'package:mountain/pages/welcome_page.dart';
import 'package:mountain/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}


