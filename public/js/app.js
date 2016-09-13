(function()
{
    'use strict';

     var app = angular
        .module('shadyApp', [
            'Controllers',
            'Directives',
            'Services'
        ])

    angular.module('Controllers', []);
    angular.module('Directives', []);
    angular.module('Services', []);

    angular.module('Controllers').controller('shadyController', function ($scope) {
        $scope.embedView = 'fb';
        $scope.embedHeight = $('body').height() - 500;
    });
})();