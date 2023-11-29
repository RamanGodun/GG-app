import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';

class DBmethods {
  late FirebaseFirestore firestore;
  late FirebaseStorage firebaseStorage;
  late CollectionReference adminCollection;
  late CollectionReference productsCollection;

  DBmethods() {
    firestore = FirebaseFirestore.instance;
    firebaseStorage = FirebaseStorage.instance;
    adminCollection = firestore.collection('admin');
    productsCollection = firestore.collection('products');
  }

  Future<List<T>?> fetchDataFromFirestore<T>({
    required String collectionName,
    String? docName,
    required T Function(Map<String, dynamic>) fromMapFunction,
  }) async {
    try {
      CollectionReference collection = firestore.collection(collectionName);
      if (docName != null) {
        DocumentSnapshot snapshot = await collection.doc(docName).get();
        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          return [fromMapFunction(data)];
        }
      } else {
        final querySnapshot = await collection.get();
        final List<Map<String, dynamic>> dataList = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        return dataList.map((data) => fromMapFunction(data)).toList();
      }
    } catch (error) {
      // print('Error in fetchDataFromFirestore: $error');
    }
    return null;
  }
}
