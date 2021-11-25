import 'package:equatable/equatable.dart';

class CreditsModel extends Equatable {
  final String? name;
  final String? profile_path;
  const CreditsModel({
    this.name,
    this.profile_path,
  });

  factory CreditsModel.fromJson(Map<String?, dynamic> json) => CreditsModel(
    name: json['name'].toString(),
    profile_path: json['profile_path'].toString()
  );
  @override
  List<Object?> get props => [name,profile_path];
}
