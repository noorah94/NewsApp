import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2_news_app/blocs/news/news_%20events.dart';
import 'package:t2_news_app/controllers/LocalStorageController.dart';
import 'package:t2_news_app/globals.dart';
import '../blocs/news/news_blocs.dart';
import '../blocs/news/news_states.dart';

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({super.key});

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String dropdownvalue = 'business';

  var items = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];

  getCatogeryValue() async {
    dropdownvalue = await getCategory();
    setState(() {
      dropdownvalue = dropdownvalue;
    });
  }

  @override
  void initState() {
    super.initState();
    getCatogeryValue();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBlocs, NewsStates>(
      builder: (context, state) => DropdownButton(
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) async {
          page = 1;
          await updateCategory(newValue!);
          setState(() {
            dropdownvalue = newValue;
          });
          BlocProvider.of<NewsBlocs>(context).add(ClearList());
          BlocProvider.of<NewsBlocs>(context).add(Read());
        },
      ),
    );
  }
}
