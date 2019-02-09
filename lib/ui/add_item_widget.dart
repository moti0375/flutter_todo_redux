import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

class AddItemWidget extends StatefulWidget {
  final ViewModel viewModel;

  AddItemWidget(this.viewModel);

  @override
  State<StatefulWidget> createState() => AddItemState();
}

class AddItemState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Add an item'),
        onSubmitted: (String s) {
          widget.viewModel.onAddItem(s);
          controller.text = '';
        });
  }
}
