import 'package:flutter/material.dart';
import 'package:multicaixa_express_ui/src/models/servico.dart';
import 'package:multicaixa_express_ui/src/services/servicos_service.dart';
import 'package:multicaixa_express_ui/src/utils/colors.dart';
import 'package:multicaixa_express_ui/src/views/widgets/slide_hor_cartoes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ServicoModel> listaDeServicos = ServicoServece.getAllServicos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myPrimaryColor,
          elevation: 0,
          title: Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              const Image(image: AssetImage("assets/logo.png"))
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Cartões",
                style: TextStyle(
                    color: myPrimaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SlideScollHorisontal(),
            Image.asset(
              "assets/icons/icon2.png",
              width: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              padding: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 1,
                    children: <Widget>[
                      for (ServicoModel element in listaDeServicos)
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: corSegundaria, width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  element.imagem,
                                  width: 80,
                                ),
                                Text(element.nome,
                                    style: TextStyle(
                                        fontSize: 11, color: corSegundaria)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
