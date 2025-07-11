import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Timer? _timer;

  void startTimer(int initialMinutes) {
    isPlaying = true;
    duration = Duration.zero;

    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (duration.inMinutes < initialMinutes) {
        duration += Duration(seconds: 1);
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    isPlaying = false;
    notifyListeners();
  }
}
