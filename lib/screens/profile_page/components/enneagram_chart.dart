import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';

class EnneagramChart extends StatefulWidget {
  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  final EnneagramTest enneagramTest;

  const EnneagramChart({Key? key, required this.enneagramTest}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EnneagramChartState();
}

class EnneagramChartState extends State<EnneagramChart> {
  final Color barBackgroundColor =  WaiColors.lightBlueGrey;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AspectRatio(
        aspectRatio: 5/2,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: WaiColors.deepLightBlueGrey,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical:4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(child: Text('유형별 점수', style: WaiTextStyle().bodyText())),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0,),
                        child: BarChart(
                          mainBarData(),
                          swapAnimationDuration: animDuration,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 22,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow.shade200, width: 1)   // ??
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 65,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(9, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, widget.enneagramTest.type1Score!.toDouble(), isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, widget.enneagramTest.type2Score!.toDouble(), isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, widget.enneagramTest.type3Score!.toDouble(), isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, widget.enneagramTest.type4Score!.toDouble(), isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, widget.enneagramTest.type5Score!.toDouble(), isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, widget.enneagramTest.type6Score!.toDouble(), isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, widget.enneagramTest.type7Score!.toDouble(), isTouched: i == touchedIndex);
      case 7:
        return makeGroupData(7, widget.enneagramTest.type8Score!.toDouble(), isTouched: i == touchedIndex);
      case 8:
        return makeGroupData(8, widget.enneagramTest.type9Score!.toDouble(), isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: WaiColors.lightBlueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String enneagramType;
              switch (group.x.toInt()) {
                case 0:
                  enneagramType = '1유형';
                  break;
                case 1:
                  enneagramType = '2유형';
                  break;
                case 2:
                  enneagramType = '3유형';
                  break;
                case 3:
                  enneagramType = '4유형';
                  break;
                case 4:
                  enneagramType = '5유형';
                  break;
                case 5:
                  enneagramType = '6유형';
                  break;
                case 6:
                  enneagramType = '7유형';
                  break;
                case 7:
                  enneagramType = '8유형';
                  break;
                case 8:
                  enneagramType = '9유형';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                enneagramType + '\n',
                WaiTextStyle(fontSize: 18, color: Colors.white).basic(),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style:  WaiTextStyle(fontSize: 14, color: WaiColors.yellow).basic(),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 12),
          margin: 4,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '1유형';
              case 1:
                return '2유형';
              case 2:
                return '3유형';
              case 3:
                return '4유형';
              case 4:
                return '5유형';
              case 5:
                return '6유형';
              case 6:
                return '7유형';
              case 7:
                return '8유형';
              case 8:
                return '9유형';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
  }
}