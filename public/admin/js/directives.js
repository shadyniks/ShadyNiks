angular.module('Directives').directive("addArticle", function($rootScope, article, LxDialogService, LxDatePickerService) {
	return {
		restrict: "E",
		templateUrl: "/admin/templates/add_article.html",
		link: function(scope, element, attrs) {
			$rootScope.showAddArticle = function(id) {
				LxDialogService.open('addArticle');
				if (id) {
					scope.otherObj.mode = 'edit';
					scope.formObj = angular.copy(_.findWhere(article.getCachedArticles(), {id: id}));
					if (!scope.formObj.sort_date) scope.formObj.sort_date = undefined;
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
}).directive('formatDateTime', function() {
	return {
		restrict: "A",
		require: 'ngModel',
		link: function(scope, element, attrs, ngModel) {
			ngModel.$parsers.push(function (value) {
				return new Date(value).getTime();
			});
			ngModel.$formatters.push(function (value) {
				return new moment(value).format("MM/DD/YYYY");
			});
		}
	}
})