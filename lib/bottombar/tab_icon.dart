import 'package:flutter/material.dart';
import 'package:winteam/bottombar/tab_item_icon.dart';

class TabItem extends StatefulWidget {
  final TabItemIcon tabItemIcon;
  final bool isSelected;
  final int index;
  final Duration duration;

  final void Function(int index) onTabChange;
  TabItem({
    required this.duration,
    required this.tabItemIcon,
    required this.onTabChange,
    required this.index,
    required this.isSelected,
  }) : super(key: Key(index.toString()));
  @override
  TabItemState createState() => TabItemState();
}

class TabItemState extends State<TabItem> with SingleTickerProviderStateMixin {
  late Animation<Color?> colorAnim;
  late Animation<Offset> transAnim;
  late AnimationController animationController;
  final Duration subDuration = const Duration(milliseconds: 200);

  @override
  void didUpdateWidget(TabItem oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
    if (widget.duration != oldWidget.duration) {
      animationController.duration = widget.duration;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration - subDuration,
    );

    transAnim = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, -28),
    ).animate(animationController);
    colorAnim = ColorTween(
      begin: widget.tabItemIcon.startColor ?? Colors.black,
      end: widget.tabItemIcon.endColor ?? Colors.white,
    ).animate(animationController);
    if (widget.isSelected) animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () => widget.onTabChange(widget.index),
        child: AnimatedBuilder(
          animation: animationController,
          builder: (_, __) => Container(
            alignment: Alignment.center,
            child: Transform.translate(
              offset: transAnim.value,
              child: widget.tabItemIcon.buildWidget != null
                  ? widget.tabItemIcon.buildWidget!(context, colorAnim)
                  : Icon(
                widget.tabItemIcon.iconData,
                size: 30,
                color: colorAnim.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}