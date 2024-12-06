import 'package:api/Models/products/Products_Response.dart';

abstract class All_Cubit_States {}

final class User_Initial_Login extends All_Cubit_States {}
final class User_Login_Loading extends All_Cubit_States {}
final class User_Login_Sucess extends All_Cubit_States {}
final class User_Login_Failed extends All_Cubit_States {
  String Error_MEssage_Whiel_Login;
User_Login_Failed({required this.Error_MEssage_Whiel_Login});
}


final class User_Initial_Registeration extends All_Cubit_States {}
final class User_Registeration_Loading extends All_Cubit_States {}
final class User_Registeration_Sucess extends All_Cubit_States {}
final class User_Registeration_Failed extends All_Cubit_States {
  String Error_MEssage_Whiele_Register;

  User_Registeration_Failed({required this.Error_MEssage_Whiele_Register});

}

class ProductInitial extends All_Cubit_States {}
class ProductLoading extends All_Cubit_States {}
class ProductLoadedSucessfully extends All_Cubit_States {
  final List<Product> products;
  ProductLoadedSucessfully({required this.products});
}
class ProductFailed extends All_Cubit_States {
  final String ErrorInLoadingProducts;
  ProductFailed({required this.ErrorInLoadingProducts});
}


