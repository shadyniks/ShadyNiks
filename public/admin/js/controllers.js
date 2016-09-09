angular.module('Controllers').controller("adminController", function($scope, article) {
	
	var init = function () {
		article.getAll().then(function (response) {
			$scope.articles = response;
		})
	};

	$scope.deleteArticle = function (article_id) {
		article.deleteItem(article_id);
	};

	init();
})