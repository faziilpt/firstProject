import 'package:flutter/material.dart';
import 'package:money_management/Screens/Category/category_add_popup.dart';
import 'package:money_management/Screens/Category/screen_category.dart';
import 'package:money_management/Screens/Home/widgets/BottomNavigation.dart';
import 'package:money_management/Screens/Transaction/screem_transaction.dart';
import 'package:money_management/Screens/add_transaction/screen_add_transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static ValueNotifier<int> selectIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransction(),
    ScreenCatrgory(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectIndexNotifier.value == 0) {
            print('add traansaction');
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            print('add category');

            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
