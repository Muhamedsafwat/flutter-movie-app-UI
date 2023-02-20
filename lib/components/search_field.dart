import 'package:flutter/material.dart';
import 'package:movie_app_ui/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      height: 36,
      decoration: BoxDecoration(
        color: Constants.kGreyColor.withOpacity(.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Constants.kWhiteColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Constants.kWhiteColor.withOpacity(.8),
              ),
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: Constants.kWhiteColor.withOpacity(.8),
                  )),
            ),
          ),
          const Icon(
            Icons.close,
            color: Constants.kWhiteColor,
          ),
        ],
      ),
    );
  }
}
