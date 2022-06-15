import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:memento_mori/services/user_data_service.dart';
import 'package:memento_mori/utils/constants.dart';

import '../generated/l10n.dart';

class EntryData extends StatefulWidget {
  const EntryData({Key? key}) : super(key: key);

  @override
  State<EntryData> createState() => _EntryDataState();
}

class _EntryDataState extends State<EntryData> {
  TextEditingController birthDateInput = TextEditingController();
  double expectedYears = 80;
  String birthDate = '';

  @override
  void initState() {
    birthDateInput.text = "";
    UserDataService().readUserDataFromSharedPrefs().then((value) {
      if (value != null) {
        var expectedYears = value['live_expectancy'];
        var birthDate = DateTime.parse(value['birth_date']);
        setState(() {
          this.expectedYears = expectedYears.toDouble();
          birthDateInput.text =
              "${S.of(context).textEdit_pref_you_was_born} ${DateFormat('dd/MM/yyyy').format(birthDate)}";
          this.birthDate = birthDate.toString();
        });
      }
    });
    super.initState();
  }

  AppBar _getAppbar() {
    return AppBar(
      title: Text(
        appName,
        style: GoogleFonts.cinzel(),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _showBirthDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      locale: const Locale('en', 'GB'),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.input,
      helpText: S.of(context).helpText_birthDate,
      fieldLabelText: S.of(context).fieldLabelText_birthDate,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 365 * 123),
      ),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        birthDateInput.text =
            "${S.of(context).textEdit_pref_you_was_born} ${DateFormat('dd/MM/yyyy').format(pickedDate)}";
        birthDate = DateFormat('yyy-MM-dd').format(pickedDate);
      });
    }
  }

  _displayDateTextEdit() {
    return IntrinsicWidth(
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: Colors.black,
          fontFamily: GoogleFonts.cinzel().fontFamily,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: S.of(context).hintText_birthDate,
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.cinzel().fontFamily,
            fontSize: 18,
          ),
          labelStyle: TextStyle(
            fontFamily: GoogleFonts.cinzel().fontFamily,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        controller: birthDateInput,
        readOnly: true,
        textAlign: TextAlign.center,
        onTap: () async => _showBirthDatePicker(),
      ),
    );
  }

  _displayNumberPicker() {
    return Slider(
      activeColor: Colors.black87,
      inactiveColor: Colors.grey,
      thumbColor: Colors.black,
      value: expectedYears,
      max: 123,
      divisions: 123,
      label: expectedYears.round().toString(),
      onChanged: (double value) {
        setState(() {
          expectedYears = value;
        });
      },
    );
  }

  _displayForm() {
    return Center(
      child: SizedBox(
        width: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .width *
            0.6,
        height: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .height *
            0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: _displayDateTextEdit(),
            ),
            Column(
              children: [
                Text(
                  "${S.of(context).textEdit_pref_life_expectancy} ${expectedYears.toInt()} ${S.of(context).text_years}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: GoogleFonts.cinzel().fontFamily,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                _displayNumberPicker()
              ],
            ),
            ElevatedButton(
              onPressed: birthDateInput.text.isEmpty
                  ? null
                  : () => {
                        UserDataService()
                            .saveUserInfo(expectedYears.toInt(), birthDate),
                        Navigator.pushReplacementNamed(context, "/home"),
                      },
              child: Text(
                S.of(context).button_save,
                style: TextStyle(
                  fontFamily: GoogleFonts.cinzel().fontFamily,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppbar(),
      body: _displayForm(),
    );
  }
}
