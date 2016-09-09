angular.module('Directives').directive("addArticle", function($rootScope, $http, LxDialogService) {
	return {
		restrict: "E",
		templateUrl: "/admin/templates/add_article.html",
		link: function(scope, element, attrs) {
			$rootScope.showAddArticle = function() {
				LxDialogService.open('addArticle');
			}

      var init = function () {
        scope.formObj = {};
        scope.otherObj = {};
      }

      scope.createArticle = function () {
        if (scope.otherObj.articleForm.$invalid) {
          return;
        }
        $http.post('/articles', {
          data: scope.formObj
        }).then(function (data) {
          console.log(data);
          LxDialogService.close('addArticle');
        }, function (data) {
          console.log(data);
        });
      }

      scope.$on('lx-dialog__open-start', function(event, dialogId) {
        init();
      });
		}
	}
})