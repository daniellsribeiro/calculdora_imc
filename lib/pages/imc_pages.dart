import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/calculo_imc.dart';

class ImcListPage extends StatefulWidget {
  ImcListPage({Key? key}) : super(key: key);

  @override
  State<ImcListPage> createState() => _ImcListPageState();
}

class _ImcListPageState extends State<ImcListPage> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String info = 'Informe seus dados';
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void reset() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      info = "Informe seus dados";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: reset,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        color: Colors.green,
                        size: 150,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.blueGrey,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: 'Peso (kg)',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.green, fontSize: 25),
                              controller: weightController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe sua altura!';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.blueGrey,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: 'Altura (cm)',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.green, fontSize: 25),
                              controller: heightController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe sua altura!';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    info = calculo_imc(
                                        weightController, heightController);
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                padding: EdgeInsets.all(14),
                              ),
                              child: const Text(
                                'Calcular',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        info,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
