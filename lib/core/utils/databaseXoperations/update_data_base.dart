import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
Future<void> dataBaseUpdater() async {
  print("in database updater");
  FirebaseFirestore db = FirebaseFirestore.instance;
  var userDocRef = db.collection('users').doc('teKESef7NCcCZwGgZzjSlfVsNgG2');
  // added

  String bookName = "leave the world behind";
  String pageNAme = "page_35";
  Map theData = {
    "xk5wtcbtaskm": {
      "arabic_phrase": "نحن بحاجة للوصول إلى ذلك المخبأ\nأخبرنا داني عن،",
      "english_phrase": "we need to get to that bunker\nDanny told us about,",
      "user_english_phrase": "",
      "count": 1
    },
    "0faar2vp6qnp": {
      "arabic_phrase": "وعلينا أن نصل إلى هناك الآن.",
      "english_phrase": "and we need to get there now.",
      "user_english_phrase": "",
      "count": 2
    },
    "lcxyczd7ovmk": {
      "arabic_phrase": "ما الذي تتحدث عنه؟",
      "english_phrase": "What are you talking about?",
      "user_english_phrase": "",
      "count": 3
    },
    "c7h3bvy6ezi6": {
      "arabic_phrase": "أنت تعرف شيئًا ما.",
      "english_phrase": "You know something.",
      "user_english_phrase": "",
      "count": 4
    },
    "8hs09kgjmvnk": {
      "arabic_phrase": "كان لدي شك تسلل،\nولكني أردت المزيد من المعلومات أولاً.",
      "english_phrase": "I had a sneaking suspicion,\nbut I wanted more information first.",
      "user_english_phrase": "",
      "count": 5
    },
    "rk3xf09rar0a": {
      "arabic_phrase": "كل العلامات كانت موجودة بالتأكيد، لكني...",
      "english_phrase": "All signs were there, sure, but I…",
      "user_english_phrase": "",
      "count": 6
    },
    "k14l6o23u43v": {
      "arabic_phrase": "لم أرغب في إخافة أحد.",
      "english_phrase": "I didn't want to scare anyone.",
      "user_english_phrase": "",
      "count": 7
    },
    "h4yqicnzo8qo": {
      "arabic_phrase": "كنت ستدعوني بالجنون\nلأنه جنون.",
      "english_phrase": "You'd have called me crazy\nbecause it is crazy.",
      "user_english_phrase": "",
      "count": 8
    },
    "dm24evr9nzz1": {
      "arabic_phrase": "كان من الممكن أن يكون الأمر أكثر منطقية لو كنا كذلك\nعلى شفا غزو شامل،",
      "english_phrase": "It would have made more sense if we were\non the brink of an all-out invasion,",
      "user_english_phrase": "",
      "count": 9
    },
    "h5v3rgnvw9g2": {
      "arabic_phrase": "ولكن هذا…",
      "english_phrase": "but this…",
      "user_english_phrase": "",
      "count": 10
    },
    "b2cbegpcy6fb": {
      "arabic_phrase": "لم أكن أعتقد أننا سنسمح بذلك بالفعل\nشيء من هذا القبيل يحدث.",
      "english_phrase": "I didn't think we'd actually let\nsomething like this happen.",
      "user_english_phrase": "",
      "count": 11
    },
    "b0gwpv2tn9wr": {
      "arabic_phrase": "اعتقدت أننا أذكى من ذلك.",
      "english_phrase": "I thought we were smarter than that.",
      "user_english_phrase": "",
      "count": 12
    },
    "bvidfl5idi9h": {
      "arabic_phrase": "دع ماذا يحدث؟",
      "english_phrase": "Let what happen?",
      "user_english_phrase": "",
      "count": 13
    },
    "56qsyngxoka9": {
      "arabic_phrase": "لأن عميلي الأساسي\nيعمل في قطاع الدفاع",
      "english_phrase": "Because my primary client\nworks in the defense sector,",
      "user_english_phrase": "",
      "count": 14
    },
    "0yentck6xh4z": {
      "arabic_phrase": "أقضي الكثير من الوقت في دراسة التكلفة\nتحليل فوائد الحملات العسكرية.",
      "english_phrase": "I spend a lot of time studying the cost\nbenefit analysis of military campaigns.",
      "user_english_phrase": "",
      "count": 15
    },
    "ra1r3frz9ban": {
      "arabic_phrase": "كان هناك برنامج واحد على وجه الخصوص\nهذا ما أرعب موكلي أكثر من غيره.",
      "english_phrase": "There was one program in particular\nthat terrified my client the most.",
      "user_english_phrase": "",
      "count": 16
    },
    "7uuzddewt414": {
      "arabic_phrase": "مناورة بسيطة من ثلاث مراحل يمكنها ذلك\nإسقاط حكومة دولة من الداخل.",
      "english_phrase": "A simple three-stage maneuver that could\ntopple a country's government from within.",
      "user_english_phrase": "",
      "count": 17
    },
    "z2idjc7zysph": {
      "arabic_phrase": "المرحلة الأولى هي العزلة.",
      "english_phrase": "The first stage is isolation.",
      "user_english_phrase": "",
      "count": 18
    },
    "gmeiq1oejyzq": {
      "arabic_phrase": "<i>قم بتعطيل اتصالاتهم\nوالمواصلات.</i>",
      "english_phrase": "<i>Disable their communication\nand transportation.</i>",
      "user_english_phrase": "",
      "count": 19
    },
    "52kmyzl55wi2": {
      "arabic_phrase": "<i>اجعل الهدف أصمًا وأبكمًا\nومشلول قدر الإمكان،</i>",
      "english_phrase": "<i>Make the target as deaf, dumb\nand paralyzed as possible,</i>",
      "user_english_phrase": "",
      "count": 20
    },
    "ih1rlkshtx5u": {
      "arabic_phrase": "<i>إعدادهم للمرحلة الثانية.</i>",
      "english_phrase": "<i>setting them up for the second stage.</i>",
      "user_english_phrase": "",
      "count": 21
    },
    "u4e619boefcd": {
      "arabic_phrase": "الفوضى المتزامنة.",
      "english_phrase": "Synchronized chaos.",
      "user_english_phrase": "",
      "count": 22
    },
    "h7bqyjwnornr": {
      "arabic_phrase": "<i>ترويعهم بهجمات سرية\nوالمعلومات الخاطئة،</i>",
      "english_phrase": "<i>Terrorize them with covert attacks\nand misinformation,</i>",
      "user_english_phrase": "",
      "count": 23
    },
    "lr3y4pxr9noz": {
      "arabic_phrase": "<i>تطغى على قدراتهم الدفاعية</i>",
      "english_phrase": "<i>overwhelming their defense capabilities</i>",
      "user_english_phrase": "",
      "count": 24
    },
    "1uqhrf7vevq5": {
      "arabic_phrase": "<i>ترك أنظمة الأسلحة الخاصة بهم عرضة للخطر\nللمتطرفين وجيشهم.</i>",
      "english_phrase": "<i>leaving their weapon systems vulnerable\nto extremists and their own military.</i>",
      "user_english_phrase": "",
      "count": 25
    },
    "i15l5qvl1r7t": {
      "arabic_phrase": "<i>بدون عدو واضح أو دافع،\nسيبدأ الناس في الانقلاب على بعضهم البعض.</i>",
      "english_phrase": "<i>Without a clear enemy or motive,\npeople would start turning on each other.</i>",
      "user_english_phrase": "",
      "count": 26
    },
    "14qcqzrq0fgb": {
      "arabic_phrase": "إذا تم ذلك بنجاح،\nأما المرحلة الثالثة فستحدث من تلقاء نفسها.",
      "english_phrase": "If done successfully,\nthe third stage would happen on its own.",
      "user_english_phrase": "",
      "count": 27
    },
    "pn656sya9vsb": {
      "arabic_phrase": "ما هي المرحلة الثالثة؟",
      "english_phrase": "What's the third stage?",
      "user_english_phrase": "",
      "count": 28
    },
    "uebrn0mi5pt9": {
      "arabic_phrase": "الانقلاب.",
      "english_phrase": "Coup d'état.",
      "user_english_phrase": "",
      "count": 29
    },
    "iuh5nr1gogje": {
      "arabic_phrase": "حرب أهلية.",
      "english_phrase": "Civil war.",
      "user_english_phrase": "",
      "count": 30
    },
    "78vkvvtcu98l": {
      "arabic_phrase": "طي.",
      "english_phrase": "Collapse.",
      "user_english_phrase": "",
      "count": 31
    },
    "na5liwnlhvja": {
      "arabic_phrase": "تم النظر في هذا البرنامج\nالطريقة الأكثر فعالية من حيث التكلفة",
      "english_phrase": "This program was considered\nthe most cost-effective way",
      "user_english_phrase": "",
      "count": 32
    },
    "m9imm74m3w7w": {
      "arabic_phrase": "لزعزعة استقرار البلاد.",
      "english_phrase": "to destabilize a country.",
      "user_english_phrase": "",
      "count": 33
    },
    "66tll1xycd3i": {
      "arabic_phrase": "لأنه إذا كانت الأمة المستهدفة\nكان مختلاً بما فيه الكفاية،",
      "english_phrase": "Because if the target nation\nwas dysfunctional enough,",
      "user_english_phrase": "",
      "count": 34
    },
    "64m6pb8qtfpt": {
      "arabic_phrase": "سيقوم هذا العمل بالنيابة عنك.",
      "english_phrase": "it would, in essence, do the work for you.",
      "user_english_phrase": "",
      "count": 35
    },
    "1onmm10i3s5o": {
      "arabic_phrase": "من بدأ هذا\nيريد منا أن ننتهي منه.",
      "english_phrase": "Whoever started this\nwants us to finish it.",
      "user_english_phrase": "",
      "count": 36
    },
    "qchx4sm4yj3g": {
      "arabic_phrase": "روز!",
      "english_phrase": "Rose!",
      "user_english_phrase": "",
      "count": 37
    }
  };

  // Get the current data
  try {
    DocumentSnapshot userDoc = await userDocRef.get();
    Map<String, dynamic>? theDataBaseAsJson = userDoc.data() as Map<String, dynamic>?;

    // Check if 'books' field exists
    if (theDataBaseAsJson != null && theDataBaseAsJson.containsKey('books')) {
      // If 'books' field exists, update it by adding a new page
      Map<String, dynamic> booksData = theDataBaseAsJson['books'];
      booksData[bookName] ??= {};
      booksData[bookName][pageNAme] = theData;

      // Atomically update the 'books' field with the modified data
      await userDocRef.update({
        "books": booksData,
      });
    } else {
      // If 'books' field doesn't exist, create it with the new page
      await userDocRef.update({
        "books": {
          bookName: {
            pageNAme : theData,
          },
        },
      });
    }

    print("Supposed to be updated");
    print(pageNAme);
  } catch (e) {
    print("Error updating document: $e");
  }
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
