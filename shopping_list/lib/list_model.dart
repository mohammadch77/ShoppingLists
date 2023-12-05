class ListModel {
  String date;
  String name;
  ListModel({required this.date, required this.name});
}

List<ListModel> shoppingList = [
  ListModel(date: "date1", name: "name1"),
  ListModel(date: "date2", name: "name2"),
  ListModel(date: "date3", name: "name3"),
  ListModel(date: "date4", name: "name4"),
];
