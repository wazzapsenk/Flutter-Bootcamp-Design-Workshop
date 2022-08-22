import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en",""),
        Locale("tr","")
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,
      ),home: Anasayfa(

    ),
    );
  }
}
//stful
//biz hep 2.class'ta çalışacağız
class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var d=AppLocalizations.of(context);

    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    print("Genişlik: $ekranGenisligi");
    print("Yükseklik: $ekranYuksekligi");
    return Scaffold(
      appBar: AppBar(
        title:  Text("Pizza",
        style: TextStyle(fontFamily: "Pacifico",fontSize: ekranGenisligi/22),
        ),
        backgroundColor: anaRenk, //renk tanımladık
        centerTitle: true,

      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(d!.pizzaBaslik,style: TextStyle(fontSize: 36,color: anaRenk,fontWeight: FontWeight.bold),),
          Image.asset("images/pizza_resim.png"),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(icerik: d.peynirYazi,),
              Chip(icerik: d.sucukYazi,),
              Chip(icerik: d.zeytinYazi,),
              Chip(icerik: d.biberYazi,),//Cheese
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0) ,//all sağ sol yukarıdan ve aşağıdan
            child: Column(
              children: [
                Text(d.teslimatSure, style: TextStyle(fontSize: 22,color: yaziRenk2,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(d.teslimatBaslik, style: TextStyle(fontSize: 22,color: anaRenk,fontWeight: FontWeight.bold),),
                ),
                Text(d.pizzaAciklama,
                  style: TextStyle(fontSize: 22,color: yaziRenk2),textAlign: TextAlign.center,
                ),
              ],
            ),
          ),//kenarlara boşluk
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              children: [
                Text(d.fiyatYazi, style: TextStyle(fontSize: 44,color: anaRenk,fontWeight: FontWeight.bold),),
                const Spacer(),//2 nesne arasına boşluk koyar
                SizedBox(width: ekranGenisligi/2,height: 50,
                  child: TextButton(
                    onPressed: (){},
                    child: Text(d.buttonYazi,style: TextStyle(color: yaziRenk1,fontSize: 18),),
                    style: TextButton.styleFrom(backgroundColor: anaRenk),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ); //Sayfanın üzerinde bazı yerleri sabitlememizi sağlıyor Scaffold
  }
}

class Chip extends StatelessWidget {
  String icerik;


  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){print("$icerik'e tıklandı");}, //Console'dan takip etmek için süslüye print komutu yazıldı
      child: Text(icerik,style: TextStyle(color: yaziRenk1),), //"Cheese" Yazı rengi
      style: TextButton.styleFrom(
          backgroundColor: anaRenk, //çevresindeki rengi ayarladık
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))) //ovallik verdik yazı çevresindeki kırmızılığa
      ),
    );
  }
}
