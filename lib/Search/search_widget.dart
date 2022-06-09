import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 5),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        elevation: 5,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search for desired product here',
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: widget.text.isNotEmpty
                ? GestureDetector(
                    child: Icon(Icons.close, color: style.color),
                    onTap: () {
                      controller.clear();
                      widget.onChanged('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : Icon(Icons.search, color: style.color),
            contentPadding:
                EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),

          // decoration: InputDecoration(
          //   icon: Icon(Icons.search, color: style.color),
          //   suffixIcon: widget.text.isNotEmpty
          //       ? GestureDetector(
          //           child: Icon(Icons.close, color: style.color),
          //           onTap: () {
          //             controller.clear();
          //             widget.onChanged('');
          //             FocusScope.of(context).requestFocus(FocusNode());
          //           },
          //         )
          //       : null,
          //   hintText: widget.hintText,
          //   hintStyle: style,
          //   border: InputBorder.none,
          // ),
          style: style,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
