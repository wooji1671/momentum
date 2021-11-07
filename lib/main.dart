import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        imagePath: "images/Background.jpg",
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Align(
              alignment: Alignment.topLeft,
              child: Links(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Weather(),
              ),

              Align(
                alignment: Alignment(0.0, 0.5),
                child: Focus(),
              ),

              Align(
                alignment: Alignment.center,
                child: Text("13:00", style: TextStyle(fontSize: 50, color: Colors.white,),),
              ),

              Align(
                alignment: Alignment.bottomLeft,
                child: Setting(),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Quotes(),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Todo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Links"),
        Container(width: 10, height: 0,),
        Icon(Icons.search, color: Colors.white),
      ],
    );
  }
}

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud, color: Colors.white,),
            Container(width: 10, height: 0,),
            Text("21º"),
          ],
        ),
        Container(width: 0, height: 10,),
        Text("Gwanak-gu"),
      ],
    );
  }
}

class Focus extends StatelessWidget {
  const Focus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Focus", style: TextStyle(color: Colors.white,),);
  }
}

class Setting extends StatefulWidget {

  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _settingVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: _settingVisible,
          child: Container(
            width: 500,
            height: 300,
            color: Colors.green,
          ),
        ),

        IconButton(
          icon: Icon(Icons.settings, color: Colors.white,),
          onPressed: (){
            //버튼이 눌렸을때의 함수내용
            setState(() {
              _settingVisible = !_settingVisible;
            });
          },
        ),
      ],
    );
  }
}

class Quotes extends StatelessWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Quotes", style: TextStyle(color: Colors.white,),);
  }
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool _todoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedOpacity(
          opacity: _todoVisible?1.0:0.0,
          duration: Duration(milliseconds: 200),
          child: Visibility(
            visible: _todoVisible,
            child: TodoBox(),
            ),
        ),
        FlatButton(
          minWidth: 0,
          onPressed: (){
            setState(() {
              _todoVisible = !_todoVisible;
            });
          },
            child: Text("Todo", style: TextStyle(color: Colors.white),)),
      ],
    );
  }
}
class TodoBox extends StatelessWidget {
  const TodoBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 350,
      padding: EdgeInsets.fromLTRB(20, 5, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white, //BoxDecoration 쓰려면 컬러를 이때 지정
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButton(items: items)
            ),
          ),
        ],
      ),
    );
  }
}


class BackGround extends StatelessWidget {

  final Widget? child;
  final String imagePath;

  BackGround({this.child, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

