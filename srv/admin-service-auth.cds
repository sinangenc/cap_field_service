using { AdminService.CallRequests, AdminService.Customers, AdminService.Users } from './admin-service';

annotate Users with @(requires: 'admin');
//annotate CallRequests with @(requires: 'admin');

annotate CallRequests with @odata.draft.enabled; 
