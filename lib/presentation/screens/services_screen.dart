import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../domain/services_view_provider.dart';
import '../widgets/service_widget.dart';
import '../widgets/text_widget.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var servicesList = Provider.of<ServicesViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: TextWidget(
            text: 'Services',
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        servicesList.isloading
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 100,
                ),
              )
            : SizedBox(
                height: mediaQuery.height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: servicesList.services.length,
                  itemBuilder: (context, index) => ServiceWidget(
                    priceAfterDiscount:
                        servicesList.services[index].priceAfterDiscount,
                    recommended: servicesList.services[index].recommended,
                    discount: servicesList.services[index].discount,
                    averageRating: servicesList.services[index].averageRating,
                    completedSalesCount:
                        servicesList.services[index].completedSalesCount,
                    price: servicesList.services[index].price,
                    mainImage: servicesList.services[index].mainImage,
                    title: servicesList.services[index].title,
                  ),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: TextWidget(
            text: 'Popular Services',
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        servicesList.isloading
            ? Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 100,
                ),
              )
            : SizedBox(
                height: mediaQuery.height / 4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: servicesList.popularServices.length,
                  itemBuilder: (context, index) => ServiceWidget(
                    priceAfterDiscount:
                        servicesList.popularServices[index].priceAfterDiscount,
                    recommended:
                        servicesList.popularServices[index].recommended,
                    discount: servicesList.popularServices[index].discount,
                    averageRating:
                        servicesList.popularServices[index].averageRating,
                    completedSalesCount:
                        servicesList.popularServices[index].completedSalesCount,
                    price: servicesList.popularServices[index].price,
                    mainImage: servicesList.popularServices[index].mainImage,
                    title: servicesList.popularServices[index].title,
                  ),
                ),
              ),
      ],
    );
  }
}
