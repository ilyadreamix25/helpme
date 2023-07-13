import 'package:flutter/material.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';
import 'package:ionicons/ionicons.dart';

class HomeBottomContent extends StatefulWidget implements PreferredSizeWidget {
  final double bottomPadding;
  final int? startItem;
  final Function(int) onClick;
  
  const HomeBottomContent({
    super.key,
    required this.bottomPadding,
    required this.onClick,
    this.startItem
  });

  @override
  Size get preferredSize => Size.fromHeight(80 + bottomPadding);

  @override
  State<StatefulWidget> createState() => _HomeBottomContentState();
}

class _HomeBottomContentState extends State<HomeBottomContent> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.startItem ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 80 + widget.bottomPadding,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      ),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 8 + widget.bottomPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _HomeBottonNavBarItem(
            icon: Ionicons.chatbox_ellipses,
            isSelected: selectedIndex == 0,
            onClick: () {
              if (selectedIndex != 0) {
                widget.onClick(0);
                setState(() {
                  selectedIndex = 0;
                });
              }
            },
          ),
          _HomeBottonNavBarItem(
            icon: Ionicons.list,
            isSelected: selectedIndex == 1,
            onClick: () {
              if (selectedIndex != 1) {
                widget.onClick(1);
                setState(() {
                  selectedIndex = 1;
                });
              }
            },
          ),
          _HomeBottonNavBarItem(
            icon: Ionicons.person,
            isSelected: selectedIndex == 2,
            onClick: () {
              if (selectedIndex != 2) {
                widget.onClick(2);
                setState(() {
                  selectedIndex = 2;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HomeBottonNavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function() onClick;

  const _HomeBottonNavBarItem({
    required this.isSelected,
    required this.onClick,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleOnPress(
      onPressScale: 0.75,
      onClick: onClick,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          color: isSelected
            ? Colors.black
            : theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
