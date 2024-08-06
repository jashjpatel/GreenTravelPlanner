(function() {
    'use strict';

    angular.module('myApp', [])
        .controller('MainController', ['$scope', function($scope) {
            $scope.title = 'Hello, AngularJS!';
        }]);
})();