import 'package:flutter/material.dart';
import 'package:furgonetka/models/package.dart';
import 'package:furgonetka/screens/package_details_screen/widgets/card_data_row.dart';
import 'package:furgonetka/screens/package_details_screen/widgets/card_title.dart';
import 'package:furgonetka/screens/package_details_screen/widgets/data_card.dart';
import 'package:intl/intl.dart';

class PackageDetailsScreen extends StatelessWidget {
  final Package package;
  const PackageDetailsScreen(this.package, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Szczegóły"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DataCard(
              children: [
                const CardTitle(title: "Dane ogólne"),
                CardDataRow(
                  title: "ID",
                  data: '${package.id ?? "brak danych..."}',
                ),
                CardDataRow(
                  title: "Przewoźnik",
                  data: package.service ?? "brak danych...",
                ),
                CardDataRow(
                  title: "Data wysyłki",
                  data: package.dateTimeSend == null
                      ? "brak danych..."
                      : DateFormat("yyyy-MM-dd HH:mm:ss")
                          .format(package.dateTimeSend!),
                ),
              ],
            ),
            if (package.sender != null)
              DataCard(
                children: [
                  const CardTitle(title: "Nadawca"),
                  CardDataRow(
                    title: "Imię",
                    data: package.sender!.name ?? "brak danych...",
                  ),
                  CardDataRow(
                    title: "Nazwisko",
                    data: package.sender!.surname ?? "brak danych...",
                  ),
                ],
              ),
            if (package.receiver != null)
              DataCard(
                children: [
                  const CardTitle(title: "Odbiorca"),
                  CardDataRow(
                    title: "Imię",
                    data: package.receiver!.name ?? "brak danych...",
                  ),
                  CardDataRow(
                    title: "Nazwisko",
                    data: package.receiver!.surname ?? "brak danych...",
                  ),
                ],
              ),
            if (package.parcels != null)
              DataCard(
                children: [
                  const CardTitle(title: "Przesyłki"),
                  ...package.parcels!.map((parcel) {
                    return Column(
                      children: [
                        CardDataRow(
                          title: "Numer paczki",
                          data: parcel.packageNo ?? "brak danych...",
                        ),
                        CardDataRow(
                          title: "Waga",
                          data: '${parcel.weight ?? "brak danych..."}',
                        ),
                        CardDataRow(
                          title: "Szerokość",
                          data: '${parcel.width ?? "brak danych..."}',
                        ),
                        CardDataRow(
                          title: "Długość",
                          data: '${parcel.height ?? "brak danych..."}',
                        ),
                        CardDataRow(
                          title: "Głębokość",
                          data: '${parcel.depth ?? "brak danych..."}',
                        ),
                        const Divider(),
                      ],
                    );
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
