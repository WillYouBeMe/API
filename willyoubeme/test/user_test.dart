import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("POST /user returns 201 User Created", () async {
    expectResponse(await harness.agent.post("/user", body: {"username": "bob@stablekernel.com",}), 201);
  });

  test("After create User, Get user ID", () async {
    await harness.agent.post("/user", body: {"username": "bob@stablekernel.com",});
    final getResponse = await harness.agent.get("/user/1",);
    expectResponse(getResponse, 200, body : {
      "id": 1,
      "username": "bob@stablekernel.com",
      "state" : "Created"
    });
  });


 /* test("After create User, set User State", () async {
    await harness.agent.post("/user", body: {"username": "bob@stablekernel.com",});
    final putResponse = await harness.agent.put("/user/1", body: {"state" : "Deleted",});
    expectResponse(putResponse, 200, body : {
      "id": 1,
      "username": "bob@stablekernel.com",
      "state" : "Deleted"
    });
  });*/

  test("After create User, Get user Already Exist", () async {
    await harness.agent.post("/user", body: {"username": "bob@stablekernel.com",});
    final postResponse = await harness.agent.post("/user", body: {"username": "bob@stablekernel.com",});
    expectResponse(postResponse, 409, body : {
      "error": "User Already Exist",
    });
  });



}
