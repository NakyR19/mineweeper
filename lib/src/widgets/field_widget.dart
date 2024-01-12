import 'package:flutter/material.dart';
import 'package:mineweeper/src/models/field.dart';

class FieldWidget extends StatelessWidget {
  const FieldWidget(
      {super.key,
      required this.field,
      required this.onOpen,
      required this.onSwitchMark});

  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onSwitchMark;

  Widget _getImage() {
    int qtfyMines = field.minesOnAdjacents;
    Widget image;
    if (field.opened && field.hasMine && field.exploded) {
      image = Image.asset('assets/images/mine_1.jpg');
    } else if (field.opened && field.hasMine) {
      image = Image.asset('assets/images/mine.jpg');
    } else if (field.opened) {
      image = Image.asset('assets/images/$qtfyMines.jpg');
    } else if (field.hasFlag) {
      image = Image.asset('assets/images/flag.jpg');
    } else {
      image = Image.asset('assets/images/casanormal.jpg');
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onSwitchMark(field),
      child: _getImage(),
    );
  }
}