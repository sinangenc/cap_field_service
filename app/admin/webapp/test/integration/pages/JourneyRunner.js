sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/sinangenc/fieldservice/admin/admin/test/integration/pages/CallRequestsList",
	"com/sinangenc/fieldservice/admin/admin/test/integration/pages/CallRequestsObjectPage"
], function (JourneyRunner, CallRequestsList, CallRequestsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/sinangenc/fieldservice/admin/admin') + '/test/flp.html#app-preview',
        pages: {
			onTheCallRequestsList: CallRequestsList,
			onTheCallRequestsObjectPage: CallRequestsObjectPage
        },
        async: true
    });

    return runner;
});

