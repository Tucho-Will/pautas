import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailSend {
  static String username = 'sende.app.email@gmail.com';
  static String password = 'Teste@123';

  static final smtpServer = gmail(username, password);

  static Future<bool> sendMessage(
      String mensagem, String destinatario, String assunto) async {
    //Configurar a mensagem
    final message = Message()
      ..from = Address(username, 'App Pautas')
      ..recipients.add(destinatario)
      ..subject = assunto
      ..text = mensagem;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return true;
    } on MailerException catch (e) {
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      return false;
    }
  }
}
