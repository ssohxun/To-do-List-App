import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/notification.dart';

import 'logineduser.dart';

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _ProgressIndicatorExampleState();
}

class MyEventList extends StatelessWidget{
  List<String> tasks = ['개인과제','프로젝트','플러터','개인과제','프로젝트','플러터'];
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return ListTile(
            leading : Checkbox(
              value: false,
              onChanged: (bool? value) {
                value = value!;
              },
            ),
            title: Text("${tasks[idx]}"),
            trailing: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.star_border),

            ),

          );
        }
    );
  }

}

class MyimportantList extends StatelessWidget{
  List<String> tasks = ['직','무','유','기'];
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return ListTile(
              leading : Checkbox(
                value: false,
                onChanged: (bool? value) {
                  value = value!;
                },
              ),
              title: Text("${tasks[idx]}"),
              trailing: Text("d-7")

          );
        }
    );
  }

}

class _ProgressIndicatorExampleState extends State<HomePage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  List<bool> isChecked = [];
  List<bool> Checked = [];




  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
        ),

        title: Text(LoginedUser.loginedUser.name),

        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              semanticLabel: 'notifications',
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
              print('Notification Button');
            },
          ),
        ],
      ),


      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    '나의 업무진척도',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: '나의 업무진척도',
                  ),
                  const SizedBox(height: 10,),
                  Row (
                    children: <Widget>[
                      Expanded (
                        child: Text(
                          '프로그래스바 멈추기(임시)',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Switch(
                          value: determinate,
                          onChanged: (bool value) {
                            setState(() {
                              determinate = value;
                              if(determinate) {
                                controller.stop();
                              }
                              else {
                                controller
                                  ..forward(from: controller.value)
                                  ..repeat();
                              }
                            });
                          })
                    ],
                  ),

                ],
              ),

            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                    )
                ),

                child: Column(
                    children:[
                      Text("Today",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),

                        height: 200,
                        child: MyEventList(),
                      )
                    ]
                )
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                    )
                ),

                child: Column(
                    children:[
                      Text("중요일정",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),

                        height: 200,
                        child: MyimportantList(),
                      )
                    ]
                )
            )
          ],
        ),
      ),

    );
  }
}