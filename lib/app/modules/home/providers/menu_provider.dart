import 'package:get/get.dart';

import '../menu_model.dart';

class MenuProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Menu.fromJson(map);
      if (map is List) return map.map((item) => Menu.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Menu?> getMenu(int id) async {
    final response = await get('menu/$id');
    return response.body;
  }

  Future<Response<Menu>> postMenu(Menu menu) async => await post('menu', menu);
  Future<Response> deleteMenu(int id) async => await delete('menu/$id');
}
