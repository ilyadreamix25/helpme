import 'package:flutter/material.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';

class HorizontalButtonGroup extends StatelessWidget {
  final List<ButtonGroupItem> items;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;

  const HorizontalButtonGroup({
    super.key,
    required this.items,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final expandedItems = _itemsWithFixedBorderRadius().map((item) =>
      item is ButtonGroupItem ? Expanded(child: item) : item
    );

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: expandedItems.toList(),
    );
  }

  List<Widget> _itemsWithFixedBorderRadius() {
    final result = <Widget>[];

    if (items.isEmpty || items.length == 1) {
      throw ArgumentError('HorizontalButtonGroup.items cannot be empty and its size must be more than 1');
    }

    result.add(
      ButtonGroupItem(
        onPressed: items.first.onPressed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: items.first.child,
      ),
    );

    result.add(const SizedBox(width: 4));

    if (items.length == 2) {
      result.add(
        ButtonGroupItem(
          onPressed: items[1].onPressed,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: items[1].child,
        ),
      );

      return result;
    }

    items.getRange(1, items.length - 1).forEach((item) {
      result.add(
        ButtonGroupItem(
          onPressed: item.onPressed,
          borderRadius: BorderRadius.circular(4.5),
          child: item.child,
        ),
      );
      result.add(const SizedBox(width: 4));
    });

    result.add(
      ButtonGroupItem(
        onPressed: items.last.onPressed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: items.last.child,
      ),
    );

    return result;
  }
}

class VerticalButtonGroup extends StatelessWidget {
  final List<ButtonGroupItem> items;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;

  const VerticalButtonGroup({
    super.key,
    required this.items,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final fixedItems = _itemsWithFixedBorderRadius().map((item) =>
      SizedBox(
        width: double.maxFinite,
        child: item,
      ),
    );

    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: fixedItems.toList(),
    );
  }

  List<Widget> _itemsWithFixedBorderRadius() {
    final result = <Widget>[];

    if (items.isEmpty || items.length == 1) {
      throw ArgumentError('VerticalButtonGroup.items cannot be empty and its size must be more than 1');
    }

    result.add(
      ButtonGroupItem(
        onPressed: items.first.onPressed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(8),
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(8),
        ),
        child: items.first.child,
      ),
    );

    result.add(const SizedBox(height: 4));

    if (items.length == 2) {
      result.add(
        ButtonGroupItem(
          onPressed: items[1].onPressed,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(24),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
          ),
          child: items[1].child,
        ),
      );

      return result;
    }

    items.getRange(1, items.length - 1).forEach((item) {
      result.add(
        ButtonGroupItem(
          onPressed: item.onPressed,
          borderRadius: BorderRadius.circular(8),
          child: item.child,
        ),
      );
      result.add(const SizedBox(height: 4));
    });

    result.add(
      ButtonGroupItem(
        onPressed: items.last.onPressed,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
        ),
        child: items.last.child,
      ),
    );

    return result;
  }
}

class ButtonGroupItem extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;
  final BorderRadius? borderRadius; 

  const ButtonGroupItem({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleOnPress(
      onPressScale: 0.95,
      child: FilledButton(
        onPressed: onPressed,
        style: theme.filledButtonTheme.style!.copyWith(
          shape: borderRadius == null
            ? const MaterialStatePropertyAll(StadiumBorder())
            : MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: borderRadius!,
              ),
            ),
        ),
        child: DefaultTextStyle(
          style: theme.textTheme.bodySmall!.copyWith(
            color: Colors.white,
          ), 
          textAlign: TextAlign.center,
          child: child,
        ),
      ),
    );
  }
}
