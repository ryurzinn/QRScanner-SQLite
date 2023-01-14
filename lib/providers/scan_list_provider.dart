import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

 List<ScanModel> scans = [];
 String tipoSeleccionado = 'http';

 Future<ScanModel>nuevoScan(String valor) async{

  final nuevoScan = ScanModel(valor: valor);
  final id =await DBProvider.db.nuevoScan(nuevoScan);
  nuevoScan.id = id;

  
 if(tipoSeleccionado == nuevoScan.tipo){
  scans.add(nuevoScan);
  notifyListeners();

}

return nuevoScan;


  
 }
 cargarScans() async{
   var scans = await DBProvider.db.getTodosLosScans();
  scans = [...scans!];
  notifyListeners();
 }


cargarScansPorTipo(String tipo) async{
 var scans = await DBProvider.db.getScansPorTipo(tipo);
  scans = [...scans!];
  tipoSeleccionado = tipo;
  notifyListeners();

}


  borrarTodos() async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();


  }


  borrarScansPorId(int id )async{
    DBProvider.db.deleteScan(id);
    
  }



  }


