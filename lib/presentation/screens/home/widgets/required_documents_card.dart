import 'package:flutter/material.dart';

import '../../../widgets/required_action_card.dart';

class RequiredDocumentsCard extends StatelessWidget {
  const RequiredDocumentsCard({super.key});

  @override
  Widget build(BuildContext context) => const RequiredActionCard(
    orderNumber: 'FR-2026-001259',
    message:
        'يرجى إرفاق المستندات المطلوبة لاستكمال \n مراجعة طلب تأسيس الشركة.',
    compact: true,
    showIllustration: true,
  );
}
