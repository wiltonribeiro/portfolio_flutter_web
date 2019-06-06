import 'package:flutter_web/material.dart';
import '../components/TypingTextEffect.dart';
import '../components/ResponsiveLayout.dart';
import '../bloc/OverlayBloc.dart';
import 'dart:js' as js;

class Presentation extends StatefulWidget {
  final OverlayBloc overlayBloc;

  Presentation({this.overlayBloc});

  _Presentation createState() => new _Presentation();
}

class _Presentation extends State<Presentation> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  List<Widget> contents;
  int index = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    contents = [_presentationContent(), _aboutContent(), _contactContent()];

    _controller.forward();
  }

  Widget _presentationContent() {
    return new FadeTransition(
        opacity: _animation,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ResponsiveLayout(
                largeChild: new TypingTextEffect("Hello, I'm Wilton"),
                mediumChild: new Text("Hello, I'm Wilton",
                    style: TextStyle(
                        color: Colors.white, fontSize: 80, fontFamily: "K2D"
                    )
                ),
              ),
              new Text(
                  "Software Engineer student. Flutter and Golang enthusiast",
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: "K2D"
                  )
              ),
            ]
        )
    );
  }

  Widget _aboutContent() {
    return new FadeTransition(
        opacity: _animation,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("About me",
                  style: TextStyle(
                      color: Colors.white, fontSize: 80, fontFamily: "K2D"
                  )
              ),
              new Container(
                padding: EdgeInsets.only(top: 10),
                width: 600,
                child: new Text(
                    "Passionate about software development and usability. I currently have skills with Native Android Development using Java, Kotlin and cross-platform using Flutter. To web development, I currently know FrontEnd using technologies like: HTML, CSS, SASS, JS, React.js and some experience with Vue.js. About BackEnd development, I also have experience with JS and TS using Node.js, and Golang. Some tools that I've already work with are Firebase and Google Cloud. I am a Software Engineering student from the Federal University of Ceará and in love with Flutter and Golang. Well, I'm glad that you know me. Now let me know you...",
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, fontFamily: "K2D"
                    )
                ),
              )
            ]
        )
    );
  }

  Widget _contactContent() {
    return new FadeTransition(
        opacity: _animation,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: new SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: new GestureDetector(
                          onTap: () {
                            js.context.callMethod("open", ["https://www.linkedin.com/in/wiltonribeiro"]);
                          },
                          child: new Row(children: <Widget>[
                            new Image.asset("social/linkedin.png", width: 40),
                            new Container(
                              margin: EdgeInsets.only(left: 10),
                              child: new Text(
                                  "www.linkedin.com/in/wiltonribeiro",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "K2D")
                              ),
                            )
                          ])
                      )
                  )
              ),
              new Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: new SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: new GestureDetector(
                          onTap: () {
                            js.context.callMethod("open", ["https://www.github.com/wiltonribeiro"]);
                          },
                          child: new Row(children: <Widget>[
                            new Image.asset("social/github.png", width: 40),
                            new Container(
                              margin: EdgeInsets.only(left: 10),
                              child: new Text("www.github.com/wiltonribeiro",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "K2D"
                                  )
                              ),
                            )
                          ])
                      )
                  )
              ),
              new Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: new SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: new GestureDetector(
                          onTap: () {
                            js.context.callMethod("open", ["https://twitter.com/Willrcn"]);
                          },
                          child: new Row(children: <Widget>[
                            new Image.asset("social/twitter.png", width: 40),
                            new Container(
                              margin: EdgeInsets.only(left: 10),
                              child: new Text("https://twitter.com/Willrcn",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "K2D"
                                  )
                              ),
                            )
                          ])
                      )
                  )
              ),
            ])
      );
  }

  void changeContent(int i) {
    _controller.reset();
    setState(() {
      index = i;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height),
        child: new Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: new Padding(
                padding: EdgeInsets.all(40),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      contents[index],
                      new Container(
                          padding: EdgeInsets.only(top: 20),
                          child: new Wrap(children: <Widget>[
                            new Container(
                                margin: EdgeInsets.only(right: 20, bottom: 10),
                                child: new FlatButton(
                                    onPressed: () {
                                      this.changeContent(1);
                                    },
                                    child: new Text("ABOUT ME",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "K2D"
                                        )
                                    ),
                                    color: Colors.transparent),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2
                                    )
                                )
                            ),
                            new Container(
                                margin: EdgeInsets.only(right: 20, bottom: 10),
                                child: new FlatButton(
                                    onPressed: widget.overlayBloc.show,
                                    child: new Text("PROJECTS",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "K2D")
                                    ),
                                    color: Colors.transparent
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2
                                    )
                                )
                            ),
                            new Container(
                                margin: EdgeInsets.only(right: 20, bottom: 10),
                                child: new FlatButton(
                                    onPressed: () {
                                      this.changeContent(2);
                                    },
                                    child: new Text("CONTACT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "K2D"
                                        )
                                    ),
                                    color: Colors.transparent),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2
                                    )
                                )
                            ),
                          ])
                      )
                    ])
            )
        )
    );
  }
}
