import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

class RemoveItemsWidget extends StatelessWidget{
  final ViewModel viewModel;

  RemoveItemsWidget(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Delete all Items"),
      onPressed: () => viewModel.onRemoveItems()
    );
  }



}