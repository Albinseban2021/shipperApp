import 'package:flutter/material.dart';
import 'package:shipper_app/constants/colors.dart';

class PopUpMenuForFacility {
  final String text;
  final Color color;
  final IconData icon;
  const PopUpMenuForFacility({
    required this.text,
    required this.color,
    required this.icon,
  });
}

class MenuItemFacility {
  static const editText = PopUpMenuForFacility(
    text: "Edit ",
    color: darkBlueColor,
    icon: Icons.edit_outlined,
  );
  static const deleteText = PopUpMenuForFacility(
    text: "Delete ",
    color: darkBlueColor,
    icon: Icons.edit_outlined,
  );
  static List<PopUpMenuForFacility> listItem = [editText, deleteText];
}
