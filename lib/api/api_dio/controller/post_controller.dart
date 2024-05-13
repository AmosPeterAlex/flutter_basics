
import 'package:flutter_starting_project/api/api_dio/service/dio_service.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
// import 'package:sept_b2_flutter/api/api_dio/service/dio_service.dart';

import '../model/post_model.dart';

class PostController extends GetxController{

  RxList postList=RxList(); //makes postList observable
  RxBool isLoading=true.obs;
  RxBool isInternetConnected=true.obs;
  RxBool isScrollDown=false.obs;

  var url="https://jsonplaceholder.typicode.com/posts";
  var itemCtrl=ItemScrollController();//to perform scroll actions in positioned scrollable list

  checkInternetConnected()async{
    isInternetConnected.value= await InternetConnectionChecker().hasConnection;
  }

  void getPost() async{
    checkInternetConnected();
    isLoading.value=true;
    var response=await DioService().fetchPost(url);
    if(response.statusCode==200){
      response.data.forEach((element){PostModel.fromJson(element);});
    }
  }

}