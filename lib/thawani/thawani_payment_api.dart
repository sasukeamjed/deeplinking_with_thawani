import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:ui_store_design/errors/bad_request_exeption.dart';
// import 'package:ui_store_design/errors/conflict_exeption.dart';
// import 'package:ui_store_design/errors/deadline_exceeded_exception.dart';
// import 'package:ui_store_design/errors/internal_server_error_exception.dart';
// import 'package:ui_store_design/errors/no_internet_connection_exception.dart';
// import 'package:ui_store_design/errors/not_found_exception.dart';
// import 'package:ui_store_design/errors/unauthorized_exception.dart';
// import 'package:ui_store_design/models/vendor_model.dart';


// class VendorsList extends StateNotifier<List<Vendor>?> {
class PaymentsAPI{
  final baseUrl = "https://uatcheckout.thawani.om/api/v1";
  // final baseUrl = "https://checkout.thawani.om/api/v1";

  late Dio _dio;

  PaymentsAPI(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(milliseconds: 15000), // 15 seconds
      connectTimeout: const Duration(milliseconds: 15000),
      sendTimeout: const Duration(milliseconds: 15000),
      //This is should be the solution for DioError [DioErrorType.response]: Http status error [415]
      contentType: 'application/json',
      headers: {
        // "Connection": "Keep-Alive",
        // "Content-Type" : "application/json",
        // 'thawani-api-key' : 'dhdf5cCiniAHixKj3kgoZKqByvopP9',
        ///This is test keys
        'thawani-api-key' : 'rRQ26GcsZzoEhbrP2HZvLYDbn9C9et',
      },
    ));


  }

  generateSessionRequest(Map sessionBody) async{
    print('Generating a payment Session');

    Response responseUrl;

    try {
      // state = AuthLoading();
      print('this is body => $sessionBody');
      responseUrl = await _dio.post("/checkout/session",
        data: sessionBody,
      );


      if(responseUrl.statusCode != 200 || responseUrl.data == null){
        print("Payment Failed");
        // state = AuthError("Login Failed") ;
        return;
      }
      // print("This is the successful payment response data : ${responseUrl.data}");

      return responseUrl.data;

      // state = AuthLoaded(UserModel.fromJson(response?.data));
    } catch (e) {
      // state = AuthError(e.toString());
      print("this is the failed payment response with error : $e}");
    }
  }


}




