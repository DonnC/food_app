import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';
import 'package:restaurant_app/utils/index.dart';

// product service to make api calls to backend
class ProductService extends MomentumService {
  Future<List<Product>> fetchAllProducts() async {
    await Future.delayed(Duration(seconds: 5));

    return List<Product>.generate(
      30,
      (index) => Product(
        calories: generateCalories(),
        id: generateId(),
        name: 'Sake Roll',
        description:
            'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
        price: generatePrice(),
        minTime: generateTime(),
        maxTime: generateTime(),
        votes: generateVotes(),
        mass: generateMass(),
        category: generateCategory(),
        imageUrl: 'assets/images/fire.png',
        contents: 'Kinoa, kani, avocado',
      ),
    );
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    await Future.delayed(Duration(seconds: 5));

    return List<Product>.generate(
      7,
      (index) => Product(
        calories: generateCalories(),
        id: generateId(),
        name: 'Sake Roll',
        description:
            'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
        price: generatePrice(),
        minTime: generateTime(),
        maxTime: generateTime(),
        votes: generateVotes(),
        mass: generateMass(),
        category: generateCategory(),
        imageUrl: 'assets/images/fire.png',
        contents: 'Kinoa, kani, avocado',
      ),
    );
  }

  Future<Product> fetchProductById(int id) async {
    await Future.delayed(Duration(seconds: 5));

    return Product(
      calories: generateCalories(),
      id: generateId(),
      name: 'Sake Roll',
      description:
          'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
      price: generatePrice(),
      minTime: generateTime(),
      maxTime: generateTime(),
      votes: generateVotes(),
      mass: generateMass(),
      category: generateCategory(),
      imageUrl: 'assets/images/fire.png',
      contents: 'Kinoa, kani, avocado',
    );
  }
}
