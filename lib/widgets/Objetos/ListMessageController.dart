import 'package:mobx/mobx.dart';
import 'package:projeto_mobile/widgets/Objetos/Messages.dart';
part 'ListMessageController.g.dart';

class ListMessageController = ListMessageControllerBase with _$ListMessageController;

abstract class ListMessageControllerBase with Store {
 
  @observable
  String _title = " ";
  @observable
  String _topic = " ";
  
  void setTopic( value) => this._topic = value;

  void setTitle(String value) => this._title = value;


  @observable
  ObservableList<Messages> listaItens = ObservableList();

  @action
  void adicionarItem(){
      listaItens.add(Messages(this._title, this._topic));
      print(listaItens);
  }

}