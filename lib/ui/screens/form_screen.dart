import 'package:first_project/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nova tarefa"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 480,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Insira um nome para tarefa";
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          int.parse(value) > 5 ||
                          int.parse(value) < 1) {
                        return "Insira um valor válido entre 1 e 5";
                      }
                      return null;
                    },
                    controller: difficultyController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Dificuldade",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira uma url de imagem válida";
                      }
                      return null;
                    },
                    controller: imageController,
                    onChanged: (text) => setState(() {}),
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      labelText: "Imagem",
                      border: OutlineInputBorder(),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 2, color: Colors.blueAccent),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageController.text,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace,
                            ) {
                              return Center(
                                child: Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.white70,
                                  size: 32,
                                ),
                              );
                            },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskInherited.of(widget.taskContext).newTask(
                          nameController.text,
                          imageController.text,
                          int.parse(difficultyController.text),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            elevation: 150.0,
                            content: Text("Salvo com sucesso!"),
                            showCloseIcon: true,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Adicionar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
