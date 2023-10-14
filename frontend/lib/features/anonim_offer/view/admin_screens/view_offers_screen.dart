import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class Offer {
  final String title;
  final String description;

  Offer({required this.title, required this.description});
}

class ViewOffersScreen extends StatefulWidget {
  const ViewOffersScreen({super.key});

  @override
  _ViewOffersScreenState createState() => _ViewOffersScreenState();
}

class _ViewOffersScreenState extends State<ViewOffersScreen> {
  // этот список создается данными из БД
  List<Offer> offers = [
    Offer(
        title: 'Разработать планировщик задач',
        description: 'Нужно сделать в приложении меню'
            ' с выпадающими списками задач и их описанием'),
    Offer(
        title: 'Реализация профиля',
        description: 'Сделать профиль пользователя с информацией о нем:'
            'имя, почта, телефон, описание'),
    Offer(
        title: 'Анонимный чат',
        description: 'Сделать возможность пользователям анонимно обращаться'
            ' с жалобами или пожеданиями к начальству'),
    Offer(
        title: 'Сервис устранения неполадок',
        description: 'Сделать возможным решение технических проблем дистанционно'
            'через приложение. Функционал: получение справок, больничных, отпусков;'
            'решение технических проблем, вызов специалиста'),
  ];

  List<bool> descriptionVisibleList = [];

  @override
  void initState() {
    super.initState();
    offers.forEach((offer) {
      descriptionVisibleList.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Предложения'),
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                descriptionVisibleList[index] = !descriptionVisibleList[index];
              });
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(offers[index].title),
                  trailing: Icon(
                    descriptionVisibleList[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
                if (descriptionVisibleList[index])
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(offers[index].description),
                  ),
                const Divider(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}