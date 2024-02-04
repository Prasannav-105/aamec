import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting('Holiday', startTime, endTime, const Color(0xFF0F8644), false),
    );
    meetings.add(
      Meeting('Assignment Submission', startTime, endTime, Colors.amber, false),
    );
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: SfCalendar(
              dataSource: MeetingDataSource(_getDataSource()),
              // timeSlotViewSettings: TimeSlotViewSettings(
              //     startHour: 9,
              //     endHour: 18,
              //     nonWorkingDays: [DateTime.sunday, DateTime.saturday]),
              // onTap: (calendarTapDetails) {
              //   print(calendarTapDetails.date);
              // },
              // showCurrentTimeIndicator: true,
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(showAgenda: true),
            ),
          ),
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource<Object> {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
