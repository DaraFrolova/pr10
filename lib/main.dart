import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//part 'main.g.dart';

@riverpod
final testProvider = StateProvider<String>((ref) => 'Test');
//String helloWorld(HelloWorldRef ref) {
//  return 'Hello world';
//}
                           
void main() {

runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
    routes: {
      '/': (context) => MainScreen(),
    },
  );
}
}


class MainScreen extends ConsumerWidget {

  const MainScreen({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {

 final test = ref.watch(testProvider);

    return Scaffold(

      appBar: AppBar(title: Text('Главное окно')),

      body: new Column( children: [ 
        Container ( color: Colors.white,   height:40,
          child: 
        new Text( ' Практической работе №10 ', style: TextStyle(fontSize: 30, color: Colors.indigo) )),

        Container ( color: Colors.cyan,   height:350,

	child: Center(child: Column(children: [

        new Text('  '),
        new Text( 'Реализация хранения состояния с помощью библиотеки Riverpod ', style: TextStyle(fontSize: 22, color: Colors.limeAccent) ),
        new Text('  '),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_2()));}, child: Text('Открыть второе окно',style: TextStyle(fontSize: 24, color: Colors.cyan[700]) )),
        new Text('  '),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_3()));}, child: Text('Открыть третье окно',style: TextStyle(fontSize: 24, color: Colors.indigo[700]) ))

      ],)),)]

    )
    );

  }

}




class Screen_2 extends ConsumerWidget {

  const Screen_2({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {

  final test = ref.watch(testProvider);
  TextEditingController _nameController = TextEditingController();

    return Scaffold(

      appBar: AppBar(title: Text('Второе окно',style: TextStyle(fontSize: 20, color: Colors.red))),

      body: Center(  
               child:
        Container ( color: Colors.cyan[700],  
        child:  new Column(
        children: [
          new Text('  '),
          new Text(test, style: TextStyle(fontSize: 28, color: Colors.white)),
          new Text('  '),
	  ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=ref.read(testProvider.notifier).state.toUpperCase();}, child: Text('Изменить на заглавные  ',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
	  ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=ref.read(testProvider.notifier).state.toLowerCase();}, child: Text('Изменить на строчные ',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
          new TextFormField(initialValue: test,  controller: _nameController,style: TextStyle(fontSize: 24, color: Colors.white), decoration: InputDecoration(hintText: 'Введите текст',),),
          Text(' ', style: TextStyle(fontSize: 22, color: Colors.green)),
          ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=_nameController.text; }, child: Text('Сохранить',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
	  ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.cyan[700])))
   ]))),
    
    );

  }

}



class Screen_3 extends ConsumerWidget {

  const Screen_3({super.key});

  @override

  Widget build(BuildContext context, WidgetRef ref) {

  final test = ref.watch(testProvider);
  TextEditingController _nameController = TextEditingController();

    return Scaffold(

      appBar: AppBar(title: Text('Третье окно',style: TextStyle(fontSize: 20, color: Colors.red))),

      body: Center(  
               child:
        Container ( color: Colors.indigo[700],  
        child:  new Column(
        children: [
          new Text('  '),
          new Text('Проверка передачи параметров между окнами', style: TextStyle(fontSize: 22, color: Colors.limeAccent)),
          new Text('  '),
          new Text(test, style: TextStyle(fontSize: 28, color: Colors.white)),
          new Text('  '),
	  ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state='';}, child: Text('Очистить',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
	  ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=ref.read(testProvider.notifier).state.toUpperCase();}, child: Text('Изменить на заглавные  ',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
	  ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=ref.read(testProvider.notifier).state.toLowerCase();}, child: Text('Изменить на строчные ',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
          new TextFormField(initialValue: test,  controller: _nameController,style: TextStyle(fontSize: 24, color: Colors.white), decoration: InputDecoration(hintText: 'Введите текст',),),
          Text(' ', style: TextStyle(fontSize: 22, color: Colors.green)),
          ElevatedButton(onPressed: (){ ref.read(testProvider.notifier).state=_nameController.text; }, child: Text('Сохранить',style: TextStyle(fontSize: 24, color: Colors.indigo))),
          new Text('  '),
	  ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.indigo[700])))
   ]))),
    
    );

  }

}

















