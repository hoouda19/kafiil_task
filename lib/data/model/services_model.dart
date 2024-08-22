class Service {
  final int id;
  final String mainImage;
  final double price;
  final double? discount;
  final double priceAfterDiscount;
  final String title;
  final double averageRating;
  final int completedSalesCount;
  final bool recommended;

  Service({
    required this.id,
    required this.mainImage,
    required this.price,
    this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      discount: json['discount'] != null
          ? (json['discount'] as num).toDouble()
          : null,
      priceAfterDiscount: json['price_after_discount'].toDouble(),
      title: json['title'],
      averageRating: json['average_rating'].toDouble(),
      completedSalesCount: json['completed_sales_count'],
      recommended: json['recommended'],
    );
  }
}
