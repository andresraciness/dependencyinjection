import 'package:dependencyinjection/data/user_list_remote_service.dart';
import 'package:dependencyinjection/domain/user.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier {
  final service = UserListRemoteService();

  List<User>? users;

  Future<void> getUsers() async {
    users = await service.getUsers();
    notifyListeners();
  }
}
