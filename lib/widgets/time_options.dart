import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pomodoro/functionality/time_service.dart';
import 'package:pomodoro/util/utils.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context); // use to provide service from TimerService

    return SingleChildScrollView(
      controller: ScrollController(
        initialScrollOffset: 250, // = 3x width's selectableTimes Container (210) + 4x margin (40)
      ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return InkWell(
            onTap: () {
              if(provider.timerPlaying != true) {
                provider.selectTime(double.parse(time));
              } else {
                Fluttertoast.showToast(
                    msg: "PLEASE PRESS THE PAUSE BUTTON FIRST"
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == provider.selectedTime ?
              BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: renderColor(provider.currentState),
                border: Border.all(
                  color: Colors.white54,
                  width: 1.5,
                ),
              ) :
              BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: renderBackgroundColor(provider.currentState),
                border: Border.all(
                  color: renderColor(provider.currentState),
                  width: 1.5,
                ),
              ),
              child: Center(
                  child: Text(
                    (int.parse(time) ~/ 60).toString(),
                    style: textStyle(25, int.parse(time) == provider.selectedTime ? renderBackgroundColor(provider.currentState) : renderColor(provider.currentState), FontWeight.bold),
                  )
              ),
            ),
          );
        }).toList()
      ),
    );
  }

}