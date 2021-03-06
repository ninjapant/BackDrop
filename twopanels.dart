import 'package:flutter/material.dart';

class twopanels extends StatefulWidget {

  final AnimationController controller;

  twopanels({this.controller});

  @override
  _twopanelsState createState() => _twopanelsState();
}

class _twopanelsState extends State<twopanels> {

static const header_height=32.0;

Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints){
  final height = constraints.biggest.height;
  final backPanelHeight = height-header_height;
  final frontPanelHeight = -header_height;

  return new RelativeRectTween(
    begin: new RelativeRect.fromLTRB(0.0, backPanelHeight, 0.0, frontPanelHeight),
    end: new RelativeRect.fromLTRB(0.0,0.0,0.0,0.0))
      .animate(new CurvedAnimation(parent: widget.controller, curve: Curves.linear));

}

  Widget bothPanels(BuildContext context,BoxConstraints constraints){

    final ThemeData theme =Theme.of(context);

    return new Container(
      child: new Stack(
        children :<Widget>[
            new Container(
              color: theme.primaryColorDark,
              child: new Center(
                child: new Text(
                  "BackPanel",
                  style: TextStyle(fontSize: 24.0,color: Colors.white),
                ),
              ),
            ),

          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(16.0),
                  topRight: new Radius.circular(16.0)),
                  child:new Column(
                   children: <Widget>[
                     new Container(height: header_height,
                     child: new Center(
                       child: new Text("Shop Here",style: Theme.of(context).textTheme.button,)
                     ),
                     ),
                     
                     new Expanded(
                         child: new Center(
                           child: new Text("Front Panel",style: TextStyle(fontSize: 24.0,color: Colors.black),),
                         )
                     )
                  ],
                ),
            ),
          )
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: bothPanels);

  }
}
