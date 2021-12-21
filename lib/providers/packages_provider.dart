import 'package:flutter/material.dart';
import 'package:furgonetka/models/package.dart';

class PackagesProvider with ChangeNotifier {
  List<Package> _packages = [];

  List<Package> get packages {
    return [..._packages];
  }

  void setPackages(List<Package> packages) {
    _packages = packages;
    _packages.sort((a, b) => -a.dateTimeSend!.compareTo(b.dateTimeSend!));
    notifyListeners();
  }

  void clear() {
    _packages.clear();
  }
}
