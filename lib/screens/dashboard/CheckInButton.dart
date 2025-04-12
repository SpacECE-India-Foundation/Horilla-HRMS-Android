import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CheckInService.dart';

class CheckInButton extends StatelessWidget {
  const CheckInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final checkInService = Provider.of<CheckInService>(context);
    final showText = checkInService.isCheckedIn
        ? 'Check In'
        : checkInService.isJustCheckedOut
        ? 'Check Out'
        : 'Check In';

    return GestureDetector(
      onTap: () => checkInService.toggleCheckIn(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: checkInService.isCheckedIn
              ? Colors.green.shade100
              : Colors.orange,
          border: Border.all(
            color: checkInService.isCheckedIn ? Colors.green : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.login,
              color: checkInService.isCheckedIn ? Colors.green : Colors.white,
              size: 18,
            ),
            SizedBox(width: 6),
            Text(
              showText,
              style: TextStyle(
                color: checkInService.isCheckedIn ? Colors.green : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            if (checkInService.isCheckedIn)
            // Rebuild only the timer text
              Consumer<CheckInService>(
                builder: (context, service, _) {
                  return Text(
                    service.formatDuration(service.checkInDuration),
                    style: TextStyle(color: Colors.green),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
