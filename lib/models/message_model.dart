import '../constants.dart';

class Message {
  final String text;
  final String id;
  // var date;
  Message({required this.id, required this.text});
  factory Message.fromjson(josndata) {
    return Message(
      text: josndata[kMessage],
      id: josndata[kId],
    );
  }
}
