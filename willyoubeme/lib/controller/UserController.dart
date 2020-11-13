import 'package:willyoubeme/model/NonUser.dart';
import 'package:willyoubeme/model/user.dart';

import '../willyoubeme.dart';

class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> createUser(@Bind.body() NonUser nonUser) async {
    final query = Query<NonUser>(context)
    ..values.username = nonUser.username
    ..values.state = "Created";
    final userExist = await checkIfUserExist(username: nonUser.username);
    if(!userExist) {
      await query.insert();
      return Response.created("");
    }
    else{
      return Response.conflict(body: {"error": "User Already Exist"});
    }
  }

  @Operation.get('id')
  Future<Response> getUserById(@Bind.path('id') int id) async {
    final noUserQuery = Query<NonUser>(context)
      ..where((h) => h.id).equalTo(id);

    final nonUser = await noUserQuery.fetchOne();
    if(nonUser == null){
      return Response.notFound();
    }
    return Response.ok(nonUser);
  }

  Future<bool> checkIfUserExist({String username}) async {
    final nouser = Query<NonUser>(context)
      ..where((h) => h.username).equalTo(username);

    final query = await nouser.fetchOne();

    if(query == null)
      return false;
    return true;

  }
}