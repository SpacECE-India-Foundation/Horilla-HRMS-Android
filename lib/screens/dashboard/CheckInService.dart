import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckInService with ChangeNotifier {
  bool _isCheckedIn = false;
  bool _isJustCheckedOut = false;
  Duration _checkInDuration = Duration.zero;
  Timer? _timer;
  DateTime? _checkInTime;

  bool get isCheckedIn => _isCheckedIn;
  bool get isJustCheckedOut => _isJustCheckedOut;
  Duration get checkInDuration => _checkInDuration;

  CheckInService() {
    _loadFromPrefs();
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isCheckedIn = prefs.getBool('isCheckedIn') ?? false;
    final checkInTimeString = prefs.getString('checkInTime');
    if (_isCheckedIn && checkInTimeString != null) {
      _checkInTime = DateTime.tryParse(checkInTimeString);
      _startTimer();
    }
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isCheckedIn', _isCheckedIn);
    if (_isCheckedIn && _checkInTime != null) {
      prefs.setString('checkInTime', _checkInTime!.toIso8601String());
    } else {
      prefs.remove('checkInTime');
    }
  }

  void toggleCheckIn(BuildContext context) async {
    if (_isCheckedIn) {
      final shouldCheckOut = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Confirm Check Out"),
          content: Text("Are you sure you want to check out?"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text("No")),
            ElevatedButton(onPressed: () => Navigator.pop(ctx, true), child: Text("Yes")),
          ],
        ),
      );

      if (shouldCheckOut == true) {
        final workedTime = DateTime.now().difference(_checkInTime!);
        _timer?.cancel();

        _isCheckedIn = false;
        _isJustCheckedOut = true;
        _checkInDuration = Duration.zero;
        _checkInTime = null;
        await _saveToPrefs();
        notifyListeners();

        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Checked Out"),
            content: Text("You worked for ${formatDuration(workedTime)}"),
            actions: [
              TextButton(onPressed: () => Navigator.pop(ctx), child: Text("OK")),
            ],
          ),
        );

        _isJustCheckedOut = false;
        notifyListeners();
      }
    } else {
      _isCheckedIn = true;
      _isJustCheckedOut = false;
      _checkInTime = DateTime.now();
      _checkInDuration = Duration.zero;
      await _saveToPrefs();
      _startTimer();
      notifyListeners();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_checkInTime != null) {
        _checkInDuration = DateTime.now().difference(_checkInTime!);
        notifyListeners();
      }
    });
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  }

  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
