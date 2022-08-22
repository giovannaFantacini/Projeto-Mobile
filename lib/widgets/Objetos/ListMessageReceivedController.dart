import 'package:mobx/mobx.dart';
import 'package:projeto_mobile/widgets/Objetos/MessageReceived.dart';
part 'ListMessageReceivedController.g.dart';

class ListMessageReceivedController = ListMessageReceivedControllerBase with _$ListMessageReceivedController;

abstract class ListMessageReceivedControllerBase with Store {
 
  @observable
  String _title = " ";
  @observable
  String _topic = " ";
  @observable
  String _message = " ";
 
  void setTopic( value) => this._topic = value;

  void setTitle(String value) => this._title = value;

  void setMessage(String value) => this._message = value;

  @observable
  ObservableList<MessageReceived> listaItens = ObservableList();

  @action
  void adicionarItem(){
      listaItens.add(MessageReceived(this._title, this._topic, this._message));
      print(listaItens);
  }

}