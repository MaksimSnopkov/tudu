import 'package:flutter/material.dart';
import 'package:tudu/features/family/presentation/pages/family_page/widgets/participants_panel.dart';

class FamilyParticipants extends StatelessWidget {
  const FamilyParticipants({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 366,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ParticipantsPanel(userName: 'maksim', userRole: 'admin'),
      ),
    );
  }
}
