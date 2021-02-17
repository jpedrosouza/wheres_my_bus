import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wheres_my_bus/database/models/user.model.dart';

class UserController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// Add user in Database.
  Future createUser(UserModel userModel, userId) async {
    await _firebaseFirestore.collection('users').doc(userId).set({
      'email': userModel.email,
      'name': userModel.name,
      'driver': false,
    });
  }

  /// Request driver status for user.
  Future registerDriver(userId, name, cpf) async {
    DocumentReference userRef =
        _firebaseFirestore.collection('users').doc(userId);

    await _firebaseFirestore
        .collection('registration_requests')
        .doc(userId)
        .set({
      'user_id': userId,
      'user_ref': userRef,
      'name': name,
      'cpf': cpf,
    });
  }
}
