import 'package:flutter/material.dart';
import '../config/constants.dart';

class QuickDonatePage extends StatelessWidget {
  const QuickDonatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Donate'),
        backgroundColor: const Color(AppColors.primaryGreen),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(AppColors.primaryGreen).withOpacity(0.3),
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Add quick donation form here
            ],
          ),
        ),
      ),
    );
  }
}
