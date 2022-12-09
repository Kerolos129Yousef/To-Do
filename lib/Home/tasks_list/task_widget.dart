import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/Dialoge_utilities.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/database/task.dart';

class TaskWidget extends StatelessWidget {
  Task task ;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Slidable(
          startActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                    MyDatabase.deleteTask(task)
                        .then((value) {
                          showMessage(context, "task deleted successfully",
                              posActionName: "ok");
                    })
                        .onError((error, stackTrace){
                      showMessage(context, "something wen't wrong ,please try again later ",posActionName: "ok");
                    })
                        .timeout(onTimeout: (){
                          showMessage(context, "Data deleted locally",posActionName: "ok");
                    }, Duration(seconds: 5));

                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,bottomLeft:Radius.circular(20) ),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      width: 5,
                      height: 75,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title??"",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 17,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("${task.dateTime?.hour}:${task.dateTime?.minute} ${task.dateTime?.timeZoneName}",
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: (Icon(
                    Icons.check,
                    color: Colors.white,
                  )),
                )
              ],
            ),
          )),
    );
  }
}
