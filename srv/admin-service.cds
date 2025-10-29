using com.sinangenc.fieldservice as db from '../db/schema';

service AdminService @(path:'admin') {
    entity Users as projection on db.Users;
    entity CallRequests as projection on db.CallRequests;
    entity Customers as projection on db.Customers;

    // Actions
    action startCallRequest(callRequest: db.CallRequests:ID) returns Boolean;

}