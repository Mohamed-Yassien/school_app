import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../main.dart';
import '../../models/language_model.dart';
import '../../network/local/cache_helper.dart';

class LanguageChangeDrop extends StatelessWidget {
  final Color fillColor;
  final double margin;

  LanguageChangeDrop({
    this.fillColor = Colors.white,
    this.margin = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: fillColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<LanguageModel>(
            iconEnabledColor:
                fillColor == Colors.white ? Colors.teal : Colors.white,
            iconDisabledColor:
                fillColor == Colors.white ? Colors.teal : Colors.white,
            hint: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.lang,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: fillColor == Colors.white ? Colors.teal : Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            items: List.generate(
              LanguageModel.languages().length,
              (index) => DropdownMenuItem<LanguageModel>(
                value: LanguageModel.languages()[index],
                child: Text(
                  LanguageModel.languages()[index].name,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onChanged: (val) async {
              if (val != null) {
                CacheHelper.saveData(key: 'lang', value: val.languageCode).then(
                  (value) {
                    MyApp.setLocale(
                      context,
                      Locale(CacheHelper.getData(key: 'lang'), ''),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
