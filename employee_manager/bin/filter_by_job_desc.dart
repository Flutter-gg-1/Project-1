// function to filter employees by job description
List filterByJobDesc({required String jobDesc, required Map employees}) {
  List filteredEmployees = [];
  for(var employee in employees.values) {
    if(employee.jobDesc.contains(jobDesc)) {
      filteredEmployees.add(employee);
    }
  }
  return filteredEmployees;
}