import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux/model/model.dart';
import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions.dart';
import 'package:flutter_todo_redux/ui/add_item_widget.dart';
import 'package:flutter_todo_redux/ui/item_list_widget.dart';
import 'package:flutter_todo_redux/ui/remove_items_widget.dart';

//Flutter Redux dev tools
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';


class AppHomePage extends StatelessWidget {
  final DevToolsStore<AppState> store;
  AppHomePage(this.store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux Todo App"),
      ),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Column(
          children: <Widget>[
            AddItemWidget(viewModel),
            Expanded(
              child: ItemListWidget(viewModel)
            ),
            RemoveItemsWidget(viewModel)
          ],
        ),
      ),
      drawer: Container(
        child: ReduxDevTools(store)),
    );
  }
}

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel(
      {this.items,
        this.onAddItem,
        this.onRemoveItem,
        this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(String body) {
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
        items: store.state.items,
        onAddItem: _onAddItem,
        onRemoveItem: _onRemoveItem,
        onRemoveItems: _onRemoveItems);
  }
}
