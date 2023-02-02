import 'package:flutter/cupertino.dart';

import '../../routing/routes.dart';

class ToDetailButton extends StatelessWidget {
  const ToDetailButton({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('To Detail $index'),
      onPressed: () {
        Navigator.pushNamed(context, Routes.detail, arguments: index);
      },
    );
  }
}
