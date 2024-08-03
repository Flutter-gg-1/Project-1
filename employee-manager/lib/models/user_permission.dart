/*
*
* An enumeration representing different levels of user permissions.
*
* */
enum UserPermission {
  // Admin can (CRUD) everything even permission
  admin,

  // Manager can (CRUD) employee data
  manager,

  // Employee can (Read) his data only
  employee
}
