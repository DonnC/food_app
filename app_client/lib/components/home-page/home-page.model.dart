import 'package:momentum/momentum.dart';

import 'package:restaurant_app/models/index.dart';

import 'index.dart';

class HomePageModel extends MomentumModel<HomePageController> {
  HomePageModel(
    HomePageController controller, {
    this.selectedIndex,
    this.products,
    this.loading,
  }) : super(controller);

  final int selectedIndex;
  final List<Product> products;
  final bool loading;

  @override
  void update({
    int selectedIndex,
    List<Product> products,
    bool loading,
  }) {
    HomePageModel(controller,
            selectedIndex: selectedIndex ?? this.selectedIndex,
            products: products ?? this.products,
            loading: loading ?? this.loading)
        .updateMomentum();
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedIndex': selectedIndex,
      'loading': loading,
      'products': products?.map((x) => x?.toMap())?.toList(),
    };
  }

  HomePageModel fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return HomePageModel(
      controller,
      loading: map['loading'],
      selectedIndex: map['selectedIndex'],
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
    );
  }
}
