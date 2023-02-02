import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key, required this.categories});

  final List<String> categories;

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<String> select = [];

  @override
  void initState() {
    select = List.from(widget.categories);
    super.initState();
  }

  final List<String> selectCategories = const [
    'Apple',
    'Samsung',
    'Oppo',
    'Xiaomi'
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.categories);
        return true;
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: selectCategories.map((e) => buildSelectItem(e)).toList(),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Select category'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context, select);
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }

  Widget buildSelectItem(String text) {
    return InkWell(
      onTap: () {
        if (select.contains(text)) {
          select.remove(text);
        } else {
          select.add(text);
        }
        setState(() {});
      },
      child: Text(
        text,
        style: TextStyle(
          color: select.contains(text) ? Colors.black : Colors.black38,
        ),
      ),
    );
  }
}
