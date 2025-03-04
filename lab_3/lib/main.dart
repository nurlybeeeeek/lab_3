import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showImage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("lab_3"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsIH72itII60TuuVaMKp-KYxFY_WvTT2xY6A&s",
              ),
              const SizedBox(height: 40),
              
              Image.asset(
                "assets/images/1.jpeg",
                width: 200,
                height: 200,
                fit: BoxFit.cover, 
              ),
              const SizedBox(height: 20),
              
              
              buildStack(),
              
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "C://src/lab_3/assets/image 1.jpg",
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          width: 250,
          height: 250,
          color: Colors.red.withOpacity(0.5),
        ),
        const Text(
          "Welcome to Flutter",
          style: TextStyle(
            color: Colors.green,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildButtons() {
  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('SnackBar is shown')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, // Изменен цвет фона
          foregroundColor: Colors.yellow, // Изменен цвет текста
          minimumSize: const Size(250, 60), // Увеличена ширина и высота
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Изменен размер шрифта и стиль
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30), // Добавлены отступы
        ),
        child: const Text("Show SnackBar"),
      ),
      const SizedBox(height: 30), // Увеличен отступ между кнопками

      TextButton(
        onPressed: () {
          // Ваш код для перехода на другой экран
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.orange, // Изменен цвет текста
          minimumSize: const Size(250, 60), // Увеличена ширина и высота
          textStyle: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic), // Изменен шрифт
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35), // Добавлены отступы
        ),
        child: const Text("Go to Second Screen"),
      ),
      const SizedBox(height: 30), // Увеличен отступ между кнопками

      OutlinedButton(
        onPressed: () {
          setState(() {
            _showImage = !_showImage;
          });
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blueGrey, // Изменен цвет текста
          side: const BorderSide(color: Colors.blueGrey, width: 2), // Изменен цвет и толщина границы
          minimumSize: const Size(250, 60), // Увеличена ширина и высота
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600), // Изменен шрифт
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35), // Добавлены отступы
        ),
        child: const Text("Toggle Image"),
      ),
      const SizedBox(height: 30), // Увеличен отступ между кнопками

      _showImage
          ? Image.asset(
              "assets/images/1.jpeg",
              width: 250, // Изменена ширина изображения
              height: 250, // Изменена высота изображения
              fit: BoxFit.cover,
            )
          : Container(),
    ],
  );
}
}
