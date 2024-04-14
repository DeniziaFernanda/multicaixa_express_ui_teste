import 'package:multicaixa_express_ui/src/models/teclado.dart';

class TecladoServece {
  
  static List<TecladoModel> getAllTeclados(){
    List<TecladoModel> listaDeTeclados = [];

    listaDeTeclados.addAll({
      TecladoModel(
        id: 1, 
        valor: "1"
      ),
      TecladoModel(
        id: 2, 
        valor: "2"
      ),
      TecladoModel(
        id: 3,
        valor: "3" 
      ),
       TecladoModel(
        id: 4, 
        valor: "4"
      ),
      TecladoModel(
        id: 5, 
        valor: "5"
      ),
      TecladoModel(
        id: 6, 
        valor: "6"
      ),
       TecladoModel(
        id: 2, 
        valor: "7"
      ),
      TecladoModel(
        id: 3,
        valor: "8" 
      ),
       TecladoModel(
        id: 4, 
        valor: "9"
      ),
      TecladoModel(
        id: 5, 
        valor: "DEL"
      ),
      TecladoModel(
        id: 6, 
        valor: "0"
      )
    });

    return listaDeTeclados;
  }
}