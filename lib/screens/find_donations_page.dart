import 'package:flutter/material.dart';
import '../config/constants.dart';

class FindDonationsPage extends StatelessWidget {
  const FindDonationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Donations'),
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const SearchBar(),
            const SizedBox(height: 20),
            // Add donation listings here
          ],
        ),
      ),
    );
  }
}
