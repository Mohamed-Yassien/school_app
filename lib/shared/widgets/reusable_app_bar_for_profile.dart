import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants.dart';
import 'language_change_drop.dart';

class ReusableAppBarForProfile extends StatelessWidget
    with PreferredSizeWidget {
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
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.logout_outlined,
          color: Colors.white,
          size: 25,
        ),
        tooltip: 'log out',
      ),
      centerTitle: true,
      actions: [
        LanguageChangeDrop(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
