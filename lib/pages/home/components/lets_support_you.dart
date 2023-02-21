// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';


class LetsSupportYou extends StatelessWidget {

  const LetsSupportYou({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
         child: Container(
          width: context.screenWidth,
          padding: const EdgeInsets.only(left:8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Padding(
                padding: EdgeInsets.all(8.0),
                child:  Text('Vamos dar-te suporte!', style: TextStyle(fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8,bottom: 5),
                child: Row(
                  children: const[
                    Text('Use a Trybu Premium', style: TextStyle(color: Color.fromARGB(255, 133, 132, 132)),),
                    Icon(Icons.star, color: Colors.yellow, size: 20,)
                  ],
                ),
              ),
              const ItemSupport(icon:Icons.chat, name: 'Chat',description: 'Conecta-te para 1-1 e em grupos',color: AppColors.brownColor,),
              const Divider(thickness: 0.5,),
              const ItemSupport(icon:Icons.groups_outlined,name: 'Comunity',description:'Faça questões e tenha suporte',color: Color.fromARGB(255, 226, 208, 48),),
              const Divider(thickness: 0.5,),
              const ItemSupport(icon:Icons.rocket_launch_outlined,name: 'Projecção',description: 'Dê passos para crescer e aprender',color: AppColors.green,)
            ],
          ),
         ),
       );
  }
}

class ItemSupport extends StatelessWidget {
  const ItemSupport({
    Key? key,
    required this.icon,
    required this.name,
    required this.description,
    required this.color
  }) : super(key: key);
 final IconData icon;
 final String name;
 final String description;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 5),
      leading:Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
           child: Icon(icon, color: Colors.white,)
          ),
          title:   Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
           subtitle: Text(description),
           trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 15,),

         
    );
  }
}
