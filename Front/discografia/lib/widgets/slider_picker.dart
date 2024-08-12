import 'package:flutter/material.dart';

class SliderPicker extends StatelessWidget {
  const SliderPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidgets = [];

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: listWidgets.length,
      separatorBuilder: (context, index) => SizedBox(width: 5),
      itemBuilder: (context, index) {
        final item = listWidgets[index];
      },
    );
  }
}
