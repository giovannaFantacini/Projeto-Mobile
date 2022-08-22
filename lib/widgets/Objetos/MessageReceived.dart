
class MessageReceived {

  String _title = " ";
  String _topic = " ";
  String _message = " ";
 String get message => this._message;

 set message(String value) => this._message = value;
 String get title => this._title;

 set title(String value) => this._title = value;

  get topic => this._topic;

 set topic( value) => this._topic = value;

  MessageReceived(String title, String topic, String message){
    this._title = title;
    this._topic = topic;
    this._message = message;
  }


}