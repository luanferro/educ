import 'package:educ/layers/domain/entities/aluno_entity.dart';
import 'package:educ/layers/domain/entities/ponto_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../data/datasources/firebase/cadastro_aluno_datasource_imp.dart';
import '../../controllers/aluno_controller.dart';
import '../../controllers/usuario_controller.dart';
import '../widgets/classificacao_list_item.dart';
import '../widgets/historico_list_item.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  var controller = GetIt.I.get<AlunoController>();
  var controllerUsuario = GetIt.I.get<UsuarioController>();
  var elo = "";
  var colorRanking = Colors.transparent;
  XFile? imagem;
  XFile? imagemTemporaria;
  String pathImage = '';
  final ImagePicker _picker = ImagePicker();

  List<Color> colorList = [
    const Color.fromRGBO(244, 67, 54, 0.6),
    const Color.fromRGBO(66, 165, 245, 0.6),
    const Color.fromRGBO(255, 238, 88, 0.6),
    const Color.fromRGBO(102, 187, 106, 0.6),
    const Color.fromRGBO(171, 71, 188, 0.6)
  ];

  @override
  void initState() {
    super.initState();

    _reloadFotoPerfil();
    controller.buscarPontos(controllerUsuario.usuario ?? '');
  }

  @override
  Widget build(BuildContext context) {
    controllerUsuario.buscarUsuarioLogado();
    controller.buscarAlunoUseCase(controllerUsuario.usuario ?? '');
    var altura = MediaQuery.of(context).size.height;
    var largura = MediaQuery.of(context).size.width;
    Map<String, double> dataMap = {
      "Frequência": double.parse(calcularPorcentagemCategoria('frequencia')),
      "Prova": double.parse(calcularPorcentagemCategoria('prova')),
      "Atividade": double.parse(calcularPorcentagemCategoria('atividade')),
      "Comportamento":
          double.parse(calcularPorcentagemCategoria('comportamento')),
      "Outros": double.parse(calcularPorcentagemCategoria('outros'))
    };

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          Container(
            height: altura / 4,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            margin: const EdgeInsets.only(right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: altura * 0.7,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 70,
                        ),
                        Text(
                          controller.aluno!.usuario.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 40, right: 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Nome:",
                                          style: TextStyle(
                                              color: Colors.deepPurpleAccent,
                                              fontSize: 12),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 18),
                                          child: Text(
                                            controller.aluno!.nome.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Matricula:",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: largura * 0.51,
                                            ),
                                            Text(
                                              controller.aluno!.matricula
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "turma:",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              controller.aluno!.turma
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Punições",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Colocação Geral:",
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepPurpleAccent,
                                                  fontSize: 12),
                                            ),
                                            Text(
                                              ("${(controller.alunos.lastIndexWhere((element) => element.matricula == controller.aluno!.matricula) + 1)}º"),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: altura * 0.04,
                            ),
                            PieChart(
                              dataMap: dataMap,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              chartLegendSpacing: 60,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 3,
                              colorList: colorList,
                              initialAngleInDegree: 0,
                              chartType: ChartType.ring,
                              ringStrokeWidth: 6,
                              legendOptions: const LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValueBackground: false,
                                showChartValues: true,
                                showChartValuesInPercentage: true,
                                showChartValuesOutside: false,
                                decimalPlaces: 0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: altura * 0.04,
                        ),
                        SizedBox(
                          height: altura * 0.06,
                          width: largura * 0.45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: largura,
                                          height: 230,
                                          child: exibirLista(context),
                                        ),
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        title: const Text(
                                            textAlign: TextAlign.center,
                                            "Histórico Pontos"),
                                      );
                                    });
                              },
                              child: const Text(
                                "Histórico",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )),
                        )
                      ],
                    )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: altura * 0.16),
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              // ignore: sort_child_properties_last
              child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                      radius: 55,
                      backgroundImage: (controller.pathImage != null)
                          ? NetworkImage(controller.pathImage ?? '')
                              as ImageProvider
                          : const AssetImage('images/semfoto.png'))),
              style: ElevatedButton.styleFrom(shape: const CircleBorder()),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        actions: [
                          TextButton(
                              onPressed: () {
                                pegarImagemGaleria();
                                Navigator.of(context).pop();
                              },
                              child: const Text("Galeria")),
                          TextButton(
                              onPressed: () {
                                pegarImagemCamera();
                                Navigator.of(context).pop();
                              },
                              child: const Text("Câmera"))
                        ],
                        title: const Text(
                            textAlign: TextAlign.center, "Selecionar Imagem"),
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  void pegarImagemGaleria() async {
    imagemTemporaria = await _picker.pickImage(source: ImageSource.gallery);
    imagem = imagemTemporaria;
    await CadastroAlunoDataSourceImp()
        .salvarImagemPerfil(controller.aluno?.usuario ?? '', imagem!.path);
    _reloadFotoPerfil();
  }

  void pegarImagemCamera() async {
    imagemTemporaria = await _picker.pickImage(source: ImageSource.camera);
    imagem = imagemTemporaria;
    await CadastroAlunoDataSourceImp()
        .salvarImagemPerfil(controller.aluno?.usuario ?? '', imagem!.path);
    _reloadFotoPerfil();
  }

  void _reloadFotoPerfil() async {
    await controller.buscarAlunoUseCase(controller.aluno?.usuario ?? '');
    var newPath = await Future.delayed(
        const Duration(seconds: 0),
        () =>
            controller.buscarImagemStorage(controller.aluno?.fotoPerfil ?? ''));
    if (mounted) {
      setState(() {
        controller.pathImage = newPath;
      });
    }
  }

  exibirLista(BuildContext context) {
    if (controller.pontos.isNotEmpty) {
      return montaLista(controller.pontos, context);
    } else {
      return const Center(
        child: Text("Sem dados"),
      );
    }
  }

  Widget montaLista(List lista, BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, int index) {
          return HistoricoListItem(
            ponto: lista[index],
          );
        },
        itemCount: lista.length);
  }

  calcularPorcentagemCategoria(String categoria) {
    List<PontoEntity> listaPontosCategoria = [];
    num pontosTotal = 0;
    num pontosCategoria = 0;

    for (var ponto in controller.pontos) {
      if (ponto.categoria == categoria) {
        listaPontosCategoria.add(ponto);
      }
      if (ponto.tipo == 'ganho') {
        pontosTotal += ponto.pontos;
      } else if (ponto.tipo == 'perda') {
        pontosTotal -= ponto.pontos;
      }
    }

    for (var ponto in listaPontosCategoria) {
      pontosCategoria += ponto.pontos;
    }

    num porcentagem = (pontosCategoria * 100) / pontosTotal;
    return porcentagem.toStringAsFixed(1);
  }
}
