import 'package:owomaniya/Enums/enum_values.dart';

enum PaymentStatus {
  Successfull,
  Failed,
}

final mediaTypeValues = EnumValues({
  "Successfull": PaymentStatus.Successfull,
  "Failed": PaymentStatus.Failed,
});
