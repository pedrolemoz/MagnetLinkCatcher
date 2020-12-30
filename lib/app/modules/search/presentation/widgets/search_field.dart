import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:unicons/unicons.dart';

import '../controllers/search_page_controller.dart';
import '../pages/search_page.dart';

class SearchField extends StatelessWidget {
  final SearchPageController controller;
  final bool isHero;

  const SearchField({this.controller, this.isHero});

  @override
  Widget build(BuildContext context) {
    void search() async {
      await controller.performSearch(controller.searchTextFieldController.text);

      if (context.findAncestorWidgetOfExactType<SearchPage>() != null) {
        Modular.navigator.pushReplacementNamed('/result');
      }
    }

    final widget = Container(
      constraints: BoxConstraints(maxWidth: 584),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        color: Color(0xFFF7F7F7),
        child: TextField(
          controller: controller.searchTextFieldController,
          textInputAction: TextInputAction.search,
          textCapitalization: TextCapitalization.sentences,
          enableSuggestions: true,
          enableInteractiveSelection: true,
          textAlign: TextAlign.center,
          showCursor: false,
          maxLines: 1,
          autocorrect: true,
          cursorColor: Color(0xFF5F6368),
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.w600),
          onSubmitted: (_) => search(),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: search,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  UniconsLine.search,
                  size: 24,
                  color: Color(0xFF5F6368),
                ),
              ),
            ),
            filled: true,
            fillColor: Color(0xFFF1F3F4),
            hoverColor: Color(0xFFF7F7F7),
            hintMaxLines: 1,
            hintText: 'Search for something',
            hintStyle: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
          ),
        ),
      ),
    );

    return isHero ? Hero(tag: 'SearchField', child: widget) : widget;
  }
}