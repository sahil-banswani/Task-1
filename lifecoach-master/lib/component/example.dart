// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class ExampleWidget extends StatefulWidget {
//   @override
//   State<ExampleWidget> createState() => _ExampleWidgetState();
// }

// class _ExampleWidgetState extends State<ExampleWidget> {
//   final Function useocation = uselocation();





//   @override
//   Widget build(BuildContext context) {
//     final location = useLocation();
//     var propsData = location.state;

//     print(propsData);

//     final tabs = useState(<dynamic>[]);
//     final types = useState(<dynamic>[]);
//     final tab = useState(null);
//     final score = useState("");

//     final mcqs = useState(<dynamic>[]);

//     useEffect(() {
//       getData();
//     }, [propsData]);

//     final scoreList = useState(<dynamic>[]);

//     Future<void> getData() async {
//       score.value = "";
//       setShow(false);

//       final responseTopNav = await lifeCoachTopNav(propsData?.id);

//       if (responseTopNav?.length > 0) {
//         if (responseTopNav?.length > 0) {
//           tabs.value = responseTopNav;

//           final responeTypes =
//               await lifeCoachTypes(responseTopNav[0]?.id);
//           tab.value = responseTopNav[0]?.id;
//           if (responeTypes != null) {
//             types.value = responeTypes;
//           }

//           final responseQtns =
//               await getQtns(propsData?.id, responseTopNav[0]?.id);

//           if (responseQtns?.message == null) {
//             mcqs.value = responseQtns;
//           }

//           final responseScore =
//               await getSore(propsData?.id, responseTopNav[0]?.id);

//           if (responseScore?.message == null) {
//             scoreList.value = responseScore;
//           }
//         }
//       } else {
//         tabs.value = <dynamic>[];
//         types.value = <dynamic>[];
//         mcqs.value = <dynamic>[];
//         scoreList.value = <dynamic>[];
//       }
//     }

//     return Container();
//   }
// }