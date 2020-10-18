import 'package:flutter/material.dart';

class Topologi extends StatelessWidget {
  // double getSmallDiameter(BuildContext context) =>
  //     MediaQuery.of(context).size.width * 2 / 3;

  // double getBigDiameter(BuildContext context) =>
  //     MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topologi'),
        backgroundColor: Color(0xFF558B2F),
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 5)),
          Center(
            child: Image(
              image: AssetImage('assets/Gambar1.png'),
              width: 400,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5, bottom: 5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, left: 10),
                child: Text(
                  "Topologi Sistem Pemantauan Panel Surya:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Hasil dari pembacaan sensor arus dan tegangan yang dilakukan oleh tiga node dikirimkan ke satu gateway melalui jaringan nirkabel LoRa. Data yang masuk ke gateway akan diterukan oleh packet forwarder menuju Chirpstack Gateway Bridge yang bertugas mengubah data dari packet forwarder menjadi format data JSON dan mengirimkannya ke Chirpstack Network Server melalui MQTT. Kemudian, pada Chirpstack Network server terdapat proses deduplikasi, menangani frame uplink. Pada Chirpstack App Server terdapat web-interface untuk mengatur user, organisasi, application, dan device. Chirpstack App Server bertanggung jawab atas join-requests, enkripsi payload, dan untuk integrasi eksternal. Chirpstack App Server juga dapat mengirimkan pesan downlink menuju broker yang nantinya akan diteruskan ke packet forwarder lalu dikirimkan ke node. Terdapat pula program Python yang bertugas mensubscribe data kemudian memecah data dan mengirimkan data tersebut ke database dan juga mempublish data menuju web dengan protokol MQTT over Flutter. Aplikasi android dapat melakukan perintah downlink dengan cara mempublish pesan langsung menuju broker.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
