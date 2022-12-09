import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/Home/tasks_list/error_tab.dart';
import 'package:todo/Home/tasks_list/task_widget.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/database/task.dart';
import 'package:todo/my_theme.dart';

class TasksListTap extends StatefulWidget {
  @override
  State<TasksListTap> createState() => _TasksListTapState();
}

class _TasksListTapState extends State<TasksListTap> {
DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            showYears: true,
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {
              });
            },
            leftMargin: 20,
            monthColor: Colors.blueGrey[700],
            dayColor: Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Task>>(
                stream: MyDatabase.listenForTasksRealTimeUpdates(selectedDate),
                builder: (context, snapshot) {
                  var tasks = snapshot.data?.docs.map((element) => element.data()).toList();
                  if(snapshot.hasError){
                      return Column(
                        children: [
                         const Text("Error, please try again later"),
                          TextButton(onPressed: (){
                            MyDatabase.listenForTasksRealTimeUpdates(selectedDate);
                            setState(() {
                            });
                          }, child:const Text("reload"))
                        ],
                      );
                  }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else{
                    return ListView.builder(
                      itemBuilder: (_, index) {
                        return TaskWidget(tasks![index]);
                      },
                      itemCount: tasks?.length,
                    );
                  }
                },
              ))
        ],
      ),
    );
  }
}
