import 'package:flutter/material.dart';
import 'package:kafiil_taskt/presentation/widgets/container_widget.dart';
import 'package:kafiil_taskt/presentation/widgets/text_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../domain/token.dart';
import '../../domain/user_profile_provider.dart';
import '../widgets/circle_image_widget.dart';
import '../widgets/favourite_social_widget.dart';
import '../widgets/gender_widget.dart';
import '../widgets/multiline_text_field.dart';
import '../widgets/text_form_field_widget.dart';
import '../widgets/user_type_radio.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final token = Provider.of<Token>(context, listen: false).token;
    Provider.of<UserProfileProvider>(context, listen: false)
        .fetchUserProfile(token);
  }

  @override
  Widget build(BuildContext context) {
    final profileViewModel = Provider.of<UserProfileProvider>(context);
    final mediaQuery = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: profileViewModel.isLoading
          ? Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black,
                size: 100,
              ),
            )
          : profileViewModel.userProfile == null
              ? const Center(child: Text('No profile data available'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: 'Who Am I',
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleImageWidget(
                          imageFile: Image.network(
                            profileViewModel.userProfile?.avatar ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            defaultValue:
                                profileViewModel.userProfile?.firstName ?? '',
                            label: 'First Name',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormFieldWidget(
                            defaultValue:
                                profileViewModel.userProfile?.lastName ?? '',
                            label: 'Last Name',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                      ],
                    ),
                    TextFormFieldWidget(
                      defaultValue: profileViewModel.userProfile?.email ?? '',
                      label: 'Email Address',
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains('@')) {
                          return 'Enter a valid Email Address';
                        }
                        return null;
                      },
                      autocorrect: false,
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                    ),
                    UserTypeRadio(
                      selectedRole: profileViewModel.userProfile?.userType ?? 0,
                    ),
                    MultilineTextField(
                      label: 'About',
                      controller: TextEditingController(
                        text: profileViewModel.userProfile?.about ?? '',
                      ),
                    ),
                    ContainerWidget(
                      label: 'Salary',
                      child: TextWidget(
                        text:
                            'SAR ${profileViewModel.userProfile?.salary ?? ''}',
                        size: 17,
                      ),
                      height: mediaQuery.height / 12,
                    ),
                    ContainerWidget(
                      label: 'Birth Date',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: profileViewModel.userProfile?.birthDate ?? '',
                            size: 17,
                          ),
                          const Icon(
                            Icons.date_range_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      height: mediaQuery.height / 12,
                    ),
                    GenderWidget(
                      genderbool: profileViewModel.userProfile?.gender == 1,
                    ),
                    const FavouriteSocialWidget(),
                  ],
                ),
    );
  }
}
