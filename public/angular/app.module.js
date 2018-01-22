var app = angular.module('app',['ngAnimate','angular.filter','ngSanitize', 'angular.viacep']).run(function($rootScope, $location) {
    $rootScope.location = $location;
});;