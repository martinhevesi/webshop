import 'package:flutter/material.dart';
import 'package:webshop/components/max_width_button.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

class AddProductButton extends StatefulWidget {
  final void Function() onPressed;
  final int amount;

  const AddProductButton({
    Key key,
    this.onPressed,
    this.amount,
  }) : super(key: key);

  @override
  _AddProductButtonState createState() => _AddProductButtonState();
}

class _AddProductButtonState extends State<AddProductButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  Future<void> _runAnimation(BuildContext context) async {
    final RenderBox renderBox = context.findRenderObject();
    final widgetPosition = renderBox.localToGlobal(Offset.zero);
    final widgetWidth = renderBox.size.width;
    final screenWidth = MediaQuery.of(context).size.width;
    var entry = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Positioned(
          left: (widgetPosition.dx + widgetWidth / 2) +
              (screenWidth - widgetPosition.dx - widgetWidth / 2 - 68) *
                  (_animation.value),
          top: 25 + (widgetPosition.dy - 60) * (1 - _animation.value),
          child: child,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
            child: Text(
              '+${widget.amount}',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Raleway",
                fontSize: 12,
              ),
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(entry);

    await _controller.forward(from: 0);
    entry.remove();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return MaxWidthButton(
      text: WebshopLocalizations.of(context).addToCart,
      onPressed: () {
        _runAnimation(context);
      },
    );
  }
}
