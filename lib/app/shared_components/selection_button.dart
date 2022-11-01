import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dailytask/app/config/constants/app_constants.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotifications;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotifications,
  });
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({
    super.key,
    this.initialSelected = 0,
    required this.data,
    required this.onSelected,
  });

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();

    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.data.asMap().entries.map((e) {
      final index = e.key;
      final data = e.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _Button(
          selected: selected == index,
          data: data,
          onPressed: () {
            widget.onSelected(index, data);
            setState(() {
              selected = index;
            });
          },
        ),
      );
    }).toList());
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.selected,
    required this.data,
    required this.onPressed,
  });

  final bool selected;
  final SelectionButtonData data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          (!selected) ? null : Theme.of(context).primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(sBorderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(sBorderRadius),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              _buildIcon(),
              const SizedBox(
                width: sSpacing / 2,
              ),
              Expanded(child: _buildLabel()),
              Padding(
                padding: const EdgeInsets.only(left: sSpacing / 2),
                child: _buildNotify(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      (!selected) ? data.icon : data.activeIcon,
      size: 20,
      color: (!selected)
          ? FontColorPallets.grey
          : Theme.of(Get.context!).primaryColor,
    );
  }

  Widget _buildLabel() {
    return Text(
      data.label,
      style: TextStyle(
        color: (!selected)
            ? FontColorPallets.grey
            : Theme.of(Get.context!).primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
        fontSize: 14,
      ),
    );
  }

  Widget _buildNotify() {
    return (data.totalNotifications == null || data.totalNotifications! <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              (data.totalNotifications! >= 100)
                  ? "99+"
                  : "${data.totalNotifications!}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
