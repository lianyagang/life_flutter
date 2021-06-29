import 'package:flutter/material.dart';

/// Desc:
/// <p>
/// Date: 2021/6/19
/// Copyright: Copyright (c) 2010-2021
/// Company: @微微科技有限公司
/// Updater:
/// Update Time:
/// Update Comments:
/// Author：lianyagang
///
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget child;
  final Function(T) onModelReady;
  final T viewModel;

  BaseWidget({
    Key? key,
    required this.child,
    required this.onModelReady,
    required this.viewModel,
  }) : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;

    widget.onModelReady(_model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: widget.child,
    );
  }
}
