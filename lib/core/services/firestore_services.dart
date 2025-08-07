
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:roadshare/core/services/database_services.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
      
    }else{   
       await firestore.collection(path).add(data);
    }
  }
  
  @override
  Future<Map<String, dynamic>> getData(
    {required String path, String? documentId}) async{
    var data= await firestore.collection(path).doc(documentId).get();
    return data.data() as Map<String, dynamic>;
  }
  
  @override
  Future<bool> ifDataExists({required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }
  
  @override
  Future<void> updateData({required String path, required String documentId, required Map<String, dynamic> data}) async {
    await firestore.collection(path).doc(documentId).update(data);
  }
}