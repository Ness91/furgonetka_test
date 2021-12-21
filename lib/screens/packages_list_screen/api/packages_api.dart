import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:furgonetka/config/api_helper.dart';
import 'package:furgonetka/models/package.dart';
import 'package:furgonetka/providers/packages_provider.dart';
import 'package:provider/provider.dart';

class PackagesApi {
  final BuildContext context;

  PackagesApi(this.context);

  Future<bool> get() async {
    try {
      Dio dio = Dio();

      Response response = await dio.get(
        ApiHelper.getPackages,
        options: Options(
          headers: {
            ApiHelper.authHeader: ApiHelper.authValue,
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        if (response.data is List<dynamic>) {
          var packagesProvider =
              Provider.of<PackagesProvider>(context, listen: false);
          List<Package> packages = [];

          for (var d in response.data) {
            if (d is Map<String, dynamic>) {
              packages.add(Package.fromJson(d));
            }
          }

          packagesProvider.setPackages(packages);
        }
        return true;
      } else {
        return false;
      }
    } on DioError catch (_) {
      return false;
    }
  }
}
