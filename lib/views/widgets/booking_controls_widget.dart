import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      viewModel.selectDate(pickedDate);
    }
  }

  String _dateText() {
    final date = viewModel.selectedDate;

    if (date == null) {
      return 'Choose a visit date';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Booking Preferences',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.calendar_month),
            title: const Text('Visit Date'),
            subtitle: Text(_dateText()),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () => _pickDate(context),
          ),

          const SizedBox(height: 8),

          const Text('Cruise Package'),

          const SizedBox(height: 6),

          DropdownButtonFormField<String>(
            value: viewModel.selectedPackage,
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            items: viewModel.cruisePackages.map((package) {
              return DropdownMenuItem<String>(
                value: package,
                child: Text(package),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                viewModel.selectPackage(value);
              }
            },
          ),

          const SizedBox(height: 8),

          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dark Mode'),
            value: viewModel.isDarkMode,
            onChanged: viewModel.toggleTheme,
          ),
        ],
      ),
    );
  }
}