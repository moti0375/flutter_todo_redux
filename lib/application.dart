import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

//Flutter Redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

//App Redux
import 'package:flutter_todo_redux/model/model.dart';

import 'package:flutter_todo_redux/redux/actions.dart';
import 'package:flutter_todo_redux/redux/reducers.dart';


class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = new Store<AppState>(
        appStateReducer,
        initialState: AppState.initiateState()
    );

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Dodo Redux",
          theme: ThemeData.dark(),
          home: new AppHomePage(),
        ));
  }
}