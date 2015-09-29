var demoApp = angular.module('demoApp', []);

demoApp.factory('dataService', function($http){

	var actions = {};

	var serviceURL = {
		tasks: "http://localhost/_api/lists/GetByTitle('MyTasks')/items",
	}
	
	var digest = document.getElementById('__REQUESTDIGEST').value;
	
	var requestHeader = {

		get: {

			'headers':{
				'accept': 'application/json;odata=verbose'
			}

		},
		post: {
                'headers': {
                	'X-RequestDigest': digest,
                    'content-type': 'application/json;odata=verbose',
                    'accept': 'application/json;odata=verbose'
                    
                }
            }
	};

	actions = {
		get: function(){
			return $http.get(serviceURL.tasks, requestHeader.get);
		},
		post: function(data){
			return $http.post(serviceURL.tasks, data, requestHeader.post)
		}

	}

	return actions;
});

demoApp.controller('tasksController', function($scope, $http, dataService){
	
	//limited fields are used for sample app
	$scope.newTask = {
		Title: '',
		StartDate: '',
		DueDate: '',
		PercentComplete: '',
		 __metadata:  {type: 'SP.Data.MyTasksListItem' }		
	};

	function getAllTasks(){
		dataService.get().then(function(response){
			$scope.Tasks = response.data.d.results;
		});
	}

	// Getting the item type for the list
	function getListItemType(name) {
	    return "SP.Data." + name[0].toUpperCase() + name.substring(1) + "ListItem";
	}
	//To create new list item
	$scope.createTask = function(){

		var item = {
        	"__metadata": { "type": getListItemType('MyTasks')}
    	};
    
		dataService.post($scope.newTask).then(function(response){
			alert(response);
			return response;
		});

	};

	function init(){
		 getAllTasks();
	}

	init();
});



