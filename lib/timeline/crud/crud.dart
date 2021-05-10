import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
  Future<void> addData(blogData) async {
    print(blogData);

    FirebaseFirestore.instance
        .collection("posts")
        .add(blogData)
        .then((value) => print(value))
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await FirebaseFirestore.instance.collection("posts").get();
  }
}
