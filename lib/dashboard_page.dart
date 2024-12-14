import 'package:flutter/material.dart';
import 'config/constants.dart';
import 'screens/donate_food_page.dart';
import 'screens/find_donations_page.dart';
import 'screens/my_donations_page.dart';
import 'screens/community_page.dart';
import 'screens/quick_donate_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Donation Dashboard'),
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
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    DashboardCard(
                      icon: Icons.add_box,
                      title: 'Donate Food',
                      color: const Color(AppColors.primaryGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DonateFoodPage(),
                          ),
                        );
                      },
                    ),
                    DashboardCard(
                      icon: Icons.search,
                      title: 'Find Donations',
                      color: const Color(AppColors.secondaryGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FindDonationsPage(),
                          ),
                        );
                      },
                    ),
                    DashboardCard(
                      icon: Icons.history,
                      title: 'My Donations',
                      color: const Color(AppColors.primaryGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyDonationsPage(),
                          ),
                        );
                      },
                    ),
                    DashboardCard(
                      icon: Icons.people,
                      title: 'Community',
                      color: const Color(AppColors.secondaryGreen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CommunityPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuickDonatePage(),
            ),
          );
        },
        backgroundColor: const Color(AppColors.primaryGreen),
        child: const Icon(Icons.favorite),
        tooltip: 'Quick Donate',
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withOpacity(0.8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
