import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';

import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  Widget _buildDetails() {
    return ListView(
      children: [
        TitleSectionWidget(viewModel: viewModel),
        const ActionBarWidget(),
        DescriptionWidget(viewModel: viewModel),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                const HeaderImageWidget(),
                TitleSectionWidget(viewModel: viewModel),
                const ActionBarWidget(),
                DescriptionWidget(viewModel: viewModel),
                BookingControlsWidget(viewModel: viewModel),
              ],
            );
          }

          return Row(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox.expand(
                  child: const HeaderImageWidget(
                    isLandscape: true,
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: _buildDetails(),
              ),
            ],
          );
        },
      ),
    );
  }
}