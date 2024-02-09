import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime _febevent = DateTime(2024, 2, 28, 9);
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting('Holiday', startTime, endTime, const Color(0xFF0F8644), false),
    );
    meetings.add(
      Meeting(
          'Assignment Submission',
          _febevent,
          _febevent.add(
            const Duration(
              hours: 4,
            ),
          ),
          Colors.amber,
          false),
    );
    meetings.add(
      Meeting(
          'Project Upload',
          _febevent.add(Duration(hours: 2)),
          _febevent.add(
            const Duration(
              hours: 3,
            ),
          ),
          Colors.red,
          false),
    );
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Events',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              child: SfCalendar(
                todayHighlightColor: Colors.black,
                dataSource: MeetingDataSource(_getDataSource()),
                // timeSlotViewSettings: TimeSlotViewSettings(
                //     startHour: 9,
                //     endHour: 18,
                //     nonWorkingDays: [DateTime.sunday, DateTime.saturday]),

                // showCurrentTimeIndicator: true,
                view: CalendarView.month,

                monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                  agendaItemHeight: 100,
                  showTrailingAndLeadingDates: false,
                ),
              ),
            ),
          ],
        ),
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
