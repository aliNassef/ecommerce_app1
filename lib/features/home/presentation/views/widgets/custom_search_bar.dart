
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        hintText: 'what do you search for?',
        hintStyle: Styles.textStyle14,
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            25,
          ),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
