import 'package:dio/dio.dart';

import '../model/result_list_product.dart';
import '../values/app_url.dart';

class ProductService {
  Future<ResultListProduct> getListProduct(
      int brandId, int cateloryId, int pageNum, int pageSize) async {
    Map<String, int> params = {
      "brandId": brandId,
      "cateloryId": cateloryId,
      "pageNum": pageNum,
      "pageSize": pageSize
    };
    try {
      var response = await Dio().get('${AppURL.appURL}api/product/list',
          queryParameters: params,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1LGN1b25ncW4yMzVAZ21haWwuY29tIiwiaXNzIjoiQ29kZUphdmEiLCJpYXQiOjE2Njk0ODY4MDMsImV4cCI6MTY2OTU3MzIwM30.gGptvH64B_PlcaU9xNu-Db79KeguXk88LWAziYQOboZ8jB8RlKbWuP_th51CnwZzkgaLfHudAzm5kL7aD28F9g"
          }));
      return ResultListProduct.fromJson(response.data);
    } on DioError catch (e) {
      return ResultListProduct();
    }
  }
}
