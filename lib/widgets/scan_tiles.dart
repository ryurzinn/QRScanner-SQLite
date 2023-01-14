import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';
import '../providers/scan_list_provider.dart';


class ScanTiles extends StatelessWidget {
 

  final String tipo;


  const ScanTiles({Key? key,  required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final scanListProvider = Provider.of<ScanListProvider>(context);
     final scans =scanListProvider.scans;

    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(
          tipo == 'http'
              ?Icons.home
              :Icons.map,
           
          color: Theme.of(context).primaryColor),
        title:  Text(scans[i].valor),
        subtitle: Text(scans[i].valor.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        // ignore: avoid_print
        onTap: () => launchUrl(context, scans[i]),
      )
    );
    
  }
}