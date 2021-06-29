import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'package:provider/provider.dart';

typedef ViewModelWidgetBuilder<VM> = Widget Function(
    BuildContext context, VM viewModel, Widget? child);

typedef ChildViewModelWidgetBuilder<PVM, VM> = Widget Function(
    BuildContext context, PVM parent, VM viewModel, Widget? child);

class ViewModelProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Function(T)? onModelReady;
  final T viewModel;

  ViewModelProvider(
      {Key? key,
      this.onModelReady,
      required this.viewModel,
      required this.child})
      : super(key: key);

  @override
  _ViewModelWidgetState<T> createState() => _ViewModelWidgetState();
}

class _ViewModelWidgetState<T extends ChangeNotifier>
    extends State<ViewModelProvider<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;
    if (widget.onModelReady != null) {
      widget.onModelReady!(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      child: widget.child,
    );
  }
}

extension ViewModelContext on BuildContext {
  T viewModel<T>() => this.select((T value) => value);
}
