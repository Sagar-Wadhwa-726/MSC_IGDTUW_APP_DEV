// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // this will be in the form of a string
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // converting from string to another format (map, json object)
    final decodedData = jsonDecode(catalogJson);

    var productsData = decodedData["products"];

    // we want to take the list from productsData and then map it to convert it to a list of items
    CatalogModel.listOfItems = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Shopping App"),
      ),
      body: CatalogModel.listOfItems.isNotEmpty
          ? ListView.builder(
              itemCount: CatalogModel.listOfItems.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.listOfItems[index]);
              })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
