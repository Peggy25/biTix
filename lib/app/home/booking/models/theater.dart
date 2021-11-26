import 'package:equatable/equatable.dart';

class TheaterModel extends Equatable {
  final String? name;
  final int? price;
  const TheaterModel(this.name, {this.price});
  @override
  List<Object> get props => [name!, price!];
}

List<TheaterModel> dummyTheater = [
  const TheaterModel("CGV Transmart", price: 40000),
  const TheaterModel("Gajah Mada Tegal", price: 30000),
  const TheaterModel("XXI Paris Van Java", price: 35000),
];
