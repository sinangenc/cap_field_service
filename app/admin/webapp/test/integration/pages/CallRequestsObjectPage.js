sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.sinangenc.fieldservice.admin.admin',
            componentId: 'CallRequestsObjectPage',
            contextPath: '/CallRequests'
        },
        CustomPageDefinitions
    );
});