angular.module('Directives').directive("addArticle", function($rootScope, article, LxDialogService) {
	return {
		restrict: "E",
		templateUrl: "/admin/templates/add_article.html",
		link: function(scope, element, attrs) {
			$rootScope.showAddArticle = function(id) {
				LxDialogService.open('addArticle');
				if (id) {
					scope.otherObj.mode = 'edit';
					scope.formObj = angular.copy(_.findWhere(article.getCachedArticles(), {id: id}));
				}
			}

			var init = function () {
				scope.formObj = {};
				scope.otherObj = {
					mode: 'create'
				};
			}

			scope.createArticle = function () {
				if (scope.otherObj.articleForm.$invalid) {
					return;
				}

				article[scope.otherObj.mode](scope.formObj).then(function (data) {
					console.log(data);
					LxDialogService.close('addArticle');
				}, function (data) {
					console.log(data);
				});
			}

			scope.$on('lx-dialog__close-start', function(event, dialogId) {
				init();
			});
			init();
		}
	}
})