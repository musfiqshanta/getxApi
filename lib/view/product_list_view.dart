import 'package:get/get.dart';
import 'package:getxapiproject/model/api_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/auth.dart';
import 'dart:convert' as convert;

import '../model/album_model.dart';

// class ProductView extends GetxController {
//   //  final apiClass=Authenticaiton();
//   var productList = <Welcome>[].obs;
//   var isLoading = true.obs;
//   @override
//   void onInit() {
//     fetchProduct();
//     print(productList.length);
//     super.onInit();
//   }

//   final auth = Authenticaiton();
//   void fetchProduct() async {
//     try {
//       isLoading(true);
//       var products = await Authenticaiton().fetchProduct();
//       print(products);
//       if (products != null) {
//         productList.assignAll(products);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }

class Controller extends GetxController {
  var photoList = <AlbumModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbumData();
  }

  Future<RxList?> fetchAlbumData() async {
    final response = await http.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      for (var jsonResponses in jsonResponse) {
        print(jsonResponses);

        var model = AlbumModel.fromJson(jsonResponses);
        photoList.add(model);
      }

      //  print(jsonResponse[1]['brand']);
      isLoading.value = false;
      //update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
