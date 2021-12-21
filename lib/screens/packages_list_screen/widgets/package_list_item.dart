import 'package:flutter/material.dart';
import 'package:furgonetka/models/package.dart';
import 'package:furgonetka/screens/package_details_screen/package_details_screen.dart';

class PackageListItem extends StatelessWidget {
  final Package package;

  const PackageListItem(this.package, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(package.service ?? "Brak danych o przewozniku..."),
      subtitle: Text(
        package.parcels != null && package.parcels!.isNotEmpty
            ? package.parcels![0].packageNo ?? "Brak numery przesyłki..."
            : "Brak przesyłek...",
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackageDetailsScreen(package),
          ),
        );
      },
    );
  }
}
