import 'package:flutter/material.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todo.dart';
import 'package:calendar_view/calendar_view.dart';

class UpcommingPage extends StatefulWidget {
  const UpcommingPage({Key? key}) : super(key: key);

  @override
  _UpcommingPage createState() => _UpcommingPage();

}

class _UpcommingPage extends State<UpcommingPage> {
  List<Widget> _getUpcommingList() {
    List<Todo> upcommingList = <Todo>[];
    List<Widget> upcommingView = <Widget>[];
    // for(int i = 0; i < LoginedUser.loginedUser!.defaultProject.contnet.length; i++) {
    //   if(LoginedUser.loginedUser!.defaultProject.contnet[i] is Todo) {
    //     upcommingList.add(LoginedUser.loginedUser!.defaultProject.contnet[i]);
    //   }
    // }
    // for(int i = 0; i <LoginedUser.loginedUser!.projectList.length; i++) {
    //   for(int j = 0; j < LoginedUser.loginedUser!.projectList[i].contnet.length; i++) {
    //     if(LoginedUser.loginedUser!.projectList[i].contnet[j] is Todo) {
    //       upcommingList.add(LoginedUser.loginedUser!.projectList[i].contnet[j]);
    //     }
    //   }
    // }
    //upcommingList.sort((a,b) => a.finalDeadLine.compareTo(b.finalDeadLine));
    return upcommingView;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('예정'),
      ),

      body: DayView(

        controller: EventController(),
        eventTileBuilder: (date, events, boundry, start, end) {
          // Return your widget to display as event tile.
          return Container();
        },
        showVerticalLine: true, // To display live time line in day view.
        showLiveTimeLineInAllDays: true, // To display live time line in all pages in day view.
        minDay: DateTime(1990),
        maxDay: DateTime(2050),
        initialDay: DateTime.now(),
        heightPerMinute: 1, // height occupied by 1 minute time span.
        eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
      ),


      );

  }
}