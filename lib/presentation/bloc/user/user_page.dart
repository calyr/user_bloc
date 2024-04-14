import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/presentation/bloc/user/user_bloc.dart';
import 'package:user_app/presentation/bloc/user/user_event.dart';
import 'package:user_app/presentation/bloc/user/user_state.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
       body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter username',
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  String username = _usernameController.text.toString();  
                  if(username.isNotEmpty) {
                    context.read<UserBloc>().add(FetchUserEvent(username));
                  }
                }
                , child: const Text('Fetch User')),
                const SizedBox(height: 20,),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context,state) {
                    if( state is UserLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is UserLoaded) {
                      final user = state.user;
                      return Column(
                        children: [
                          Center(child: Text(user.login)),
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: 40,
                            child: Image.network(user.avatarUrl)),
                          const SizedBox(height: 10,),
                          Text(user.bio),
                          const SizedBox(height: 10,),
                          
                        ],
                      );
                    } else if (state is UserError) {
                      return Text(state.errorMessage);
                    } else {
                      return const Text("");
                    }
                })
               ],
            ),
          ),
        ),
     );
  }
}