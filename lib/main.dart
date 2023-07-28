import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my App title",
      theme: ThemeData(primaryColor: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("appbar title"),
            centerTitle: true,
            elevation: 0,
            // leading: const Icon(Icons.menu),
            actions: [
              IconButton(
                  onPressed: () {
                    print("button clicked");
                  },
                  icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    print("button clicked");
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
          drawer: const MyDrawer(),
          body: Builder(builder: (BuildContext context) {
            return Column(children: [
              ElevatedButton(
                child: const Text("show me"),
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("hello")));
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const SecondPage()));
                  },
                  child: const Text("go to the Scond Page"))
            ]);
          })),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpeg'),
              backgroundColor: Colors.white,
            ),
            accountName: const Text("Dong Soo"),
            accountEmail: const Text("dearsecret1217@gmail.com"),
            otherAccountsPictures: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/chef.jpeg'),
                backgroundColor: Colors.white,
              )
            ],
            onDetailsPressed: () {
              print('arrow is clicked ');
            },
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.home),
            title: Text("home"),
            trailing: Icon(Icons.add),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("settings"),
            trailing: Icon(Icons.add),
          ),
          const ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Q&A"),
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("second page")),
        body: Center(
          child: ElevatedButton(
            child: const Text("Go to the first page"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ));
  }
}
