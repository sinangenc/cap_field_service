using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

namespace com.sinangenc.fieldservice;

entity Users : cuid, managed {
    //key ID        : UUID;
    firstName : String(50) @mandatory;
    lastName  : String(50) @mandatory;
    @assert.format: '/^\S+@\S+\.\S+$/'
    @assert.format.message: 'Provide a valid email address'
    email     : String(100) @mandatory;
    phone     : String(30);
    isActive  : Boolean default true;
}

entity Customers : cuid, managed {
    //key ID        : String;
    firstName    : String @mandatory;
    lastName     : String @mandatory;
    name         : String = trim(firstName || ' ' || lastName);
    @assert.format: '/^\S+@\S+\.\S+$/'
    @assert.format.message: 'Provide a valid email address'
    email        : String(100) @mandatory;
    phone        : String(30);
    callRequests : Association to many CallRequests
                       on callRequests.customer = $self;
}

entity CallRequests : cuid, managed {
    //key ID          : UUID;
    customer    : Association to one Customers @mandatory @assert.target;
    description : String @mandatory;
    status      : CallRequestStatus @mandatory @assert.range: true;
    urgency     : CallRequestUrgency @mandatory @assert.range: true;
    assignedTo: Association to Users;
    worklogs    : Composition of many Worklogs
                      on worklogs.parent = $self;
}

entity Worklogs : cuid, managed {
    parent        : Association to one CallRequests @mandatory @assert.target;
    description   : String @mandatory;
    durationHours : Decimal(5, 2) @mandatory;
    price         : Price @mandatory;
}

type CallRequestStatus  : String enum {
    New = 'N';
    Assigned = 'A';
    InProgress = 'I';
    Resolved = 'R';
    Cancelled = 'C';
}

type CallRequestUrgency : String enum {
    Low = 'L';
    Medium = 'M';
    High = 'H';
}

type Price {
    amount   : Decimal(15, 2);
    currency : Currency;
}


/* Annotations for Concurrency Control */

annotate Users with {
    modifiedAt @odata.etag
};

annotate CallRequests with {
    modifiedAt @odata.etag
};

annotate Customers with {
    modifiedAt @odata.etag
};

annotate Worklogs with {
    modifiedAt @odata.etag
};