import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:willyoubeme/channel.dart';

export 'package:aqueduct_test/aqueduct_test.dart';
export 'package:test/test.dart';
export 'package:aqueduct/aqueduct.dart';

class Harness extends TestHarness<WillYouBeMeChannel> with TestHarnessAuthMixin<WillYouBeMeChannel>, TestHarnessORMMixin {
  @override
  Future onSetUp() async {
    await resetData();

  }

  @override
  Future onTearDown() async {

  }

  @override
  ManagedContext get context => channel.context;

  @override
  AuthServer get authServer => channel.authServer;

  Agent publicAgent;


}
