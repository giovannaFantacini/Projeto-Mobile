

class Botao {

  String _title= " ";
  String _topic = " ";
  String _on = " ";
  String _off = " ";
  bool _state = false;


   Botao(String titulo, String topic, String on, String off){
    this._title = titulo;
    this._topic = topic;
    this._on = on;
    this._off = off;
  }

   bool get state => this._state;

  set state(bool value) => this._state = value;
  String get title => this._title;

  set title(String value) => this._title = value;

    get topic => this._topic;

  set topic( value) => this._topic = value;

    get on => this._on;

  set on( value) => this._on = value;

    get off => this._off;

  set off( value) => this._off = value;

}