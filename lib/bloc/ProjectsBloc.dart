import 'dart:async';
import '../models/Project.dart';
import '../repositories/ProjectsRepository.dart';

class ProjectsBloc {

  StreamController<int> _indexSubject;
  StreamController<int> _listSizeSubject;
  StreamController<Project> _projectSubject;
  List<Project> _list;

  //timer logic
  int _currentIndex = 0;
  Timer _timer;

  ProjectsBloc() {
    _indexSubject = new StreamController.broadcast();
    _projectSubject = new StreamController.broadcast();
    _listSizeSubject = new StreamController.broadcast();
    _list = new ProjectsRepository().getProjects();
  }

  initFields(){
    _listSizeSubject.sink.add(_list.length);
    _projectSubject.sink.add(_list.first);
    _indexSubject.sink.add(0);
    _startTimer();
  }

  _startTimer(){
    _timer = new Timer(Duration(seconds: 10), (){
      if(_currentIndex + 1 < _list.length){
        changeIndex(_currentIndex + 1);
      }
      else {
        changeIndex(0);
      }
    });
  }

  changeIndex(int index) {
    _timer.cancel();
    _currentIndex = index;
    _indexSubject.sink.add(_currentIndex);
    _projectSubject.sink.add(_list[index]);

    _startTimer();
  }

  Stream<int> get indexStream => _indexSubject.stream;

  Stream<int> get listSizeStream => _listSizeSubject.stream;

  Stream<Project> get projectStream => _projectSubject.stream;

}