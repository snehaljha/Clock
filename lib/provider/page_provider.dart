import 'package:flutter/material.dart';
import 'package:simple_clock/enum/page_type.dart';
import 'package:simple_clock/model/menu_page.dart';

class PageProvider extends ChangeNotifier {
  MenuPage _page = MenuPageBuilder.getPage(PageType.clock)!;

  MenuPage getPage() => _page;

  setPage(MenuPage page) {
    _page = page;
    notifyListeners();
  }
}