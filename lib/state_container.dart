import 'package:flutter/material.dart';
import 'package:newz_app/news.dart';

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child
  }) : super(key: key, child: child);

  @override 
  bool updateShouldNotify(_InheritedStateContainer oldWidget) => true; 
}

class StateContainer extends StatefulWidget {
  final Widget child;
  StateContainer({@required this.child});

  static StateContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer) as _InheritedStateContainer).data;
  }

  @override 
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  List<Article> articles = [];

  void addToArticles(Article article) {
    articles.add(article);
  }

  @override 
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}