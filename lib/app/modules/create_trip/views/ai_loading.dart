import 'package:flutter/material.dart';
import 'package:jotrip/app/modules/create_trip/views/plans_view.dart';

class AiLoading extends StatefulWidget {
  const AiLoading({super.key});

  @override
  State<AiLoading> createState() => _AiLoadingState();
}

class _AiLoadingState extends State<AiLoading> {
  @override
  void initState() {
    super.initState();

    // Delayed navigation after 3 seconds to AIPlanGeneratedResultScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AIPlanGeneratedResultScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF6F6F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/ailoading.png'),
            const SizedBox(height: 20),
            const Text(
              "Generating your trip details,\nplease wait",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
