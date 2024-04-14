import 'package:flutter/material.dart';
import 'package:multicaixa_express_ui/src/models/teclado.dart';
import 'package:multicaixa_express_ui/src/services/teclado_service.dart';
import 'package:multicaixa_express_ui/src/utils/colors.dart';
import 'package:multicaixa_express_ui/src/views/home.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class MyOtp {
  int id;
  Color color = corSegundaria;

  MyOtp({
    required this.id,
  });
}

class _OtpScreenState extends State<OtpScreen> {
  List<TecladoModel> tecladoList = TecladoServece.getAllTeclados();
  List<String> senha = [];
  List<MyOtp> circularOTP = [
    MyOtp(id: 1),
    MyOtp(id: 2),
    MyOtp(id: 3),
    MyOtp(id: 4),
    MyOtp(id: 5),
    MyOtp(id: 6),
  ];

  void validarSenha(String valor) {
    if (valor != "DEL") {
      setState(() {
        circularOTP.elementAt(senha.length).color = Colors.black;
        senha.add(valor);
      });
      if (senha.length == 6) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen(),), (route) => false);
      }
    } else {
      setState(() {
        if (senha.isNotEmpty) {
          circularOTP.elementAt(senha.length -1).color = corSegundaria;
          senha.removeLast();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context)
          .size
          .height, // Define a altura do Container como a altura da tela
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: myPrimaryColor,
              child: const Image(image: AssetImage("assets/logo.png")),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (MyOtp myOtp in circularOTP)
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: myOtp.color,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "PIN do serviço MULTICAIXA",
                      style: TextStyle(color: corSegundaria),
                    ),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shrinkWrap: true,
                    primary: false,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: 1,
                    children: <Widget>[
                      for (TecladoModel teclado in tecladoList)
                        InkWell(
                          onTap: () {
                            validarSenha(teclado.valor);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: corSegundaria, width: 3)),
                            child: Center(
                              child: Text(teclado.valor,
                                  style: TextStyle(
                                      fontSize:
                                          teclado.valor != "DEL" ? 40 : 20,
                                      color: corSegundaria)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(
                color: corSegundaria,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(
                    "APOIO AO CLIENTE",
                    style: TextStyle(
                        color: myPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    "Linha de Atendimento 24H",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_phone_outlined,
                        color: myPrimaryColor,
                      ),
                      SizedBox(width: 10),
                      Text("(+244) 222 641 840 | 923 168 840"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: myPrimaryColor,
                      ),
                      SizedBox(width: 10),
                      Text("suporte.mcexpress@emis.co.ao"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline),
                      SizedBox(width: 10),
                      Text(
                        "Precisa de ajuda?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
