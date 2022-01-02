import 'package:astrotak/app/ui/values/color.dart';
import 'package:astrotak/app/ui/views/ask_questions.dart';
import 'package:astrotak/app/ui/views/home.dart';
import 'package:astrotak/app/ui/views/report.dart';
import 'package:astrotak/app/ui/views/talk.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  Navigation({Key? key}) : super(key: key);

  final tabs = [
    HomeScreen(),
    TalkScreen(),
    AskQuestionsScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: 0,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              scale: 1.7,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/talk.png',
                scale: 1.7, color: AppColors.primaryColor),
            label: 'Talk to Astrologer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ask.png',
              scale: 1.7,
              color: Colors.grey,
            ),
            label: 'Ask Question',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/reports.png',
              scale: 1.7,
              color: Colors.grey,
            ),
            label: 'Reports',
          ),
        ],
      ),
      body: TalkScreen(),
    );
  }
}
