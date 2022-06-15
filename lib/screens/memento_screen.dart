import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memento_mori/utils/constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../generated/l10n.dart';
import '../services/user_data_service.dart';

class MementoScreen extends StatefulWidget {
  const MementoScreen({Key? key}) : super(key: key);

  @override
  State<MementoScreen> createState() => _MementoScreenState();
}

class _MementoScreenState extends State<MementoScreen> {
  final DateTime todaysDate = DateTime.now();
  late final int _blockGap = 2;
  late final double _blockStrokeWidth = 1;
  late final double _padding = 16;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  int calculatePassedWeeksSinceBirthday(DateTime birthDate) {
    final Duration duration = todaysDate.difference(birthDate);
    final int passedYears = duration.inDays ~/ 365;
    final bDay = birthDate.day;
    final bMonth = birthDate.month;
    final weeksSinceYeasBDay = (todaysDate
            .difference(DateTime(todaysDate.year, bMonth, bDay))
            .inDays ~/
        7);
    var passedWeeks = (passedYears * 52) + weeksSinceYeasBDay;
    return passedWeeks;
  }

  List<int> getWeeksBlocks(expectedYears) {
    final weeks = List.generate((expectedYears + 1) * 52, (index) => index);
    return weeks;
  }

  double calcBlocSizeByHeight(expectedYears) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    var blockHeight =
        (screenHeight - appBarHeight - 2 * _padding) / expectedYears;
    return blockHeight;
  }

  double calcBlocSizeByWidth() {
    final double screenWidth = MediaQuery.of(context).size.width;
    var blockWidth = (screenWidth - 2 * _padding) / 52;
    return blockWidth;
  }

  double getSmallerDimension(expectedYears) {
    var blocSizeByHeight = calcBlocSizeByHeight(expectedYears);
    var blocSizeByWidth = calcBlocSizeByWidth();
    return blocSizeByHeight < blocSizeByWidth
        ? blocSizeByHeight
        : blocSizeByWidth;
  }

  AppBar _getAppbar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
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
      actions: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(S.of(context).button_edit),
                value: "edit",
              ),
              PopupMenuItem(
                child: Text(S.of(context).button_about),
                value: "about",
              ),
            ];
          },
          onSelected: (value) {
            switch (value) {
              case "edit":
                Navigator.pushReplacementNamed(context, "/entry");
                break;
              case "about":
                _showAboutDialog();
                break;
            }
          },
        )
      ],
    );
  }

  Future<Map<String, String>> _getAppData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return {
      "app_name": packageInfo.appName,
      "version": packageInfo.version,
      "build_number": packageInfo.buildNumber,
    };
  }

  _showAboutDialog() {
    _getAppData().then((data) {
      showAboutDialog(
        context: context,
        applicationName: "Memento Mori",
        applicationVersion: data["version"],
        applicationIcon: const Icon(Icons.info),
        applicationLegalese: "© ${DateTime.now().year} Konrad Karimi",
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).about_description,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      );
    });
  }

  getCustomPaintedMemento(blockSize, weeksBlocks, passedWeeks) {
    return CustomPaint(
      size: Size(
          blockSize * 52,
          MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .size
                  .height -
              AppBar().preferredSize.height),
      painter: CustomMementoGridView(
        blocSize: blockSize,
        blocs: weeksBlocks,
        blockGap: _blockGap,
        blockStrokeWidth: _blockStrokeWidth,
        passedWeeks: passedWeeks,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            Map userData = snapshot.data as Map<String, dynamic>;
            var expectedYears = userData['live_expectancy'];
            var birthDate = DateTime.parse(userData['birth_date']);

            var weeksBlocks = getWeeksBlocks(expectedYears);
            var blockSize = getSmallerDimension(expectedYears);
            var passedWeeks = calculatePassedWeeksSinceBirthday(birthDate);

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: _getAppbar(),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _padding, vertical: _padding / 2),
                  child: Center(
                    child: passedWeeks > weeksBlocks.length
                        ? Text(S.of(context).text_probably_dead)
                        : getCustomPaintedMemento(
                            blockSize, weeksBlocks, passedWeeks),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: Text(S.of(context).text_no_user_data),
          );
        },
        future: UserDataService().readUserDataFromSharedPrefs());
  }
}

class CustomMementoGridView extends CustomPainter {
  final int columnsCount = 52;
  late final double blocSize;
  late final List<int> blocs;
  late final int blockGap;
  late final double blockStrokeWidth;
  late final int passedWeeks;

  CustomMementoGridView({
    required this.blocSize,
    required this.blocs,
    required this.blockGap,
    required this.blockStrokeWidth,
    required this.passedWeeks,
  });

  Paint getPainter(bool filled) {
    if (filled) {
      return Paint()
        ..color = Colors.black
        ..strokeWidth = blockStrokeWidth
        ..style = PaintingStyle.fill;
    } else {
      return Paint()
        ..color = Colors.black54
        ..strokeWidth = blockStrokeWidth * 0.5
        ..style = PaintingStyle.stroke;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    blocs.asMap().forEach((index, bloc) {
      canvas.drawRect(
          Rect.fromLTWH(
            getLeft(index),
            getTop(index),
            blocSize - blockGap,
            blocSize - blockGap,
          ),
          getPainter(bloc < passedWeeks));
    });
  }

  double getTop(int index) {
    return (index / columnsCount).floor().toDouble() * blocSize;
  }

  double getLeft(int index) {
    return (index % columnsCount).floor().toDouble() * blocSize;
  }

  @override
  bool shouldRepaint(CustomMementoGridView oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CustomMementoGridView oldDelegate) => true;
}
