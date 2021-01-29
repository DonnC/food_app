import 'package:app_server/app_server.dart';
import 'package:aqueduct/managed_auth.dart';
// db: food_app
// user: food_app_user
// pwd: app_password
import 'index.dart';

class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {
  // add transient property
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {
  @Column(unique: true)
  String email;

  @Column(unique: true)
  String contact;

  @Column()
  String address;

  ManagedSet<Product> favorites;

  // TODO: Add managed set of orders
  // TODO: Notifications too
  // TODO: Payment methods
}