import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/app/show_error_bar.dart';
import 'package:roadshare/core/widgets/custom_trip_text_field.dart';
import 'package:roadshare/features/home/presentation/cubit/cubit/home_cubit.dart';
import 'package:roadshare/features/home/presentation/views/widgets/history_view_item.dart';
import 'package:roadshare/generated/l10n.dart';

class PickDestinationWidget extends StatefulWidget {
  const PickDestinationWidget({super.key, this.onSendSuccess});
  final VoidCallback? onSendSuccess; // 👈 callback

  @override
  State<PickDestinationWidget> createState() => _PickDestinationWidgetState();
}

class _PickDestinationWidgetState extends State<PickDestinationWidget> {
  final dropDestinationController = TextEditingController();
  final currentController = TextEditingController();

  @override
  initState() {
    final String? currentAddress =
        context.read<HomeCubit>().state is HomeSuccess
            ? (context.read<HomeCubit>().state as HomeSuccess).address
            : null;
    if (currentAddress != null) {
      currentController.text = currentAddress;
    } else {
      context.read<HomeCubit>().getCurrentLocation();
    }
    super.initState();
  }

  @override
  void dispose() {
    dropDestinationController.dispose();
    currentController.dispose();
    super.dispose();
  }

  void _handleSend() async {
    final String startAddress = currentController.text.trim();
    final String destinationAddress = dropDestinationController.text.trim();

    if (destinationAddress.isEmpty) {
      showErrorBar(context, "Please enter a destination");
      return;
    }
    await context.read<HomeCubit>().buildRouteFromText(
      startAddress: startAddress,
      destinationAddress: destinationAddress,
    );
    widget.onSendSuccess?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          currentController.text = state.address!;
        } else if (state is RouteReady) {
          print ("  start is  + $state.start");
          print ("  destination is  + $state.destination");
        } else if (state is HomeFailure) {
          showErrorBar(context, state.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).request_ride, style: TextStyles.semiBold16),
            const SizedBox(height: 10),
            /// 🔹 Current Location Editable
            CustomTripTextField(
              controller: currentController,
              hintText: currentController.text,
              prefixIcon: const Icon(Icons.my_location),
            ),
            const SizedBox(height: 10),
            CustomTripTextField(
              controller: dropDestinationController,
              hintText: S.of(context).PickupLocation,
              prefixIcon: const Icon(Icons.location_on_outlined),
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: AppColors.routePolyline),
                onPressed: _handleSend,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Expanded(child: HistoryViewItem()),
          ],
        ),
      ),
    );
  }
}
