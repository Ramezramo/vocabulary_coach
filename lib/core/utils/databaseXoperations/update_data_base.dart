import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
Future dataBaseUpdater() async {
  print("in data base updater");
  FirebaseFirestore db = FirebaseFirestore.instance;
  var washingtonRef = db.collection('users').doc('teKESef7NCcCZwGgZzjSlfVsNgG2');
  Map theData = {
    "hq1pwp571tfm": {
      "arabic_phrase": "\"\"لكن انت",
      "english_phrase": "“But you are",
      "count": 1,
      "user_english_phrase":""
    },
    "vq3vtmqww7c4": {
      "arabic_phrase": "\"\n\"حسنًا، حافظ على هذا الموقف ولن تتعلم شيئًا",
      "english_phrase": "” “Well, \nkeep that attitude and you’ll learn nothing",
      "count": 2,
      "user_english_phrase":""
    },
    "a51fkrtxnrfc": {
      "arabic_phrase": "حافظ على الموقف القائل بأنني المشكلة،\n وما هي الخيارات المتاحة لك؟\n\"حسنًا، إذا لم تدفع لي المزيد أو تظهر لي المزيد من الاحترام وتعلمني،\n فسوف أستقيل\"",
      "english_phrase": "Keep the attitude that I’m the problem ,\nand what choices do you have?”\n“Well, if you don’t pay me more or show me more respect and teach me, \nI’ll quit",
      "count": 3,
      "user_english_phrase":""
    },
    "r6vkpfrjxouz": {
      "arabic_phrase": "قال الأب الغني: \"حسنًا\"",
      "english_phrase": "”\n“Well put,” rich dad said",
      "count": 4,
      "user_english_phrase":""
    },
    "33v737wjasq6": {
      "arabic_phrase": "\"وهذا بالضبط ما يفعله معظم الناس",
      "english_phrase": "“And that’s exactly what most people do",
      "count": 5,
      "user_english_phrase":""
    },
    "91fes9ncvi42": {
      "arabic_phrase": "لقد استقالوا وذهبوا للبحث عن وظيفة أخرى، وفرصة أفضل\n، وأجر أعلى،\n معتقدين في الواقع أن هذا سيحل المشكلة",
      "english_phrase": "Th ey quit and go looking for another job, a better opportunity, and higher pay, actually thinking that this will solve the problem",
      "count": 6,
      "user_english_phrase":""
    },
    "nm0n506ntpkk": {
      "arabic_phrase": "وفي أغلب الحالات لن يحدث ذلك",
      "english_phrase": "In most cases, it won’t",
      "count": 7,
      "user_english_phrase":""
    },
    "8vzmg0b05xzf": {
      "arabic_phrase": "\"\n\"اذا ماذا يجب أن أفعل؟\" انا سألت",
      "english_phrase": "”\n“So what should I do?” I asked",
      "count": 8,
      "user_english_phrase":""
    },
    "eukjeeojpjk5": {
      "arabic_phrase": "\"فقط خذ هذه العشرة سنتات في الساعة وابتسم؟\"\nابتسم الأب الغني",
      "english_phrase": "“Just take this measly 10 cents an hour and smile?”\nRich dad smiled",
      "count": 9,
      "user_english_phrase":""
    },
    "27gufrzq70am": {
      "arabic_phrase": "\"هذا ما يفعله الآخرون",
      "english_phrase": "“T h at’s what the other people do",
      "count": 10,
      "user_english_phrase":""
    },
    "cq6qzrmjjhto": {
      "arabic_phrase": "ولكن هذا هو كل ما يفعلونه، حيث ينتظرون الزيادة معتقدين أن المزيد من المال سيحل مشاكلهم",
      "english_phrase": "But that’s all they do, waiting for a raise thinking that more money will solve their problems",
      "count": 11,
      "user_english_phrase":""
    },
    "ftndzgi7xrfi": {
      "arabic_phrase": "معظمهم يقبلون ذلك فحسب، والبعض يأخذ وظيفة ثانية ويعملون بجدية أكبر، لكنهم يقبلون مرة أخرى راتبًا صغيرًا",
      "english_phrase": "Most just accept it, and some take a second job working harder, but again accepting a small paycheck",
      "count": 12,
      "user_english_phrase":""
    },
    "z2g03pjh9qcr": {
      "arabic_phrase": "جلست أحدق في الأرض،\n وبدأت أفهم الدرس الذي كان أبي الغني يقدمه لي",
      "english_phrase": "” I sat staring at the fl oor, beginning to understand the lesson rich dad was presenting",
      "count": 13,
      "user_english_phrase":""
    },
    "r7bt6cdgioqr": {
      "arabic_phrase": "لقد شعرت أنه كان طعم الحياة",
      "english_phrase": "I could sense it was a taste of life",
      "count": 14,
      "user_english_phrase":""
    },
    "u3hmuzdspeek": {
      "arabic_phrase": "وأخيراً نظرت إلى الأعلى وسألته: \"إذن ما الذي سيحل المشكلة؟\"\n\"هذا هو،\n\" قال وهو يميل إلى الأمام في كرسيه ويربت على رأسي بلطف",
      "english_phrase": "Finally, I looked up and asked, “So what will solve the problem?”\n“T h is,” he said, leaning forward in his chair and tapping me gently on the head",
      "count": 15,
      "user_english_phrase":""
    },
    "mgb2xyhsqvcf": {
      "arabic_phrase": "\"هناك أشياء بين أذنيك",
      "english_phrase": "“This stuff between your ears",
      "count": 16,
      "user_english_phrase":""
    },
    "y5daj5o09xib": {
      "arabic_phrase": "\"\nفي تلك اللحظة، شارك أبي الغني وجهة النظر المحورية التي فصلته عن موظفيه وأبي الفقير،\n وقادته إلى أن يصبح في النهاية واحدًا من أغنى الرجال في هاواي،\n بينما كان والدي المتعلم تعليمًا عاليًا والفقير يعاني ماليًا طوال الوقت",
      "english_phrase": "”\nIt was at that moment that rich dad shared the pivotal point of view that separated him from his employees and my poor dad—and led him to eventually become one of the richest men in Hawaii, while my highly educated but poor dad struggled fi nancially all his life",
      "count": 17,
      "user_english_phrase":""
    },

    "4fmu1ob3tc9a": {
      "arabic_phrase": "لقد كانت وجهة نظر فريدة هي التي أحدثت كل الفارق على مدى الحياة",
      "english_phrase": "It was a singular point of view that made all the difference over a lifetime ",
      "count": 19,
      "user_english_phrase":""
    },
    "lyimnvmzhbwk": {
      "arabic_phrase": "وقد شرح الأب الغني وجهة النظر هذه مراراً وتكراراً،\n وهو ما أسميه الدرس الأول: الفقراء والطبقة الوسطى يعملون من أجل المال",
      "english_phrase": " Rich Father has repeatedly explained this point of view, which I call lesson number one: The poor and the middle class work for money  ",
      "count": 20,
      "user_english_phrase":""
    },
    "hlb2jw5sykjn": {

      "arabic_phrase": "الأغنياء لديهم المال يعمل لصالحهم",
      "english_phrase": "The rich have money work for them ,",
      "count": 21,
      "user_english_phrase":""
    },
    "um5k8yw9fvo3": {
      "arabic_phrase": "في صباح يوم السبت المشرق هذا،\n تعلمت وجهة نظر مختلفة تمامًا عما علمني إياه والدي المسكين",
      "english_phrase": "On that bright Saturday morning, I learned a completely dif f erent point of view from what I had been taught by my poor dad ",
      "count": 22,
      "user_english_phrase":""
    },
    "ja5k8kbdhy2j": {
      "arabic_phrase": "عندما كنت في التاسعة من عمري، أدركت أن كلا والدي يريدان مني أن أتعلم",
      "english_phrase": "At the age of nine, I understood that both dads wanted me to learn ",
      "count": 23,
      "user_english_phrase":""
    },
    "y9crq5eemmcl": {
      "arabic_phrase": "لقد شجعني كلا الأبوين على الدراسة،\n لكن ليس نفس الأشياء",
      "english_phrase": "Both dads encouraged me to study, but not the same things",
      "count": 24,
      "user_english_phrase":""
    }
  };
  Map<String, dynamic> newBookData = {
    "poordadrichdad": {
      "page22": theData
    }
  };

  // Atomically update the 'books' field with the new data.
 await washingtonRef.update({
    "books": newBookData,
  });
 print("supposed to be updated");
}
void updateTheUserTranslation(phraseRandomName,bookName, pageName, theTranslation) async {
  print("in data base updater");
  FirebaseFirestore db = FirebaseFirestore.instance;

  // Replace 'teKESef7NCcCZwGgZzjSlfVsNgG2' with the actual user ID
  String userId = 'teKESef7NCcCZwGgZzjSlfVsNgG2';

  // Reference to the specific document
  DocumentReference userRef = db.collection('users').doc(userId);

  // Update the specific field
  try {
    await userRef.update({
      'books.$bookName.$pageName.$phraseRandomName.user_english_phrase': theTranslation,
    });

    print('User translation updated successfully.');
  } catch (e) {
    print('Error updating user translation: $e');
  }
}
