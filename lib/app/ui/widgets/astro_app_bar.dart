import 'dart:developer';

import 'package:astrotak/app/ui/values/assets.dart';
import 'package:flutter/material.dart';

class AstroAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AstroAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          log('Hamburger Menu Clicked');
        },
        child: Image.asset(
          AppAssets.ASTRO_HAMBURGER_ASSET,
        ),
      ),
      title: Image.asset(
        AppAssets.ASTRO_APP_LOGO,
        scale: 4.7,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print('Profile');
          },
          child: Image.asset(
            AppAssets.ASTRO_PROFILE_ASSET,
            scale: 3.6,
          ),
        )
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(55.0);
}
