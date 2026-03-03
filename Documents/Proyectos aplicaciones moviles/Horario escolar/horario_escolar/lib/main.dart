import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
      view: CalendarView.workWeek, //Solo muestra de lunes a viernes
      backgroundColor: const Color(0xFFF5F5F7), //Color de fondo
      firstDayOfWeek: 1, //1 representa el Lunes
      appointmentTextStyle: const TextStyle( //Configuracion de laa letras
      fontSize: 14,             
      fontWeight: FontWeight.bold, 
      color: Colors.white,      
      fontFamily: 'Roboto',     
      ),
      dataSource: MeetingDataSource(getAppointments()),
      timeSlotViewSettings: const TimeSlotViewSettings( //Solo muestra de 7 am a 9 pm
      startHour: 7,  
      endHour: 21,
      ),
      ),
    );
  } 
}
List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();

  //Aplicaciones moviles los martes
  final DateTime startTime = DateTime(today.year, today.month, today.day, 14, 0, 0);
  meetings.add(Appointment(
    startTime: startTime,
    endTime: startTime.add(const Duration(hours: 3)),
    subject: 'Aplicaciones moviles',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=TU;'));

  //Aplicaciones moviles los jueves
  final DateTime jueveees = DateTime(today.year, today.month, today.day, 14, 0, 0);
  meetings.add(Appointment(
    startTime: jueveees,
    endTime: jueveees.add(const Duration(hours: 2)),
    subject: 'Aplicaciones moviles',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=TH;'));

    //Aplicaciones en la nube los martes
  final DateTime nubemartes = DateTime(today.year, today.month, today.day, 17, 0, 0);
  meetings.add(Appointment(
    startTime: nubemartes,
    endTime: nubemartes.add(const Duration(hours: 3)),
    subject: 'Aplicaciones en la nube',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=TU;'));

  //Aplicaciones en la nube los jueves
  final DateTime nubejueves = DateTime(today.year, today.month, today.day, 17, 0, 0);
  meetings.add(Appointment(
    startTime: nubejueves,
    endTime: nubejueves.add(const Duration(hours: 2)),
    subject: 'Aplicaciones en la nube',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=TH;'));

    //Backend los miercoles
  final DateTime backendmiercoles = DateTime(today.year, today.month, today.day, 9, 0, 0);
  meetings.add(Appointment(
    startTime: backendmiercoles,
    endTime: backendmiercoles.add(const Duration(hours: 2)),
    subject: 'Desarrollo Backend',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=WE;'));

  //Backend los viernes
  final DateTime backendviernes = DateTime(today.year, today.month, today.day, 10, 0, 0);
  meetings.add(Appointment(
    startTime: backendviernes,
    endTime: backendviernes.add(const Duration(hours: 3)),
    subject: 'Desarrollo Backend',
    color: Colors.blue,
    recurrenceRule: 'FREQ=WEEKLY;BYDAY=FR;'));

  return meetings;

}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}