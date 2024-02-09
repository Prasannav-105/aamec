import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'materials_page.dart';

class AttenddancePage extends StatefulWidget {
  const AttenddancePage({super.key});

  @override
  State<AttenddancePage> createState() => _AttenddancePageState();
}

class _AttenddancePageState extends State<AttenddancePage> {
  List<DateTime> _absentDays = [
    DateTime(2024, 2, 10),
    DateTime(2024, 2, 20),
    DateTime(2024, 2, 25),
  ];

  List<Absent> _getAbsentdata() {
    List<Absent> absentData = [];
    DateTime date = DateTime(2024, 2, 10);
    absentData.add(
      Absent(
          date,
          Colors.green,
          date.add(Duration(hours: 12 - 3)),
          date.add(
            Duration(hours: 12),
          ),
          title: 'Present'),
    );
    absentData.add(
      Absent(
        date,
        Colors.red,
        date.add(Duration(hours: 12)),
        date.add(
          Duration(hours: 12 + 4, minutes: 30),
        ),
      ),
    );
    return absentData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              child: SfCalendar(
                blackoutDatesTextStyle: TextStyle(color: Colors.red),
                dataSource: Mydata(_getAbsentdata()),
                view: CalendarView.month,
                onTap: (calendarTapDetails) {
                  print(calendarTapDetails.date!.day);
                },
                monthViewSettings: MonthViewSettings(showAgenda: true),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Mydata extends CalendarDataSource {
  Mydata(List<Absent> source) {
    appointments = source;
  }
  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startHour;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endHour;
  }

  String getSubject(int index) {
    return appointments![index].title;
  }
}

class Absent {
  Absent(
    this.day,
    this.color,
    this.startHour,
    this.endHour, {
    this.title = "Absent",
    this.titleTwo = "Absent",
  });
  final DateTime day;
  final DateTime startHour;
  final DateTime endHour;
  String title;
  String titleTwo;

  final Color color;
}
