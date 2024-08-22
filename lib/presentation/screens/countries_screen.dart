import 'package:flutter/material.dart';
import 'package:kafiil_taskt/domain/countries_provider.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:kafiil_taskt/presentation/style/colors.dart';
import 'package:provider/provider.dart';
import '../widgets/text_widget.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final NumberPaginatorController _controller = NumberPaginatorController();
  // int currentPage = 1;
  var selectedPageNumber = 1;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var CountriesList = Provider.of<CountriesProvider>(context);
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
              color: !CountriesList.isloading
                  ? Colors.white.withOpacity(0.8)
                  : null,
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: CountriesList.isloading
                ? [
                    Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.black,
                        size: 100,
                      ),
                    )
                  ]
                : [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12)),
                      child: SizedBox(
                        height: mediaQuery.height / 20,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: mediaQuery.width / 5,
                              right: mediaQuery.width / 5),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      itemCount: CountriesList.country.length,
                      itemBuilder: (context, index) => SizedBox(
                        height: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: mediaQuery.width / 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 5,
                                child: TextWidget(
                                  text: CountriesList.country[index].name,
                                  size: 11,
                                  weight: FontWeight.bold,
                                  textalign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                flex: 5,
                                child: TextWidget(
                                  text: CountriesList.country[index].capital,
                                  size: 11,
                                  weight: FontWeight.bold,
                                  textalign: TextAlign.left,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CountriesList.isloading
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 100,
                ),
              )
            : NumberPaginator(
                controller: _controller,
                numberPages: CountriesList.countrydetails['totalPages'],
                config: NumberPaginatorUIConfig(
                  buttonSelectedBackgroundColor: mainColor,
                  buttonUnselectedBackgroundColor: Colors.white,
                  buttonShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                onPageChange: (int index) {
                  setState(() {
                    CountriesList.countrydetails['currentPage'] = index;
                  });
                },
              ),
      ],
    );
  }
}
