import 'package:astrotak/app/business/bloc/bottom_nav_bloc.dart';
import 'package:astrotak/app/ui/values/assets.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        if (state is CurrentIndexChanged) {
          return BottomNavigationBar(
            selectedFontSize: 12,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey[200],
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: state.currentIndex,
            onTap: (index) {
              context.read<BottomNavBloc>().add(PageTapped(index: index));
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AppAssets.ASTRO_HOME_ASSET,
                  scale: 1.7,
                  color: state.currentIndex == 0
                      ? AppColors.primaryColor
                      : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssets.ASTRO_TALK_ASSET,
                    scale: 1.7,
                    color: state.currentIndex == 1
                        ? AppColors.primaryColor
                        : Colors.grey),
                label: 'Talk to Astrologer',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssets.ASTRO_ASK_ASSET,
                    scale: 1.7,
                    color: state.currentIndex == 2
                        ? AppColors.primaryColor
                        : Colors.grey),
                label: 'Ask Question',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AppAssets.ASTRO_REPORTS_ASSET,
                    scale: 1.7,
                    color: state.currentIndex == 3
                        ? AppColors.primaryColor
                        : Colors.grey),
                label: 'Reports',
              ),
            ],
          );
        }
        return BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[200],
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: 0,
          onTap: (index) {
            context.read<BottomNavBloc>().add(PageTapped(index: index));
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home.png',
                scale: 1.7,
                color: AppColors.primaryColor,
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
        );
      },
    );
  }
}
