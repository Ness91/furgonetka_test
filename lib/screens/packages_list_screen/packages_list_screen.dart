import 'package:flutter/material.dart';
import 'package:furgonetka/screens/packages_list_screen/api/packages_api.dart';
import 'package:furgonetka/screens/packages_list_screen/widgets/packages_list_view.dart';
import 'package:furgonetka/shared/info/modal_bottom_sheet.dart';

class PackagesListScreen extends StatefulWidget {
  const PackagesListScreen({Key? key}) : super(key: key);

  @override
  State<PackagesListScreen> createState() => _PackagesListScreenState();
}

class _PackagesListScreenState extends State<PackagesListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        setState(() {
          _isLoading = true;
        });

        if (!await PackagesApi(context).get()) {
          ModalBottomInfo.show(context, "Nie udało się pobrać danych!");
        }

        setState(() {
          _isLoading = false;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista paczek"),
      ),
      body: Column(
        children: [
          if (_isLoading) const LinearProgressIndicator(minHeight: 8),
          const Expanded(
            child: PackagesListView(),
          ),
        ],
      ),
    );
  }
}
