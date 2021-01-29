import 'package:momentum/momentum.dart';
import 'package:restaurant_app/models/index.dart';

// product service to make api calls to backend
class ProductService extends MomentumService {
  Future<List<Product>> fetchAllProducts() async {
    await Future.delayed(Duration(seconds: 5));
    
    return List<Product>.generate(
      10,
      (index) => Product(
        calories: 130,
        id: index,
        name: 'Sake Roll',
        description:
            'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
        price: 14.50,
        minTime: 15,
        maxTime: 20,
        votes: 4.9,
        mass: 350,
        category: 'Sushi',
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
        calories: 130,
        id: index,
        name: 'Sake Roll',
        description:
            'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
        price: 14.50,
        minTime: 15,
        maxTime: 20,
        votes: 4.9,
        mass: 350,
        category: category,
        imageUrl: 'assets/images/fire.png',
        contents: 'Kinoa, kani, avocado',
      ),
    );
  }

  Future<Product> fetchProductById(int id) async {
    await Future.delayed(Duration(seconds: 5));

    return Product(
      calories: 130,
      id: id,
      name: 'Sake Roll',
      description:
          'Sake is produced by a leavening process and converting starch into sugar. It may sound simple but the entire process can take a few months',
      price: 14.50,
      minTime: 15,
      maxTime: 20,
      votes: 4.9,
      mass: 350,
      category: 'Sushi',
      imageUrl: 'assets/images/fire.png',
      contents: 'Kinoa, kani, avocado',
    );
  }
}
