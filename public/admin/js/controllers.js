angular.module('Controllers').controller("adminController", function($scope, $http) {
  $http.get('/articles/all').then(function (data) {
    console.log(data);
  })
})