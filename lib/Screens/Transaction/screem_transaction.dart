import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/db/transaction/transaction_db.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/models/trnsaction/transaction_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ScreenTransction extends StatelessWidget {
  const ScreenTransction({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.TransactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: newList.length,
          itemBuilder: (ctx, index) {
            final _value = newList[index];
            return Slidable(
              key: Key(_value.id!),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      TransactionDB.instance.deleteTransaction(_value.id!);
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                  )
                ],
              ),
              child: Card(
                elevation: 0,
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _value.type == CategoryType.income
                          ? Colors.green
                          : Colors.red,
                      radius: 50,
                      child: Text(
                        parseDate(_value.date),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    title: Text('RS ${_value.amount}'),
                    subtitle: Text(_value.category.name)),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _spliteDate = _date.split('  ');
    return '${_spliteDate.last}\n${_spliteDate.first}';
    //  return '${date.day}\n${date.month}';
  }
}
