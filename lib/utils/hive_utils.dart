import 'package:hive/hive.dart';
import 'package:magic/models/session.dart';


class HiveUtils{
  
  
  static Future<List<Session> >getStoredSessions()async
  {
    var box = await Hive.openBox<Session>('sessions');
    return box.values.toList();
  }

  static Future<bool> storeSession(Session session)async
  {
    var box = await Hive.openBox<Session>('sessions');
    try{
      for (var element in box.values){
        if(element.date.isAtSameMomentAs(session.date))
        {
          await deleteSession(session);
        }
      }
      await box.add(session);
    }catch(exception)
    {
      return false;
    }
    return true;
  }

  static Future<bool> deleteSession(Session session)async
  {
    var box = await Hive.openBox<Session>('sessions');
    try{
      for(int i=0; i<box.values.length; i++)
        {
          if(box.values.elementAt(i).date==session.date)
            {
              await box.deleteAt(i);
            }
        }
    }catch(exception)
    {
      return false;
    }
    return true;
  }

}