
import '../api/end_ponits.dart';

class ErrorResponseModel {
  final int status;
  final String errorMessage;

  ErrorResponseModel({required this.status, required this.errorMessage});
  factory ErrorResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorResponseModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.errorMessage],
    );
  }
}

/*
Response model from API 
factory constructor is used to handel response json data from api
must be edited depends on the response on postman (json model )

*/