import 'package:flutter/material.dart';
import 'package:navigator/src/presentation/widgets/to_detail_button.dart';

import '../routing/routes.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                buildListCategory(),
                buildToSelectButton(),
              ],
            ),
            ...buildListToDetailButton()
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Detail ${widget.id}"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.popUntil(context, (router) => router.isFirst);
          },
          icon: const Icon(Icons.home),
        ),
      ],
    );
  }

  Widget buildListCategory() {
    return Expanded(
      child: categories.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: categories.map((e) => Text(e)).toList(),
              ),
            )
          : const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please select category',
                style: TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
    );
  }

  Widget buildToSelectButton() {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          Routes.select,
          arguments: categories,
        ).then((value) {
          categories = value as List<String>? ?? [];
          setState(() {});
        });
      },
      icon: const Icon(Icons.keyboard_arrow_right_outlined),
    );
  }

  List<Widget> buildListToDetailButton() {
    List<Widget> result = [];
    for (int i = 0; i < 4; i++) {
      result.add(ToDetailButton(index: i));
    }
    return result;
  }
}
