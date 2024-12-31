import 'package:flutter/material.dart';
import 'package:methode_channel/platform_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(message),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () async {
                message = await PlatformService.getPlatformData("Welcome to OXDO") ?? "No message has shown";
                setState(() {});
              },
              child: const Text("Show message"),
            )
          ],
        ),
      ),
    );
  }
}
