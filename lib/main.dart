import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controladores para os campos de Peso, Altura e IMC
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController imcController = TextEditingController();

  bool isPesoSelected = true; // Controle de qual campo está sendo editado

  // Função para adicionar números ao campo correspondente
  void addNumber(String number) {
    setState(() {
      if (isPesoSelected) {
        pesoController.text += number;
      } else {
        alturaController.text += number;
      }
    });
  }

  // Função para selecionar o campo de Peso ou Altura
  void selectField(bool isPeso) {
    setState(() {
      isPesoSelected = isPeso;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Combinar Linhas e Colunas'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Exibir imagem
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 200,
                    child: Image.network(
                      'https://picsum.photos/seed/653/600',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Campo de Peso
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Peso',
                    ),
                    width: 100,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      controller: pesoController,
                      readOnly: true, // Impede entrada manual
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        selectField(true); // Selecionar o campo de Peso
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Campo de Altura
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Altura',
                    ),
                    width: 100,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      controller: alturaController,
                      readOnly: true, // Impede entrada manual
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        selectField(false); // Selecionar o campo de Altura
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Campo de IMC Calculado (não editável)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      'IMC-Calculado',
                    ),
                    width: 100,
                    height: 40,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 40,
                    child: TextFormField(
                      controller: imcController,
                      readOnly: true, // Apenas exibição, não editável
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Botões numéricos em GridView
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.red[300],
                    width: 400,
                    height: 180,
                    child: GridView(
                      padding: EdgeInsets.all(4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 botões por linha
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.5, // Proporção para deixar os botões mais largos
                        mainAxisExtent: 50,
                      ),
                      shrinkWrap: true, // Para evitar rolagem no GridView
                      children: [
                        // Botões que chamam a função addNumber para adicionar o número correspondente
                        ElevatedButton(
                          onPressed: () {
                            addNumber('7');
                          },
                          child: Text("7"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('8');
                          },
                          child: Text("8"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('9');
                          },
                          child: Text("9"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            selectField(!isPesoSelected); // Alternar entre Peso e Altura
                          },
                          child: Text("ENTER"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('4');
                          },
                          child: Text("4"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('5');
                          },
                          child: Text("5"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('6');
                          },
                          child: Text("6"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('.');
                          },
                          child: Text("."),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('1');
                          },
                          child: Text("1"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('2');
                          },
                          child: Text("2"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('3');
                          },
                          child: Text("3"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            addNumber('0');
                          },
                          child: Text("0"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}