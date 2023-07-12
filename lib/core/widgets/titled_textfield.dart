import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TitledTextField extends StatelessWidget {
  final String title;
  final Function(String) onChanged;
  final String? hint;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextEditingController? controller;
  final TextInputAction? actions;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;

  const TitledTextField({
    super.key,
    required this.title,
    required this.onChanged,
    this.hint,
    this.backgroundColor,
    this.foregroundColor,
    this.controller,
    this.actions,
    this.inputFormatters,
    this.inputType
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.black,
        borderRadius: BorderRadius.circular(16)
      ),
      clipBehavior: Clip.hardEdge,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 15, 12, 16),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                textInputAction: actions,
                inputFormatters: inputFormatters,
                keyboardType: inputType,
                onChanged: onChanged,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: hint,
                  contentPadding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.black,
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
                    color: Colors.white.withOpacity(0.75),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}
