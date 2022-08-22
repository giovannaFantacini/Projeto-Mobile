import 'package:mobx/mobx.dart';
part 'MQTTAppState.g.dart';

class MQTTAppState = MQTTAppStateBase with _$MQTTAppState;

enum MQTTAppConnectionState { connected, disconnected, connecting, connectedSubscribed, connectedUnSubscribed }
abstract class MQTTAppStateBase with Store{
  

  @observable
  MQTTAppConnectionState _appConnectionState = MQTTAppConnectionState.disconnected;
  @observable
  String _receivedText = '';
  @observable
  String _historyText = '';
  @observable
  bool carregando = false;
  @observable
  bool hostLogado = false;
  @observable
  bool hostValidado = false;
  @observable
  String _updateTopic = "";

  @action
  void setUpdateTopic(String topic) {
     _updateTopic = topic;
  }

  @action
  void setReceivedText(String text) {
    _receivedText = text;
    _historyText += "\n" + _receivedText;
  }

  @action
  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
  }

  @action
  void clearText() {
    _historyText = "";
    _receivedText = "";
  }

  @action
  MQTTAppConnectionState appConnectionState(){
    return this._appConnectionState;
  }

  @computed
  String get getReceivedText => _receivedText;
  @computed
  String get getHistoryText => _historyText;
  @computed
  String get getUpdateTopic => _updateTopic;
  @computed
  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
  


  @action
  Future <void> carregar() async{

    carregando = true;

    await Future.delayed(Duration(seconds: 3));

    carregando = false;
  }


}