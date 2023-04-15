import "package:flutter/material.dart";
import 'package:shimmer/shimmer.dart';

class Tile extends StatefulWidget {
  final GestureTapCallback onPressed;
  final Color tileColor;

  final double buttonHeight;
  final double buttonWidth;
  final double borderWidth;
  final Shimmer moneyText;
  final Text title;
  final Icon icon;

  const Tile(this.borderWidth, this.buttonWidth, this.icon, this.buttonHeight,
      this.moneyText, this.onPressed, this.tileColor, this.title);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          width: 170,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Colors.black,
              width: widget.borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 0,
                offset: Offset(4, 4),
              ),
            ],
            color: widget.tileColor,
          ),
          padding: const EdgeInsets.only(
            left: 13,
            right: 12,
            top: 17,
            bottom: 18,
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.icon,
              ],
            ),
            Row(
              children: [
                widget.title,
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    child: Expanded(
                  child: widget.moneyText,
                ))
              ],
            ),
          ])),
    );
  }
}
