
class Messages {

  String _title = " ";
  String _topic = " ";
 String get title => this._title;

 set title(String value) => this._title = value;

  get topic => this._topic;

 set topic( value) => this._topic = value;

  Messages(String title, String topic){
    this._title = title;
    this._topic = topic;
  }


}