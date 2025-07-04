
import 'package:mvvm_provider/data/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.message,this.data);

  ApiResponse.loading(): status=Status.LOADING;
  ApiResponse.completed():status=Status.COMPLETED;
  ApiResponse.error():status=Status.ERROR;
  @override
  String toString(){
    return 'status : $status \n message : $message \n data: $data';
  }

}