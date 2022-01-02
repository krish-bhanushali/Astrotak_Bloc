import 'dart:developer';

import 'package:astrotak/app/business/bloc/bottom_nav_bloc.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:astrotak/app/ui/widgets/astro_app_bar.dart';
import 'package:astrotak/app/ui/widgets/bottom_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fragments/fragments.dart';

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
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        appBar: AstroAppBar(),
        bottomNavigationBar: BottomBar(),
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            if (state is CurrentIndexChanged) {
              return tabs[state.currentIndex];
            } else {
              return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
