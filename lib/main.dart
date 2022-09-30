import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/binding/init_bindings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_clone_instagram/src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // useMaterial3: true,
        primarySwatch: Colors.lightBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      home: const App(),
    );
  }
}
