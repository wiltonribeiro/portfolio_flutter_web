import 'package:flutter_web/material.dart';
import '../components/ResponsiveLayout.dart';
import '../bloc/ProjectsBloc.dart';
import '../models/Project.dart';
import '../bloc/OverlayBloc.dart';
import 'dart:js' as js;

class Projects extends StatefulWidget {
  final OverlayBloc overlayBloc;

  Projects({this.overlayBloc});

  _Projects createState() => new _Projects();
}

class _Projects extends State<Projects> with TickerProviderStateMixin {
  ProjectsBloc _projectsBloc = new ProjectsBloc();
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    super.initState();

    new Future.delayed(Duration(milliseconds: 0), () {
      _projectsBloc.initFields();
    });

    _controller.forward();

    _projectsBloc.indexStream.listen((_) {
      _controller.reset();
      _controller.forward();
    });
  }

  List<Widget> _generateCircleIndexes(int count) {
    List<Widget> content = new List<Widget>();

    for (var i = 0; i < count; i++) {
      content.add(
          new StreamBuilder(
            initialData: 0,
            stream: _projectsBloc.indexStream,
            builder: (context, AsyncSnapshot<int> snapshot) {
              return new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: new InkResponse(
                    onTap: () {
                      _projectsBloc.changeIndex(i);
                    },
                    child: new Container(
                        width: 10,
                        height: 10,
                        decoration: new BoxDecoration(
                          color: snapshot.data == i ? Colors.black : Colors.grey,
                          shape: BoxShape.circle,
                        )),
                  ));
            }
          )
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
        child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white.withOpacity(0.9)
            ),
            width: MediaQuery.of(context).size.width,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Align(alignment: Alignment.topRight, child:
                    new FlatButton.icon(onPressed: widget.overlayBloc.hide, icon: Icon(Icons.close), label: new Text("Close", style: TextStyle(fontFamily: "K2D", fontSize: 18))),
                  ),
                  new Container(
                      padding: EdgeInsets.all(60),
                      child: new FadeTransition(
                          opacity: _animation,
                          child: new StreamBuilder(
                              stream: _projectsBloc.projectStream,
                              builder: (context, AsyncSnapshot<Project> snapshot) {

                                switch(snapshot.data == null) {
                                  case true:
                                    return new Container(width: 0, height: 0);
                                  default:
                                    return new Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: <Widget>[
                                          new ResponsiveLayout(
                                            largeChild: new Expanded(
                                                flex: 1,
                                                child: new Image.asset(
                                                    snapshot.data.imageUrl,
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    height: MediaQuery.of(context).size.width * 0.4,
                                                    fit: BoxFit.contain
                                                )
                                            ),
                                            smallChild: new Container(width: 0, height: 0),
                                          ),
                                          new Expanded(
                                              flex: 1,
                                              child: new Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    new ResponsiveLayout(
                                                      largeChild: new Text(
                                                          snapshot.data.name,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontFamily: "K2D",
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 60
                                                          )
                                                      ),
                                                      smallChild: new Text(
                                                          snapshot.data.name,
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontFamily: "K2D",
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 30
                                                          )
                                                      ),
                                                    ),
                                                    new Container(
                                                        padding: EdgeInsets.only(top: 20, bottom: 10),
                                                        width: MediaQuery.of(context).size.width,
                                                        child: new Text(
                                                            snapshot.data.description,
                                                            textAlign: TextAlign.justify,
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontFamily: "K2D",
                                                                fontSize: 15
                                                            )
                                                        )
                                                    ),
                                                    new Container(
                                                        margin: EdgeInsets.only(top: 20),
                                                        child: new FlatButton(
                                                            onPressed: () {
                                                              js.context.callMethod("open", [snapshot.data.githubLink]);
                                                            },
                                                            child: new Text(
                                                                "VIEW MORE",
                                                                style: TextStyle(
                                                                    color: Color(0xFF333333),
                                                                    fontFamily: "K2D",
                                                                    fontSize: 14
                                                                )
                                                            ),
                                                            color: Colors.transparent),
                                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(0xFF333333),
                                                                width: 2
                                                            )
                                                        )
                                                    ),
                                                  ]
                                              )
                                          )
                                        ]
                                    );
                                }
                              })
                      )
                  ),
                  new Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: new StreamBuilder(
                          stream: _projectsBloc.listSizeStream,
                          builder: (context, AsyncSnapshot<int> snapshot) {
                            switch(snapshot.data == null) {
                              case true:
                                return new Container(width: 0, height: 0);
                              default:
                                return new Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: _generateCircleIndexes(snapshot.data)
                                );
                            }
                          }
                      )
                  )
                ]
            )
        )
    );
  }
}
