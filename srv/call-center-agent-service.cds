using com.sinangenc.fieldservice as db from '../db/schema';

service CallCenterAgentService @(path:'agent') {

    entity Users as projection on db.Users{
        ID,
        firstName,
        lastName,
    };

}