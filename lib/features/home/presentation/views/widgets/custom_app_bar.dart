import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_bar.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.onChanged,
    required this.textController,
  });

  final void Function(String)? onChanged;
  final TextEditingController textController;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearch = false;

  Widget buildSearch() {
    return TextField(
      controller: widget.textController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              stopSearching();
            },
            icon: const Icon(
              Icons.clear,
              color: kPrimaryColor,
              size: 20,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        hintText: 'Searching...',
        hintStyle: Styles.textStyle14,
        prefixIcon: const Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: kPrimaryColor,
          size: 20,
        ),
      ),
    );
  }

  void stopSearching() {
    _clearHistory();
    setState(() {
      isSearch = false;
    });
  }

  void _clearHistory() {
    setState(() {
      widget.textController.clear();
    });
  }

  void startSearch() {
    setState(() {
      isSearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6.h,
          ),
          Image.asset(
            ImageData.routeAppBar,
            height: 22.h,
            width: 66.w,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    startSearch();
                  },
                  child: isSearch ? buildSearch() : const CustomSearchBar(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).push('/CartView');
                  },
                  child: Image.asset(
                    ImageData.shoppingCart,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
