import '../willyoubeme.dart';

class NonUser extends ManagedObject<_NonUser> implements _NonUser {}

class _NonUser {
  @primaryKey
  int id;

  @Column(nullable: false)
  String username;


  @Column(nullable: true)
  String state;
}