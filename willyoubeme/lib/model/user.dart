import 'package:aqueduct/managed_auth.dart';


import '../willyoubeme.dart';



class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {
}

class _User extends ResourceOwnerTableDefinition {

}