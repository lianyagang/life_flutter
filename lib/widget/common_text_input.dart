import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Desc:
/// <p>
/// Date: 2021/6/27
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
class CommonTextFileInput extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  CommonTextFileInput(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.hintText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CommonTextFileInputState();
  }
}

class _CommonTextFileInputState extends State<CommonTextFileInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14.0),
        child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300)),
            maxLength: 13,
            maxLines: 1,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            )));
  }
}
