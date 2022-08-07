class AppUserPermissions {
  late int permissionId;
  late String permissionLevel;
}

class AppUser {
  late int workerId;
  late String workerName;
  late String jwtToken;
  late List<AppUserPermissions> permissions;
}
