import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2_news_app/controllers/LocalStorageController.dart';
import '../blocs/news/news_ events.dart';
import '../blocs/news/news_blocs.dart';
import '../blocs/news/news_states.dart';
import '../controllers/CountriesController.dart';

class CountriesDropdown extends StatefulWidget {
  const CountriesDropdown({super.key});

  @override
  State<CountriesDropdown> createState() => _CountriesDropdownState();
}

class _CountriesDropdownState extends State<CountriesDropdown> {
  String dropdownvalue = 'ar';
  var items = ['ar'];

  Future<void> readJson() async {
    List<String> newItems = await readCountriesJson();

    setState(() {
      items = newItems;
    });
  }

  getCountryValue() async {
    dropdownvalue = await getCountry();
    setState(() {
      dropdownvalue = dropdownvalue;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    getCountryValue();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBlocs, NewsStates>(
      builder: (context, state) => DropdownButton(
        value: dropdownvalue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) async {
          await updateCountry(newValue!);
          BlocProvider.of<NewsBlocs>(context).add(ClearList());
          BlocProvider.of<NewsBlocs>(context).add(Read());
          setState(() {
            dropdownvalue = newValue;
          });
        },
      ),
    );
  }
}
