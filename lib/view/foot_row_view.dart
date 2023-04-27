import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_clock/enum/page_type.dart';
import 'package:simple_clock/model/menu_page.dart';
import 'package:simple_clock/provider/page_provider.dart';

class FootRow extends StatelessWidget {
  const FootRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MenuPage clock = MenuPageBuilder.getPage(PageType.clock)!;
    MenuPage timer = MenuPageBuilder.getPage(PageType.timer)!;
    MenuPage alarm = MenuPageBuilder.getPage(PageType.alarm)!;
    MenuPage stopwatch = MenuPageBuilder.getPage(PageType.stopwatch)!;

    double buttonWidth = MediaQuery.of(context).size.width/5;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        getMenuItem(clock, buttonWidth, Provider.of<PageProvider>(context), 1.30),
        getMenuItem(alarm, buttonWidth, Provider.of<PageProvider>(context), 1.0),
        getMenuItem(timer, buttonWidth, Provider.of<PageProvider>(context), 1.30),
        getMenuItem(stopwatch, buttonWidth, Provider.of<PageProvider>(context), 1.0)
      ],
    );
  }

  Widget getMenuItem(MenuPage page, buttonWidth, PageProvider provider, scale) {
    return Container(
      decoration: BoxDecoration(
        color: provider.getPage().pageType == page.pageType ? Colors.black12 : Colors.transparent,
        borderRadius: BorderRadius.circular(16)
      ),
      width: buttonWidth,
      child: TextButton(
        onPressed: () {
          provider.setPage(page);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(page.image, scale: scale,),
            Text(
              page.title,
              style: const TextStyle(
                color: Color(0xffeaecff),
                fontSize: 12
                ),
            )
          ],
        ),
      ),
    );
  }
}