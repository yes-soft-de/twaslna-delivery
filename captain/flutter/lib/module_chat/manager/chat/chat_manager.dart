import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_captain/module_chat/model/chat/chat_model.dart';
import 'package:twaslna_captain/module_chat/repository/chat/chat_repository.dart';

@injectable
class ChatManager {
  final ChatRepository _chatRepository;

  ChatManager(this._chatRepository);

  Stream<QuerySnapshot> getMessages(String chatRoomID) {
    return _chatRepository.requestMessages(chatRoomID);
  }

  void sendMessage(String chatRoomID, ChatModel chatMessage) {
    _chatRepository.sendMessage(chatRoomID, chatMessage);
  }

  void sendNotification(String chatRoomID, bool support, bool feedBack) {
    _chatRepository.sendNotification(chatRoomID, support, feedBack);
  }
}