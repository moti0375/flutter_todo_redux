import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;

  Item({@required this.id, @required this.body});

  Item copy({int id, String body}) {
    return Item(id: id ?? this.id, body: body ?? this.body);
  }

  Item.fromJson(Map json)
      : body = json['body'],
        id = json['id'];

  Map toJson() => {
    'id' : id,
    'body' : body
  };
}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initiateState() : items = List.unmodifiable(<Item>[]);

  AppState.fromJson(Map json) : items = (json['items'] as List).map((item) => Item.fromJson(item)).toList();

  Map toJson() => {'items' : items};
}
