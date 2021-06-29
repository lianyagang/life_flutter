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
class CommonConfirmDialog extends StatelessWidget {
  final VoidCallback onPressed;

  CommonConfirmDialog(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: onPressed, child: Text('确定')),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('取消')),
        ],
      ),
    );
  }
}
