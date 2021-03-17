import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/564x/a0/18/6c/a0186ccec31e08a31519d1112d0e1124.jpg'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              child: Text('JD'),
            )
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://i.pinimg.com/564x/2d/9c/24/2d9c2451a85575c2c1010ce9e784c17c.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}