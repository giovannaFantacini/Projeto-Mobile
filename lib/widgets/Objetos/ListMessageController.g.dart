// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListMessageController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListMessageController on ListMessageControllerBase, Store {
  late final _$_titleAtom =
      Atom(name: 'ListMessageControllerBase._title', context: context);

  @override
  String get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  late final _$_topicAtom =
      Atom(name: 'ListMessageControllerBase._topic', context: context);

  @override
  String get _topic {
    _$_topicAtom.reportRead();
    return super._topic;
  }

  @override
  set _topic(String value) {
    _$_topicAtom.reportWrite(value, super._topic, () {
      super._topic = value;
    });
  }

  late final _$listaItensAtom =
      Atom(name: 'ListMessageControllerBase.listaItens', context: context);

  @override
  ObservableList<Messages> get listaItens {
    _$listaItensAtom.reportRead();
    return super.listaItens;
  }

  @override
  set listaItens(ObservableList<Messages> value) {
    _$listaItensAtom.reportWrite(value, super.listaItens, () {
      super.listaItens = value;
    });
  }

  late final _$ListMessageControllerBaseActionController =
      ActionController(name: 'ListMessageControllerBase', context: context);

  @override
  void adicionarItem() {
    final _$actionInfo = _$ListMessageControllerBaseActionController
        .startAction(name: 'ListMessageControllerBase.adicionarItem');
    try {
      return super.adicionarItem();
    } finally {
      _$ListMessageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaItens: ${listaItens}
    ''';
  }
}
