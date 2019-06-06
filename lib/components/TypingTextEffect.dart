import 'package:flutter_web/material.dart';
import 'dart:async';

class TypingTextEffect extends StatelessWidget {

  final String text;
  TypingTextEffectBloc _typingTextEffectBloc;

  TypingTextEffect(this.text){
    _typingTextEffectBloc = new TypingTextEffectBloc(this.text);
  }

  @override
  Widget build(BuildContext context) {

    _typingTextEffectBloc.initEffect();

    return new StreamBuilder(stream: _typingTextEffectBloc.textStream, initialData: "", builder: (context, AsyncSnapshot<String> textSnapshot){
      return new Row(children: <Widget>[
        new Text(textSnapshot.data, style: TextStyle(color: Colors.white, fontSize: 80, fontFamily: "K2D")),
        new StreamBuilder(initialData: false, stream: _typingTextEffectBloc.cursorStream, builder: (context, AsyncSnapshot<bool> cursorSnapshot){
          if(cursorSnapshot.data) {
            return new Text("|", style: TextStyle(color: Colors.white, fontSize: 80, fontFamily: "K2D"));
          } else {
            return new Container(width: 0, height: 0);
          }
        })
      ]);
    });
  }
}

class TypingTextEffectBloc {

  StreamController<String> _textSubject;
  StreamController<bool> _visibleSubject;
  String _text;

  TypingTextEffectBloc(this._text){
    _textSubject = new StreamController.broadcast();
    _visibleSubject = new StreamController.broadcast();
    _startCursorEffect();
  }

  _startCursorEffect(){
    var status = false;
    Timer.periodic(new Duration(milliseconds: 400), (_) {
      _visibleSubject.sink.add(status);
      status = !status;
    });
  }

  initEffect() async {
    String textToExpose = "";

    await Future.forEach(_text.split(""), (str) async {
      await new Future.delayed(new Duration(milliseconds: 100), (){
        textToExpose += str;
        _textSubject.sink.add(textToExpose);
      });
    });

  }

  Stream<String> get textStream => _textSubject.stream;

  Stream<bool> get cursorStream => _visibleSubject.stream;

}