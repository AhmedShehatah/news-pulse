import '../../../core/errors/base_error.dart';

class TimeOutError extends BaseError {
  TimeOutError() : super('Connection Timeout');
}
