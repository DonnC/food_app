import 'package:flutter/material.dart';

/// The configuration for the [ScaledAnimatedScaffoldMenu]
///
/// This class is in charged of providing all content and styling
/// for the menu.
class ScaledAnimatedScaffoldMenuConfiguration {
  /// Creates the configuration for the [ScaledAnimatedScaffoldMenu]
  const ScaledAnimatedScaffoldMenuConfiguration({
    this.header,
    this.footer,
    this.content,
    this.backgroundColor,
  });

  /// The header for the menu of the ScaledAnimatedScaffold.
  ///
  /// If the widget is bigger than the allowed height, it will become scrollable
  /// to allow for all the content to be accessible.
  final Widget header;

  /// The footer for the menu of the ScaledAnimatedScaffold.
  ///
  /// If the widget is bigger than the allowed height, it will become scrollable
  /// to allow for all the content to be accessible.
  final Widget footer;

  /// The content for the menu of the ScaledAnimatedScaffold. Typically a
  /// [Column] with [ScaledAnimatedScaffoldMenuButton]s as children.
  ///
  /// This widget is displayed in the middle of the menu.
  ///
  /// If the widget is bigger than the allowed height, it will become scrollable
  /// to allow for all the content to be accessible.
  final Widget content;

  /// The background color for the menu when visible.
  ///
  /// Defaults to [Theme.of(context).canvasColor]
  final Color backgroundColor;
}
