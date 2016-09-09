(function()
{
    'use strict';

     var app = angular
        .module('adminApp', [
            'lumx',
            'Controllers',
            'Directives',
            'Services'
        ])

    var controllerModule = angular.module('Controllers', []);
    var directiveModule = angular.module('Directives', []);
    var serviceModule = angular.module('Services', []);
})();