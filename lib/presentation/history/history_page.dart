import 'package:flutter/material.dart';
import 'package:flutter_timeline/flutter_timeline.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TimelineEventDisplay> events = List.generate(
      15,
      (index) => TimelineEventDisplay(
        child: TimelineEventCard(
          title: Text("just now"),
          content: Text(
              "someone commented on your timeline ${DateTime.now().add(Duration(days: index))}"),
        ),
        indicator: Container(
          height: 10.0,
          width: 10.0,
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        ),
      ),
    );

    return Scaffold(
      body: TimelineTheme(
        data: TimelineThemeData(
          lineColor: Colors.blueAccent,
          style: PaintingStyle.fill,
          strokeCap: StrokeCap.round,
        ),
        child: Timeline(
          indicatorSize: 18,
          events: events,
        ),
      ),
    );
  }
}
