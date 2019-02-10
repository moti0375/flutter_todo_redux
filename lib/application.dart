import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

//Flutter Redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

//App Redux
import 'package:flutter_todo_redux/model/model.dart';

import 'package:flutter_todo_redux/redux/actions.dart';
import 'package:flutter_todo_redux/redux/reducers.dart';
import 'package:flutter_todo_redux/redux/middleware.dart';

//Flutter Redux dev tools
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DevToolsStore<AppState> store = new DevToolsStore<AppState>(
        appStateReducer,
        initialState: AppState.initiateState(),
      middleware: [appStateMiddleware]
    );

    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Dodo Redux",
          theme: ThemeData.dark(),
          home: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(GetItemsAction()),
            builder: (BuildContext context, Store<AppState> store) {
              return AppHomePage(store);
            }
          ),
        ));
  }
}