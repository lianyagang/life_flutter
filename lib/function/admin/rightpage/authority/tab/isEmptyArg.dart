/// Desc:
/// <p>
/// Date: 2021/6/25
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
import 'package:flutter/material.dart';

bool getIsEmpty(BuildContext context) {
  var isEmpty = ModalRoute.of(context) != null &&
      ModalRoute.of(context)!.settings.arguments != null &&
      ModalRoute.of(context)!.settings.arguments is bool
      ? ModalRoute.of(context)!.settings.arguments as bool
      : false;

  return isEmpty;
}