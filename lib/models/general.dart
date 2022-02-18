class GeneralSettings {
  String hostname;

  GeneralSettings({
    required this.hostname,
  });

  factory GeneralSettings.empty() => GeneralSettings(
        hostname: '',
      );

  factory GeneralSettings.fromMap(Map<String, dynamic> map) => GeneralSettings(
        hostname: map["hostname"],
      );

  Map<String, dynamic> toMap() => {
        "hostname": hostname,
      };

  @override
  String toString() {
    return 'GeneralSettings(hostname: $hostname)';
  }
}
