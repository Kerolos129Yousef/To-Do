import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home/tasks_list/task_widget.dart';
import 'package:todo/my_theme.dart';

class TasksListTap  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date){

            },
            leftMargin: 20,
            monthColor: Colors.blueGrey[700],
            dayColor: Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) =>true,
            locale: 'en_ISO',
          ),
          SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(itemBuilder: (_,index){
              return TaskWidget();
            },itemCount: 20,),
          )
        ],
      ),
    );
  }
}
