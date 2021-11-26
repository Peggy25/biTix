import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? profilePicture;
  final int? balance;

  const Users({
    this.id,
    this.email,
    this.name,
    this.profilePicture,
    this.balance,
  });

  //for edit value
  Users copyWith(
          {String? name,
          String? id,
          String? profilePicture,
          int? balance,
          List<String>? selectedGenres,
          String? selectedLanguage}) =>
      Users(
        id: id ?? this.id,
        email: email,
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        balance: balance ?? this.balance,
      );

  @override
  String toString() {
    return "[$id]- $name , $email";
  }

  @override
  List<Object> get props => [id!, email!, name!, profilePicture!, balance!];
}

Users dummyUser = const Users(
    id: '123KSDJK',
    balance: 1000000,
    email: 'peggy@gmail.com',
    name: 'Peggy Raihannisa',
    profilePicture: null);
