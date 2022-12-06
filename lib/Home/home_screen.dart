import 'package:flutter/material.dart';
import 'package:todo/Home/add_task_bottom_sheet.dart';
import 'package:todo/Home/settings/setting_tap.dart';
import 'package:todo/Home/tasks_list/tasks_list_tap.dart';

class HomeScreen extends StatefulWidget {
static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),body: TabsList[selectedIndex],
      bottomNavigationBar:BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex:selectedIndex ,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "")
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white,width: 4),
        ),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> TabsList = [TasksListTap(),SettingsTap()];
  void showAddTaskBottomSheet(){
    showModalBottomSheet(context: context, builder: (context) {
      return AddTaskBottomSheet();
    },isScrollControlled:true);
  }
}
