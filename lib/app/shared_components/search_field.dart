import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';

class SearchField extends StatelessWidget {
  SearchField({
    super.key,
    this.onSearch,
    this.hintText,
  });

  final controller = TextEditingController();
  final Function(String value)? onSearch;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(EvaIcons.search),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          hintText: hintText ?? 'search...'),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (onSearch != null) onSearch!(controller.text);
      },
      textInputAction: TextInputAction.search,
      style: const TextStyle(color: FontColorPallets.grey),
    );
  }
}
