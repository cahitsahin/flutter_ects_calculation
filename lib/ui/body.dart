import 'package:flutter/material.dart';
import 'package:nothesaplama/models/lesson.dart';
import 'package:nothesaplama/utils/dropdown_menu_item.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String lessonName;
  double lessonCredit = 1;
  double lessonGrade = 4;
  double average = 0;
  List<Lesson> allLesson;
  var formKey = GlobalKey<FormState>();
  static int count = 0;

  @override
  void initState() {
    super.initState();
    allLesson = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama Hesapla"),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      resizeToAvoidBottomPadding: false,
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return appBody();
        } else {
          return appBodyLandScape();
        }
      }),
    );
  }

  Widget appBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            //color: Colors.pink.shade200,
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Ders Adı",
                      hintText: "Ders adını giriniz",
                      hintStyle: TextStyle(fontSize: 18),
                      labelStyle: TextStyle(fontSize: 22),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: (input) {
                      if (input.length > 0) {
                        return null;
                      } else
                        return "Ders adı boş olamaz";
                    },
                    onSaved: (input) {
                      lessonName = input;
                      setState(() {
                        allLesson
                            .add(Lesson(lessonName, lessonCredit, lessonGrade));
                        average = 0;
                        averageCalculate();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            width: 2,
                          ),
                          boxShadow: [],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Kredi",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            DropdownButton<double>(
                              hint: Text("data"),
                              items: lessonCreditItems(),
                              value: lessonCredit,
                              onChanged: (selectedCredit) {
                                setState(() {
                                  lessonCredit = selectedCredit;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.amber,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Harf Notu",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            DropdownButton<double>(
                              items: lessonGradeItems(),
                              value: lessonGrade,
                              onChanged: (selectedGrade) {
                                setState(() {
                                  lessonGrade = selectedGrade;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          border: Border.all(
                            color: Colors.black87,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Text("Ekle",style: TextStyle(color: Colors.white,fontSize: 17),),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: BorderDirectional(
                        bottom: BorderSide(color: Colors.amber, width: 2),
                        top: BorderSide(color: Colors.amber, width: 2),
                      ),
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: allLesson.length == 0
                                    ? "Ders Ekleyin"
                                    : "Ortalama: ",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black87)),
                            TextSpan(
                                text: allLesson.length == 0
                                    ? ""
                                    : "${average.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.pink)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: _addList,
                itemCount: allLesson.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBodyLandScape() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //color: Colors.pink.shade200,
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Ders Adı",
                        hintText: "Ders adını giriniz",
                        hintStyle: TextStyle(fontSize: 18),
                        labelStyle: TextStyle(fontSize: 22),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      validator: (input) {
                        if (input.length > 0) {
                          return null;
                        } else
                          return "Ders adı boş olamaz";
                      },
                      onSaved: (input) {
                        lessonName = input;
                        setState(() {
                          allLesson.add(
                              Lesson(lessonName, lessonCredit, lessonGrade));
                          average = 0;
                          averageCalculate();
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                              width: 2,
                            ),
                            boxShadow: [],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Kredi",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              DropdownButton<double>(
                                hint: Text("data"),
                                items: lessonCreditItems(),
                                value: lessonCredit,
                                onChanged: (selectedCredit) {
                                  setState(() {
                                    lessonCredit = selectedCredit;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Harf Notu",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              DropdownButton<double>(
                                items: lessonGradeItems(),
                                value: lessonGrade,
                                onChanged: (selectedGrade) {
                                  setState(() {
                                    lessonGrade = selectedGrade;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            border: Border.all(
                              color: Colors.black87,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            icon: Text("Ekle",style: TextStyle(color: Colors.white,fontSize: 17),),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          border: BorderDirectional(
                            bottom: BorderSide(color: Colors.amber, width: 2),
                            top: BorderSide(color: Colors.amber, width: 2),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: allLesson.length == 0
                                        ? "Ders Ekleyin"
                                        : "Ortalama: ",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black87)),
                                TextSpan(
                                    text: allLesson.length == 0
                                        ? ""
                                        : "${average.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.pink)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: ListView.builder(
                itemBuilder: _addList,
                itemCount: allLesson.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _addList(BuildContext context, int index) {
    count++;
    return Dismissible(
      key: Key(count.toString()),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        setState(() {
          allLesson.removeAt(index);
          averageCalculate();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(4),
        child: ListTile(
          leading: Icon(Icons.library_books,color: Colors.amber,),
          title: Text(allLesson[index].name,style: TextStyle(color: Colors.amber,fontSize: 22,fontWeight: FontWeight.bold),),
          subtitle: Text(allLesson[index].credit.toStringAsFixed(1)+" Kredi, "+ allLesson[index].grade.toString()+" " ),
          trailing: IconButton(
            icon: Icon(Icons.delete,color: Colors.pink,),
            onPressed: () {
              allLesson.removeAt(index);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  void averageCalculate() {
    double sumGrade = 0;
    double sumCredit = 0;

    for (var currentLesson in allLesson) {
      var credit = currentLesson.credit;
      var grade = currentLesson.grade;

      sumCredit = sumCredit + credit;
      sumGrade = sumGrade + (grade * credit);
    }
    average = sumGrade / sumCredit;
  }
}
