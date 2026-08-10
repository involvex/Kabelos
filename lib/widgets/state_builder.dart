import 'dart:async';

import 'package:flutter/material.dart';
import '../controllers/wifi_direct_controller.dart';
import '../models/wifi_direct_models.dart';

/// A widget that rebuilds only when a specified subset of
/// [WiFiDirectState] fields changes.
///
/// Unlike wrapping a whole tab in [StreamBuilder] (which rebuilds on every
/// state emission), [StateBuilder] lets each tab declare which state fields it
/// cares about via [shouldRebuild].  This dramatically reduces unnecessary
/// widget tree rebuilds when unrelated state (e.g. logs or file-transfer
/// progress) changes.
///
/// Example:
/// ```dart
/// StateBuilder(
///   controller: controller,
///   shouldRebuild: (prev, curr) => prev.connectionFieldsDiffer(curr),
///   builder: (context, state) => ConnectionTabContent(state: state),
/// )
/// ```
class StateBuilder extends StatefulWidget {
  final WiFiDirectController controller;
  final bool Function(WiFiDirectState prev, WiFiDirectState curr) shouldRebuild;
  final Widget Function(BuildContext, WiFiDirectState) builder;

  const StateBuilder({
    super.key,
    required this.controller,
    required this.shouldRebuild,
    required this.builder,
  });

  @override
  State<StateBuilder> createState() => _StateBuilderState();
}

class _StateBuilderState extends State<StateBuilder> {
  late final StreamSubscription<WiFiDirectState> _subscription;
  WiFiDirectState? _currentState;

  @override
  void initState() {
    super.initState();
    _currentState = widget.controller.currentState;
    _subscription = widget.controller.stateStream.listen(_onStateChanged);
  }

  void _onStateChanged(WiFiDirectState newState) {
    final prev = _currentState;
    if (prev == null) {
      // First emission — always rebuild.
      _currentState = newState;
      if (mounted) setState(() {});
      return;
    }
    if (widget.shouldRebuild(prev, newState)) {
      _currentState = newState;
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _currentState ?? WiFiDirectState());
  }
}
