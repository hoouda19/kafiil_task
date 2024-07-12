import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import 'package:kafiil_taskt/presentation/style/colors.dart';
import '../widgets/text_widget.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int currentPage = 1;
  final NumberPaginatorController _controller = NumberPaginatorController();
  var selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          text: 'Countries',
          size: 20,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: mediaQuery.width / 6,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  height: mediaQuery.height / 20,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextWidget(
                        text: 'Country',
                        size: 13,
                      ),
                      TextWidget(
                        text: 'Capital',
                        size: 13,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.withOpacity(0.3),
                  );
                },
                itemCount: 8,
                itemBuilder: (context, index) => const SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextWidget(
                        text: 'Egypt',
                        size: 13,
                        weight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: 'Cairo',
                        size: 13,
                        weight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        NumberPaginator(
          controller: _controller,
          numberPages: 10,
          config: NumberPaginatorUIConfig(
            buttonSelectedBackgroundColor: mainColor,
            buttonUnselectedBackgroundColor: Colors.white,
            buttonShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          onPageChange: (int index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ],
    );
  }
}
