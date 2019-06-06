import 'dart:async';

class OverlayBloc {

  StreamController<bool> _visibleSubject;

  OverlayBloc(){
    this._visibleSubject = new StreamController.broadcast();
  }

  show(){
    this._visibleSubject.sink.add(true);
  }

  hide(){
    this._visibleSubject.sink.add(false);
  }

  Stream<bool> get visibleStream => this._visibleSubject.stream;

}