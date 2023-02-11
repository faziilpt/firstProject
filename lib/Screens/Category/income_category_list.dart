import 'package:flutter/material.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/models/category/category_model.dart';

class IncomCategoryList extends StatelessWidget {
  const IncomCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().incomeCategoryListListener,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final Category = newList[index];
                return Card(
                  elevation: 0,
                  child: ListTile(
                    title: Text(Category.name),
                    trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(Category.id);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newList.length);
        });
  }
}
