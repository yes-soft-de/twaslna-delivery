import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_chat/manager/chat/chat_manager.dart';
import 'package:twaslna_delivery/module_chat/model/chat/chat_model.dart';

@injectable
class ChatService {
  final ChatManager _chatManager;

  ChatService(this._chatManager);

  // This is Real Time, That is Why I went this way
  final PublishSubject<List<ChatModel>> _chatPublishSubject =
  new PublishSubject();

  Stream<List<ChatModel>> get chatMessagesStream => _chatPublishSubject.stream;

  void requestMessages(String chatRoomID) async {
    _chatManager.getMessages(chatRoomID).listen((event) {
      List<ChatModel> chatMessagesList = [];
      event.docs.forEach((element) {
        chatMessagesList.add(new ChatModel.fromJson(element.data() as Map<String,dynamic>));
      });

      _chatPublishSubject.add(chatMessagesList);
    });
  }

  void sendMessage(String chatRoomID, String msg,bool support,feedBack) async {
    FirebaseAuth auth =  FirebaseAuth.instance;
    User? user = auth.currentUser;
    ChatModel model = new ChatModel(
      msg: msg,
      sender: user!.uid,
      sentDate: DateTime.now().toString(),);
    _chatManager.sendMessage(chatRoomID, model);
    _chatManager.sendNotification(chatRoomID,support ,feedBack);
  }

  void dispose() {
    _chatPublishSubject.close();
  }
}