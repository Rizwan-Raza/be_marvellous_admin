import 'package:be_marvellous_admin/models/general.dart';
import 'package:be_marvellous_admin/models/watchlist.dart';
import 'package:be_marvellous_admin/services/settings_service.dart';
import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:be_marvellous_admin/widgets/text-form-field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late GeneralSettings _generalSettings;
  late WatchListSettings _watchListSettings;

  @override
  void initState() {
    super.initState();
    _generalSettings =
        Provider.of<SettingServices>(context, listen: false).generalSettings;
    _watchListSettings =
        Provider.of<SettingServices>(context, listen: false).watchListSettings;
  }

  bool loading = true;
  bool saving = false;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getTextFormField(
                      "Hostname",
                      Icons.domain,
                      TextInputType.url,
                      "Please enter scrap hostname",
                      "hostname",
                      _generalSettings.hostname,
                    ),
                    getTextFormField(
                      "Watchlist Link",
                      Icons.link,
                      TextInputType.url,
                      "Please enter watchlistLink",
                      "watchlistLink",
                      _watchListSettings.watchListLink,
                    ),
                    getTextFormField(
                        "No of Pages",
                        Icons.auto_stories,
                        TextInputType.number,
                        "Please enter no of pages",
                        "pages",
                        _watchListSettings.pages.toString()),
                    getTextFormField(
                        "Limit",
                        Icons.format_list_numbered,
                        TextInputType.number,
                        "Please enter the limit",
                        "limit",
                        _watchListSettings.limit.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                } else {
                                  return;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  saving ? "Saving ..." : "Save",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget getTextFormField(
      String label,
      IconData icon,
      TextInputType keyboardType,
      String errorText,
      String fKey,
      String initialValue) {
    return CustomTextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      label: label,
      icon: icon,
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        }
        return null;
      },
      onSaved: (value) {
        setState(() {
          saving = true;
        });
        _settingServices.setSetting(fKey, value!).then((value) => {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                backgroundColor: Colors.yellow[100],
                actions: [
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    },
                  )
                ],
                content: Text('Changes saved'),
              )),
              setState(() {
                saving = false;
              }),
              Future.delayed(const Duration(seconds: 5),
                  ScaffoldMessenger.of(context).clearMaterialBanners)
            });
      },
    );
  }
}
