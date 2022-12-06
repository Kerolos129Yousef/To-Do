import 'package:flutter/material.dart';
import 'package:todo/Dialoge_utilities.dart';
import 'package:todo/database/my_database.dart';
import 'package:todo/database/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formkey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.7,
      decoration: BoxDecoration(
          //  color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "Add New Task",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            )),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter task title";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Title",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 4)),
                hintText: "Enter your task",
              ),
            ),
            TextFormField(
              controller: descriptionController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "Please enter task description";
                }
              },
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Description",
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.yellow, width: 4)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Select Date",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showDateDialog();
              },
              child: Text(
                "${date.day}-${date.month}-${date.year}",
                style: TextStyle(fontSize: 18, color: Colors.black87,),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: () {
              AddTask();
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }

  void AddTask() {
   if(formkey.currentState?.validate()==true){
      String title = titleController.text;
      String description = descriptionController.text;
      Task task = Task(
          title: title,
          description: description,
          dateTime: date,
          isDone: false
      );
      showLoading(context, "Loading...",isCancelable: false);
      MyDatabase.insertTask(task).then((value) {
        hideLoading(context);
        showMessage(context,"Task added successfully ",posActionName: "ok",posAction: (){
          Navigator.pop(context);
        });
      }).onError((error, stackTrace) {
        hideLoading(context);
        showMessage(context,"Something went wrong ,try again later");
      }).timeout(Duration(seconds: 5),onTimeout: (){
        hideLoading(context);
        showMessage(context, "Message saved locally");
      });
   }

  }
  void showDateDialog()async {
    DateTime? newDate =  await showDatePicker(context: context, initialDate:date, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)));
    if(newDate!=null){
      date=newDate!;
      setState(() {
      });
    }
  }
}


