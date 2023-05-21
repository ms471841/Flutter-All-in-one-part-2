import 'package:flutter/material.dart';
import 'package:selectable_box/selectable_box.dart';

// class SubscriptionCard extends StatefulWidget {
//   final String plan;
//   final String price;
//   const SubscriptionCard({super.key, required this.plan, required this.price});

//   @override
//   State<SubscriptionCard> createState() => _SubscriptionCardState();
// }

// class _SubscriptionCardState extends State<SubscriptionCard> {
//   bool isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return SelectableBox(
//       height: 100,
//       width: double.maxFinite,
//       color: Colors.white,
//       selectedColor: Colors.white,
//       borderColor: Colors.grey,
//       selectedBorderColor: Colors.blue,
//       borderWidth: 1,
//       borderRadius: 10,
//       padding: const EdgeInsets.all(3),
//       animationDuration: const Duration(milliseconds: 200),
//       opacity: 0.5,
//       selectedOpacity: 1,
//       checkboxAlignment: Alignment.topRight,
//       checkboxPadding: const EdgeInsets.all(8),
//       selectedIcon: const Icon(
//         Icons.check_circle,
//         color: Colors.blue,
//       ),
//       unSelectedIcon: const Icon(
//         Icons.check_circle_outline,
//         color: Colors.grey,
//       ),
//       showCheckbox: true,
//       onTap: () {
//         setState(() {
//           isSelected = !isSelected;
//         });
//       },
//       isSelected: isSelected,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'UPGRADE TO',
//               style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 10,
//                   color: Color.fromRGBO(11, 91, 156, 1)),
//             ),
//             Text(
//               widget.plan,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             Text(
//               'Rs${widget.price}/year',
//               style: TextStyle(
//                 fontWeight: FontWeight.w900,
//                 fontSize: 15,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class SubscriptionCard extends StatelessWidget {
  final String plan;
  final String price;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  SubscriptionCard({
    Key? key,
    required this.plan,
    required this.price,
    required this.index,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableBox(
      height: 100,
      width: double.maxFinite,
      color: Colors.white,
      selectedColor: Colors.white,
      borderColor: Colors.grey,
      selectedBorderColor: Colors.blue,
      borderWidth: 2,
      borderRadius: 10,
      padding: const EdgeInsets.all(3),
      animationDuration: const Duration(milliseconds: 200),
      opacity: 0.5,
      selectedOpacity: 1,
      checkboxAlignment: Alignment.topRight,
      checkboxPadding: const EdgeInsets.all(0),
      selectedIcon: const Icon(
        Icons.check_circle,
        color: Colors.blue,
      ),
      unSelectedIcon: const Icon(
        Icons.check_circle_outline,
        color: Colors.grey,
      ),
      showCheckbox: isSelected,
      isSelected: isSelected,
      onTap: () => onTap(index),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'UPGRADE TO',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 10,
                color: Color.fromRGBO(11, 91, 156, 1),
              ),
            ),
            Text(
              plan,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Rs$price/year',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
