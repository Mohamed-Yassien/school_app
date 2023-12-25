import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants.dart';

class ReusableAppBarForProfile extends StatelessWidget
    implements PreferredSizeWidget {
  const ReusableAppBarForProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: defaultColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
        statusBarIconBrightness: Brightness.light,
      ),
      title: Text(
        AppLocalizations.of(context)!.profile,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
            size: 25,
          ),
          tooltip: 'log out',
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
