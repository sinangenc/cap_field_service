const cds = require('@sap/cds')

class AdminService extends cds.ApplicationService {
    init(){

        const {CallRequests} = this.entities

        this.before(['CREATE', 'UPDATE'], CallRequests, this.determineCallRequestStatus);

        this.on('startCallRequest', this.startCallRequest);

        super.init();
    }

    determineCallRequestStatus(req){
        // const { dateOfBirth, dateOfDeath } = req.data;
        // if (!dateOfBirth || !dateOfDeath) {
        //     return;
        // }

        // const birth = new Date(dateOfBirth);
        // const dead = new Date(dateOfDeath);

        // if (dead < birth) {
        //     req.error(`The date of death (${dateOfDeath}) is before the date of birth (${dateOfBirth}).`);
        // }
    }

    startCallRequest(req){

    }
}

module.exports = AdminService