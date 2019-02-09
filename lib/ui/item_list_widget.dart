import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';
import 'package:flutter_todo_redux/model/model.dart';

class ItemListWidget extends StatelessWidget{
  final ViewModel viewModel;

  ItemListWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: viewModel.items.map((Item item) => ListTile(
        title: Text(item.body),
        leading: IconButton(icon: Icon(Icons.delete),
            onPressed: (){
              viewModel.onRemoveItem(item);
            }),
      )).toList(),
    );
  }

}