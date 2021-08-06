import 'package:dependencyinjection/domain/user.dart';
import 'package:dependencyinjection/ui/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;


  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text('User List'),
            ),
            body: bloc.users != null
                ? ListView.builder(
                    itemCount: bloc.users!.length,
                    itemBuilder: (context, index) {
                      final user = bloc.users[index];
                      return _UserItem(user: user);
                    })
                : Center(child: CircularProgressIndicator()),
          );
        });
  }
}



class _UserItem extends StatelessWidget {

  final User? user;

  const _UserItem({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

        title: Text(user.username),
        subtitle: Text(user.email)
    );
  }
}
