import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';
import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';
import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
      title: const Text('Historial'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_forever),
          onPressed: (){

            Provider.of<ScanListProvider>(context,listen: false).borrarTodos();

          }
        )
      ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

    //Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
  
    //cambiar para pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //usar el ScanlistProvider 
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    

    switch(currentIndex) {

      case 0:
      scanListProvider.cargarScansPorTipo('geo');
      return const MapasPage();

      case 1:
      scanListProvider.cargarScansPorTipo('http');
      return const DireccionesPage();
     

      default:
      return const MapasPage();
    }

  }
}