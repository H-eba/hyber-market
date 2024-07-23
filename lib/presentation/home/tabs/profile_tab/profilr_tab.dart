import 'package:ecommerce/presentation/cart/view_model/view_model_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entites/auth_entity/AuthEntity.dart';


class ProfileTab extends StatelessWidget {
  AuthEntity? user;

  ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome,'),
       
    ),
      body: Column(children: [
        TextFormField(
          initialValue: user?.message??'',
          onChanged: (value) {
           // task.title=value;
          },
          decoration: InputDecoration(
              hintText: 'title',
              hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          onChanged: (value) {
          //  task.description=value;
          },
         // initialValue: task.description,
          decoration: InputDecoration(
              hintText: 'description',
              hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
        ),
        Text(user?.message??''),
      ],),
    
    );
  }
}
