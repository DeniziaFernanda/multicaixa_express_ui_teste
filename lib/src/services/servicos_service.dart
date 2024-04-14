import 'package:multicaixa_express_ui/src/models/servico.dart';

class ServicoServece {
  
  static List<ServicoModel> getAllServicos(){
    List<ServicoModel> listaDeServicos = [];

    listaDeServicos.addAll({
      ServicoModel(
        id: 1, 
        nome: "PAGAMENTOS", 
        imagem: "assets/icons/icon5.png"
      ),
      ServicoModel(
        id: 2, 
        nome: "TRANSFERÊNCIAS", 
        imagem: "assets/icons/icon4.png"
      ),
      ServicoModel(
        id: 3, 
        nome: "LEVANTAMENTO SEM CARTÃO", 
        imagem: "assets/icons/icon1.png"
      ),
       ServicoModel(
        id: 4, 
        nome: "CONSULTA", 
        imagem: "assets/icons/icon7.png"
      ),
      ServicoModel(
        id: 5, 
        nome: "COMPRAS EM CURSO", 
        imagem: "assets/icons/icon3.png"
      ),
      ServicoModel(
        id: 6, 
        nome: "COMPRAS", 
        imagem: "assets/icons/icon6.png"
      )
    });

    return listaDeServicos;
  }
}