// function to filter employees by permission
List filterByPermission({required String permission, required Map employees}) {
  List filteredEmployees = [];
  for(var employee in employees.values) {
    if(employee.permissions.contains(permission)) {
      filteredEmployees.add(employee);
    }
  }
  return filteredEmployees;
}