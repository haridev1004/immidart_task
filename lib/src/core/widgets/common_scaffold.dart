// common_scaffold.dart
// A reusable CommonScaffold widget for Flutter apps.
// Author: ChatGPT

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A flexible, eye-catching scaffold used across the app.
///
/// Features:
/// - Optional AppBar with customizable title, leading, and actions
/// - SafeArea wrapper (optional)
/// - Built-in padding for content
/// - Optional background image or gradient support via `decoration`
/// - Optional centered body column that handles scrolling
/// - Defaults are tuned for a modern, consistent look
class CommonScaffold extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget body;
  final bool extendBodyBehindAppBar;
  final bool useSafeArea;
  final bool scrollableBody;
  final EdgeInsetsGeometry bodyPadding;
  final PreferredSizeWidget? bottomAppBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? backgroundColor;
  final Decoration? decoration;
  final bool showAppBar;
  final double appBarElevation;
  final bool centerTitle;
  final Brightness? statusBarBrightness;

  const CommonScaffold({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    required this.body,
    this.extendBodyBehindAppBar = false,
    this.useSafeArea = true,
    this.scrollableBody = false,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.bottomAppBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.backgroundColor,
    this.decoration,
    this.showAppBar = true,
    this.appBarElevation = 0,
    this.centerTitle = false,
    this.statusBarBrightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = scrollableBody
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(padding: bodyPadding, child: body),
          )
        : Padding(padding: bodyPadding, child: body);

    final scaffoldBody = useSafeArea ? SafeArea(child: content) : content;

    return Container(
      decoration: decoration,
      color: decoration == null
          ? backgroundColor ?? Theme.of(context).scaffoldBackgroundColor
          : null,
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: Colors.transparent,
        appBar: showAppBar
            ? AppBar(
                title: title != null ? Text(title!) : null,
                centerTitle: centerTitle,
                elevation: appBarElevation,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: leading == null ? true : false,
                leading: leading,
                actions: actions,
                systemOverlayStyle: statusBarBrightness != null
                    ? (statusBarBrightness == Brightness.dark
                          ? SystemUiOverlayStyle.light
                          : SystemUiOverlayStyle.dark)
                    : null,
              )
            : null,
        body: scaffoldBody,
        bottomNavigationBar: bottomAppBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
