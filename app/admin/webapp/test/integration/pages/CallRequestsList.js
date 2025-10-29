sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.sinangenc.fieldservice.admin.admin',
            componentId: 'CallRequestsList',
            contextPath: '/CallRequests'
        },
        CustomPageDefinitions
    );
});