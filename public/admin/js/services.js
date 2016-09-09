angular.module('Services').service('article', function ($http) {
	
	var articles = [];

	this.create = function (data) {
		return $http.post('/articles', {
		  data: data
		}).then(function (response) {
			console.log(response);
			articles.push(response.data);
			return response.data;
		});
	}

	this.getAll = function () {
		return $http.get('/articles/all').then(function (response) {
			articles = response.data;
			return articles;
		});
	};

	this.deleteItem = function (id) {
		return $http.delete('/articles/' + id).then(function (response) {
			var index = _.findIndex(articles, {id: id});
			articles.splice(index, 1);
		});
	};
})