import 'package:app_server/models/index.dart';
import 'package:aqueduct/aqueduct.dart';
import 'package:app_server/app_server.dart';

class ProductController extends ResourceController {
  ProductController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> addProduct(@Bind.body(ignore: ["id"]) Product newProduct) async {
    final query = Query<Product>(context)
                    ..values = newProduct;

    final insertedProduct = await query.insert();

    return Response.ok(insertedProduct);
  }

  @Operation.get()
  Future<Response> getAllProducts() async {
    final productQuery = Query<Product>(context);
    final products = await productQuery.fetch();

    return Response.ok(products);
  }

  @Operation.get('id')
  Future<Response> getProductById(@Bind.path('id') int id) async {
    final productQuery = Query<Product>(context)
                          ..where((_product) => _product.id)
                          .equalTo(id);

    final product = await productQuery.fetchOne();

    if(product == null) {
      return Response.notFound();
    }

    return Response.ok(product);
  }

  @Operation.get('category')
  Future<Response> getProductsByCategory({@Bind.query('category') String category}) async {
    final productQuery = Query<Product>(context);

    if(category != null) {
      productQuery.where((_product) => _product.category)
          .equalTo(category);
    }

    final productCategory = await productQuery.fetch();

    if (productCategory == null) {
      return Response.notFound();
    }

    return Response.ok(productCategory);
  }
}