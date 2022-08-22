import 'package:mobx/mobx.dart';
import 'Botao.dart';
part 'ListButtonController.g.dart';

class ListButtonController = ListButtonControllerBase with _$ListButtonController;

abstract class ListButtonControllerBase with Store {
 
  @observable
  String _title = " ";
  @observable
  String _topic = " ";
  @observable
  String _on = " ";
  @observable
  String _off = " ";
  
  void setTopic( value) => this._topic = value;

  void setOn( value) => this._on = value;

  void setOff( value) => this._off = value;

  void setTitle(String value) => this._title = value;


  @observable
  ObservableList<Botao> listaItens = ObservableList();

  @action
  void adicionarItem(){
      listaItens.add(Botao(this._title, this._topic, this._on, this._off));
      print(listaItens);
  }

}