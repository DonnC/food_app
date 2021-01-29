import 'package:flutter/material.dart';

import 'widgets/animated_cliprrect.dart';
import 'widgets/scaled_animated_scaffold_app_bar.dart';
import 'widgets/scaled_animated_scaffold_menu.dart';
import 'configuration/scaled_animated_scaffold_menu_configuration.dart';

/// A Scaffold that slides and scales down to reveal a menu.
///
/// Works very similar to [Scaffold] with minor adjustments
class ScaledAnimatedScaffold extends StatefulWidget {
  const ScaledAnimatedScaffold({
    Key key,
    this.appBar = const ScaledAnimatedScaffoldAppBar(),
    this.animationDuration = const Duration(milliseconds: 150),
    this.menuConfiguration = const ScaledAnimatedScaffoldMenuConfiguration(),
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.layerColor,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.showShadow = false,
    this.shadowColor = const Color(0x8A000000),
    this.layerTopOffset = 30,
    this.layerRightOffset = 0.3,
    this.layerBottomOffset = -15,
  })  : assert(primary != null),
        assert(extendBody != null),
        assert(extendBodyBehindAppBar != null),
        assert(borderRadius != null),
        assert(animationDuration != null),
        assert(appBar != null),
        assert(menuConfiguration != null),
        assert(showShadow != null),
        assert(shadowColor != null),
        super(key: key);

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  ///
  /// See also:
  ///
  ///  * [extendBodyBehindAppBar], which extends the height of the body
  ///    to the top of the scaffold.
  final bool extendBody;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default. It must not be null.
  ///
  /// See also:
  ///
  ///  * [extendBody], which extends the height of the body to the bottom
  ///    of the scaffold.
  final bool extendBodyBehindAppBar;

  /// An app bar to display at the top of the scaffold.
  final ScaledAnimatedScaffoldAppBar appBar;

  /// Configuration for menu items and styling
  final ScaledAnimatedScaffoldMenuConfiguration menuConfiguration;

  /// The duration for animation of the opening and closing of the menu.
  ///
  /// When not provided, it defualts to [Duration(milliseconds: 150)]
  final Duration animationDuration;

  /// The primary content of the scaffold.
  ///
  /// Displayed below the [appBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  final Widget body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in a [ButtonBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget> persistentFooterButtons;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold appbar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  ///
  /// See also:
  ///
  ///  * [showBottomSheet], which displays a bottom sheet as a route that can
  ///    be dismissed with the scaffold's back button.
  ///  * [showModalBottomSheet], which displays a modal bottom sheet.
  final Widget bottomSheet;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// Border radius for scaffold when menu is visible
  final BorderRadius borderRadius;

  /// Determines whether to show the shadow behind Scaffold when menu is visible
  final bool showShadow;

  /// Color of the shadow behind Scaffold when menu is visible
  final Color shadowColor;

  // TODO: My Added attr for layer
  /// Color of the layer behind the [body] widget
  final Color layerColor;

  /// Distance of layer from the top of the [body] widget
  final double layerTopOffset;

  /// Distance of layer from the right of the [body] widget as percentage
  final double layerRightOffset;

  /// Distance of layer from the bottom of the [body] widget, (negative number)
  final double layerBottomOffset;

  @override
  ScaledAnimatedScaffoldState createState() => ScaledAnimatedScaffoldState();

  static ScaledAnimatedScaffoldState of(BuildContext context,
      {bool nullOk = false}) {
    assert(nullOk != null);
    assert(context != null);
    final ScaledAnimatedScaffoldState result =
        context.findAncestorStateOfType<ScaledAnimatedScaffoldState>();
    if (nullOk || result != null) return result;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
          'ScaledAnimatedScaffold.of() called with a context that does not contain a ScaledAnimatedScaffold.'),
      ErrorDescription(
          'No ScaledAnimatedScaffold ancestor could be found starting from the context that was passed to ScaledAnimatedScaffold.of(). '
          'This usually happens when the context provided is from the same StatefulWidget as that '
          'whose build function actually creates the ScaledAnimatedScaffold widget being sought.'),
      ErrorHint(
          'There are several ways to avoid this problem. The simplest is to use a Builder to get a '
          'context that is "under" the ScaledAnimatedScaffold. For an example of this, please see the '),
      ErrorHint(
          'A more efficient solution is to split your build function into several widgets. This '
          'introduces a new context from which you can obtain the ScaledAnimatedScaffold. In this solution, '
          'you would have an outer widget that creates the ScaledAnimatedScaffold populated by instances of '
          'your new inner widgets, and then in these inner widgets you would use ScaledAnimatedScaffold.of().\n'
          'A less elegant but more expedient solution is assign a GlobalKey to the ScaledAnimatedScaffold, '
          'then use the key.currentState property to obtain the ScaledAnimatedScaffoldState rather than '
          'using the ScaledAnimatedScaffold.of() function.'),
      context.describeElement('The context used was')
    ]);
  }
}

class ScaledAnimatedScaffoldState extends State<ScaledAnimatedScaffold>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaledAnimatedScaffoldMenuState> _scaffoldMenuKey =
      GlobalKey<ScaledAnimatedScaffoldMenuState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController _scaleAnimationController;
  bool _isMenuVisible = false;

  @override
  void initState() {
    super.initState();
    _scaleAnimationController = AnimationController(
      vsync: this,
      value: 1,
      lowerBound: 0.7,
      upperBound: 1.0,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scaleAnimationController.dispose();
  }

  void toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });

    _isMenuVisible
        ? _scaleAnimationController.reverse()
        : _scaleAnimationController.forward();

    _scaffoldMenuKey.currentState?.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double offset = _isMenuVisible ? constraints.maxWidth / 2 : 0;
        return Material(
          color: widget.menuConfiguration.backgroundColor ??
              Theme.of(context).canvasColor,
          child: Stack(
            children: [
              AnimatedPositioned(
                key: UniqueKey(),
                top: 0,
                right: 0,
                left: 0,
                duration: widget.animationDuration,
                child: ScaledAnimatedScaffoldMenu(
                  key: _scaffoldMenuKey,
                  animationDuration: widget.animationDuration,
                  header: widget.menuConfiguration.header,
                  content: widget.menuConfiguration.content,
                  footer: widget.menuConfiguration.footer,
                ),
              ),
              AnimatedPositioned(
                key: UniqueKey(),
                top: widget.layerTopOffset,
                right: -offset + constraints.maxWidth * widget.layerRightOffset,
                bottom: widget.layerBottomOffset,
                left: offset,
                duration: widget.animationDuration,
                child: ScaleTransition(
                  scale: _scaleAnimationController,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.layerColor,
                      borderRadius: _isMenuVisible
                          ? widget.borderRadius
                          : BorderRadius.zero,
                      boxShadow: [
                        if (widget.showShadow)
                          BoxShadow(
                            blurRadius: 12,
                            color: widget.shadowColor,
                            offset: Offset(0, 4),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: 0,
                right: -offset,
                bottom: 0,
                left: offset,
                duration: widget.animationDuration,
                child: ScaleTransition(
                  scale: _scaleAnimationController,
                  child: Stack(
                    children: [
                      AbsorbPointer(
                        absorbing: _isMenuVisible,
                        child: AnimatedContainer(
                          duration: widget.animationDuration,
                          decoration: BoxDecoration(
                            borderRadius: _isMenuVisible
                                ? widget.borderRadius
                                : BorderRadius.zero,
                          ),
                          child: AnimatedClipRRect(
                            borderRadius: _isMenuVisible
                                ? widget.borderRadius
                                : BorderRadius.zero,
                            duration: widget.animationDuration,
                            child: Scaffold(
                              key: _scaffoldKey,
                              appBar: widget.appBar,
                              body: widget.body,
                              floatingActionButton: widget.floatingActionButton,
                              floatingActionButtonLocation:
                                  widget.floatingActionButtonLocation,
                              floatingActionButtonAnimator:
                                  widget.floatingActionButtonAnimator,
                              persistentFooterButtons:
                                  widget.persistentFooterButtons,
                              bottomNavigationBar: widget.bottomNavigationBar,
                              bottomSheet: widget.bottomSheet,
                              backgroundColor: widget.backgroundColor,
                              resizeToAvoidBottomInset:
                                  widget.resizeToAvoidBottomInset,
                              primary: widget.primary,
                              extendBody: widget.extendBody,
                              extendBodyBehindAppBar:
                                  widget.extendBodyBehindAppBar,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onHorizontalDragStart: (_) {
                          toggleMenu();
                        },
                        child: Container(
                          width: !_isMenuVisible ? 20 : constraints.maxWidth,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
