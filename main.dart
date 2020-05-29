import 'package:flutter/material.dart';
import 'package:flutterapp1/twopanels.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.blue),//here you can change theme or the color
      home: new BackdropPage(),
));

class BackdropPage extends StatefulWidget{
  @override
  _BackdropPageState createState() => new _BackdropPageState();
  }

class _BackdropPageState extends State<BackdropPage> with SingleTickerProviderStateMixin {

   AnimationController controller;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=new AnimationController(vsync: this,duration: new Duration(milliseconds: 100),value: 10.0);
  }

  void dispose(){
     super.dispose();
     controller.dispose();
  }

  bool get isPanelVisible{
     final AnimationStatus status =controller.status;
     return status == AnimationStatus.completed ||
         status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BackDrop"),
        elevation: 0.0,
        leading: new IconButton(
          onPressed: (){
            controller.fling(velocity: isPanelVisible?-1.0 : 1.0);
          },
            icon: new AnimatedIcon(
              icon:  AnimatedIcons.close_menu,//arrow_menu can also be used
              progress: controller.view,
            ),
        ),
      ),
      body: new twopanels(controller: controller,),
    );
    throw UnimplementedError();
  }

}

