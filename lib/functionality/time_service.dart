import 'package:flutter/material.dart';
import 'dart:async';

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

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentDuration = 300; // equal 5 minutes
      selectedTime = 300;
      rounds++;
      goals++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONG BREAK";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds++;
      goals++;
    } else if (currentState == "LONG BREAK") {
      currentState = "FOCUS";
      currentDuration = 1500;
      selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
