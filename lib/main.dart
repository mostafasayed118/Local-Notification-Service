import 'package:flutter/material.dart';
import 'package:notification_app/screens/home_page.dart';
import 'package:notification_app/service/local_notification_service.dart';
import 'package:notification_app/service/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    LocalNotificationService.init(),
    WorkManagerService().init(),
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
