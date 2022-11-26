import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Twitter",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Twitter(),
    );
  }
}

class Twitter extends StatefulWidget {
  const Twitter({super.key});

  @override
  State<Twitter> createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  var tweetList = [
    Tweet(
      avatar_url:
      'https://pbs.twimg.com/media/FW5rH6jXwAAnUdf.jpg',
      postText: 'The storm is approaching',),
    Tweet(
      avatar_url:
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/e1f0d285-74d2-4149-ac02-650b74caeb32/dek4ryj-83aa7304-c02f-48e1-ab1b-c3d77ee989e0.png/v1/fill/w_1600,h_1685,strp/terraria_world_by_rariaz_by_rariaz_dek4ryj-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTY4NSIsInBhdGgiOiJcL2ZcL2UxZjBkMjg1LTc0ZDItNDE0OS1hYzAyLTY1MGI3NGNhZWIzMlwvZGVrNHJ5ai04M2FhNzMwNC1jMDJmLTQ4ZTEtYWIxYi1jM2Q3N2VlOTg5ZTAucG5nIiwid2lkdGgiOiI8PTE2MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.Qp8689yMowiVVUgCYCRyTjq22y_hUbhmru--RjNANh4',
      postText: 'Terraria Overworld',),
    Tweet(
      avatar_url:'https://i.ibb.co/wNWBfyC/hallow-diamond-bunny.gif',
      postText: 'Labor and Love',),
    Tweet(
      avatar_url:'https://i.pinimg.com/originals/c3/d1/1b/c3d11b5d9e099d7094dc1cc9af375d19.gif',
      postText: 'King slime junior',),
    Tweet(
      avatar_url:'https://cdna.artstation.com/p/assets/images/images/035/924/666/original/matthieu-rappeneau-twins-resprite-tpa-contest.gif?1616266758',
      postText: 'The Mechanical Eyes',),
    Tweet(
      avatar_url:'https://media.tenor.com/UWgxH1SiKNIAAAAC/endgame-calamity-terraria.gif',
      postText: 'Yharim Animation',),
    Tweet(
      avatar_url:'https://static.wikia.nocookie.net/total-calamity-wiki/images/f/f4/Dd8gmxe-7a3c7817-e693-404f-912c-051e621f124b.png/revision/latest/scale-to-width-down/250?cb=20200417141016',
      postText: 'Royal Scientist',),
    Tweet(
      avatar_url:'https://static.wikia.nocookie.net/total-calamity-wiki/images/4/4d/Scal5.gif/revision/latest/smart/width/250/height/250?cb=20220302040145',
      postText: 'Brimstone Witch',),
    Tweet(
      avatar_url:'https://preview.redd.it/blkx26v8jx771.gif?format=png8&s=192ef302432b130a2b7083f20b433483913d307b',
      postText: 'Jungle Dragon',),
    Tweet(
      avatar_url:'https://static.wikia.nocookie.net/total-calamity-wiki/images/0/08/Edgydoggo.jpg/revision/latest?cb=20191103140814',
      postText: 'Devourer of God',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10.0),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://steamuserimages-a.akamaihd.net/ugc/1819992363129078346/C2E5E435F7E6D77C64C79A41C991955B7C6C379B/?imw=200&imh=200&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true'),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildIconButton(
              Icons.home,
              Colors.grey,
            ),
            buildIconButton(
              Icons.safety_check_outlined,
              Colors.grey,
            ),
            buildIconButton(
              Icons.notifications_outlined,
              Colors.grey,
            ),
            buildIconButton(
              Icons.email_outlined,
              Colors.grey,
            ),
          ],
        ),
      ),
      body: listOfTweets(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.pen),
        onPressed: () {
          setState(() {
            //tweetList.add(Tweet());
            tweetList.insert(
                0,
                Tweet(
                  avatar_url:
                  'https://media.tenor.com/_rCpso2Lk0AAAAAC/big-chungus-terraria.gif',
                  postText: 'Hello Guys',
                ));
          });
        },
      ),
    );
  }

  Widget listOfTweets() {
    return Container(
        color: Colors.white,
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return tweetList[index];
            },
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(
              height: 10,
            ),
            itemCount: tweetList.length));
  }

  Widget buildIconButton(IconData icon, Color color) {
    return IconButton(
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: () {});
  }
}
