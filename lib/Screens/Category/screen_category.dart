import 'package:flutter/material.dart';
import 'package:money_management/Screens/Category/epense_category_list.dart';
import 'package:money_management/Screens/Category/income_category_list.dart';
import 'package:money_management/db/category/category_db.dart';

class ScreenCatrgory extends StatefulWidget {
  const ScreenCatrgory({super.key});

  @override
  State<ScreenCatrgory> createState() => _ScreenCatrgoryState();
}

class _ScreenCatrgoryState extends State<ScreenCatrgory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'INCOME'),
              Tab(
                text: 'EXPENSES',
              )
            ]),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: const [
            IncomCategoryList(),
            ExpenseCategoryList(),
          ],
        ))
      ],
    );
  }
}
