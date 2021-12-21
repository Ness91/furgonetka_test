import 'package:flutter/material.dart';
import 'package:furgonetka/providers/packages_provider.dart';
import 'package:furgonetka/screens/packages_list_screen/widgets/package_list_item.dart';
import 'package:provider/provider.dart';

class PackagesListView extends StatelessWidget {
  const PackagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var packagesProvider = Provider.of<PackagesProvider>(context);

    return ListView.separated(
      itemCount: packagesProvider.packages.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) =>
          PackageListItem(packagesProvider.packages[index]),
    );
  }
}
