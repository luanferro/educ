import 'package:cloud_firestore/cloud_firestore.dart';

class PontoEntity {
  final String tipo;
  final num pontos;
  final String motivo;
  final String categoria;

  PontoEntity(
      {required this.tipo,
      required this.pontos,
      required this.motivo,
      required this.categoria});

  factory PontoEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PontoEntity(
        tipo: data?['tipo'],
        pontos: data?['pontos'],
        motivo: data?['motivo'],
        categoria: data?['categoria']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "tipo": tipo,
      "pontos": pontos,
      "motivo": motivo,
      "categoria": categoria,
    };
  }
}
