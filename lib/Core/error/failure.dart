import 'package:equatable/equatable.dart';

abstract class Falure extends Equatable {
  final String message;

  const Falure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFalure extends Falure {
  const ServerFalure(super.message);
}

class DataBaseFalure extends Falure {
  const DataBaseFalure(super.message);
}
