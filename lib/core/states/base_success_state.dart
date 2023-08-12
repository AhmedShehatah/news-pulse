import 'base_states.dart';

class BaseSuccessState<DATA> extends BaseState {
  final DATA? _data;

  DATA? get data {
    assert(_data != null);
    return _data;
  }

  const BaseSuccessState([this._data]);
}
