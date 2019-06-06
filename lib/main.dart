import 'package:flutter_web/material.dart';
import 'views/Presentation.dart';
import 'views/Projects.dart';
import 'bloc/OverlayBloc.dart';

void main() => runApp(Portfolio());

class Portfolio extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
  
}

class Home extends StatelessWidget {

  OverlayBloc _overlayBloc = new OverlayBloc();

  @override
  Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.white, body: 
        new Stack(children: <Widget>[
          new Presentation(overlayBloc: _overlayBloc),
          new StreamBuilder(initialData: false, stream: _overlayBloc.visibleStream, builder: (context, AsyncSnapshot<bool> snapshot) {
            return snapshot.data ? new Projects(overlayBloc: _overlayBloc) : new Container(width: 0, height: 0);
          })
        ])
    );
  }

}
