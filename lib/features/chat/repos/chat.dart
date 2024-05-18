import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:programming_course/features/authentication/model/user.dart';
import 'package:programming_course/features/chat/model/chat_model.dart';

import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../model/chat_admin_model.dart';

class ChatRepository {
  final _db = FirebaseFirestore.instance.collection('Chats');
  final _dbUser = FirebaseFirestore.instance.collection('Users');
  final auth = FirebaseAuth.instance;
  final message = TextEditingController();

  Future<void> sendMessageByUser(ChatModel chatData) async {
    try {
      await _db.add(chatData.toJson());
      resetFormField();
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<void> sendMessageByAdmin(AdminChatModel chatData) async {
    try {
      await _db.add(chatData.toJson());
      resetFormField();
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<List<dynamic>> fetchChatMessage(String userId) async {
    try {
      final resultSnap = await _db
          .orderBy('createdMsg', descending: true)
          .where('recevierUserId', isEqualTo: userId)
          .where('userId', isEqualTo: userId)
          .get();

      if (resultSnap.docs.isNotEmpty) {
        return resultSnap.docs.map((doc) {
          if (doc.data()['isSendByUser'] != null) {
            return ChatModel.fromSnapShot(doc);
          } else {
            return AdminChatModel.fromSnapShot(doc);
          }
        }).toList();
      }
      return [];
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Stream<List<dynamic>> fetchChatData() {
    try {
      return _db
          .orderBy('createdMsg', descending: true)
          .snapshots()
          .map((documentSnap) {
        return documentSnap.docs.map((doc) {
          if (doc.data().isNotEmpty) {
            if (doc.data()['isSendByUser'] != null) {
              return ChatModel.fromSnapShot(doc);
            } else {
              return AdminChatModel.fromSnapShot(doc);
            }
          } else {
            return [];
          }
        }).toList();
      });
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<List<UserModel>> chatUsers() async {
    try {
      final users = await _db.where('isSendByUser', isEqualTo: true).get();
      final List<UserModel> userData = [];
      if (users.docs.isNotEmpty) {
        final userIDs = users.docs.map((doc) => doc.data()['userId']).toSet();
        for (var userId in userIDs) {
          final result = await _dbUser.doc(userId).get();
          userData.add(UserModel.fromSnapshot(result));
        }
      }
      return userData;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<String> uploadImage(
    String path,
    XFile imageFile,
  ) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(imageFile.name);
      await ref.putFile(File(imageFile.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<String> uploadDocFile(
    String path,
    XFile docFile,
  ) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(docFile.name);
      await ref.putFile(File(docFile.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  Future<String> downloadFile(String fileName) async {
    try {
      final reference = FirebaseStorage.instance.ref('Chat/docFile/$fileName');

      final directory = await path.getTemporaryDirectory();
      final localFile = File('${directory.path}/$fileName');

      final downloadTask = reference.writeToFile(localFile);
      await downloadTask.whenComplete(() {});
      return localFile.path;
    } catch (e) {
      throw 'Error downloading file:';
    }
  }

  void resetFormField() {
    message.clear();
  }
}
