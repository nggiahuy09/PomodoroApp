import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pomodoro/functionality/notifications.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 1500; // equal 25 minutes
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goals = 0;
  String currentState = "FOCUS";

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    /*
    use to notify any change for provider
    if you not use this statement, when any change, you must hot reload your app
    */
    notifyListeners();
  }

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void reset() {
    timer.cancel();

    currentState = "FOCUS";
    currentDuration = selectedTime = 1500; // equal 25 minutes
    timerPlaying = false;
    rounds = 0;
    goals = 0;

    Fluttertoast.showToast(
      msg: "Time to have BREAK",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      // backgroundColor: const Color.fromARGB(255, 46, 46, 255),
      // textColor: Colors.white,
      fontSize: 16.0,
    );
    notifyListeners();
  }

  Future<void> handleNextRound() async {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 300; // equal 5 minutes
      selectedTime = 300;
      rounds++;
      goals++;

      // Player.stop();
      Player.play('finish_focus.mp3');

      // show Toast
      Fluttertoast.showToast(
        msg: "IT'S TIME TO BREAK",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: const Color.fromARGB(255, 46, 46, 255),
        // textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;

      Player.stop();
      Player.play('finish_break_2.mp3');

      // show Toast
      Fluttertoast.showToast(
        msg: "IT'S TIME TO FOCUS",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: const Color.fromARGB(255, 255, 46, 46),
        // textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONG BREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goals++;

      Player.stop();
      Player.play('finish_focus.mp3');

      // show Toast
      Fluttertoast.showToast(
        msg: "IT'S TIME TO LONG BREAK",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        // backgroundColor: const Color.fromARGB(255, 0, 163, 0),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (currentState == "LONG BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;

      Player.stop();
      Player.play('finish_break_2.mp3');

      Fluttertoast.showToast(
        msg: "IT'S TIME TO FOCUS",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        // backgroundColor: const Color.fromARGB(255, 255, 46, 46),
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    notifyListeners();
  }
}
