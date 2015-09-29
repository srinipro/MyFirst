<style>
		#taskView{
			border-collapse:collapse; width:100%;
		}
		#taskView td, #taskView th {
			border:1px solid black;
			padding:5px;
		}
		.action-container{
			width:240px;
			text-align:right;
			padding:10px 0px 10px 0px;	
		}
	</style>
	<script type="text/javascript" src="../SiteAssets/angular.min.js"></script>
	<script type="text/javascript" src="../SiteAssets/appScript.js"></script>
	<div ng-app="demoApp">
		<div  ng-controller="tasksController">
		
		
			<div>
				<table>
					
					<tr><th>Task Name</th><td><input type="text" ng-model="newTask.Title" /></td></tr>
					<tr><th>Start Date</th><td><input type="text" class="form-control" ng-model="newTask.StartDate" placeholder="Start Date dd/mm/yyyy" />
					</td></tr>
					<tr><th>Due Date</th><td><input type="text" class="form-control" ng-model="newTask.DueDate" placeholder="Due Date dd/mm/yyyy" />
	</td></tr>
					<tr><th>% Complete</th><td><input type="text" ng-model="newTask.PercentComplete" /></td></tr>
					
				</table>
			</div>
			<div class="action-container"><button ng-click="createTask()" >Add 
				Task</button></div>
			<table id="taskView" >
				<thead>
					<tr>
						<th>Task ID</th>
						<th>Task Name</th>
						<th>Start Date</th>
						<th>Due Date</th>
						<th>% Complete</th>
						<th>Created Date</th>
						<th>Modified Date</th>
	
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="task in Tasks">
						<td>{{task.ID}}</td>
						<td>{{task.Title}}</td>
						<td>{{task.StartDate | date: &#39;dd MMM yyyy&#39;}}</td>
						<td>{{task.DueDate | date: &#39;dd MMM yyyy&#39;}}</td>
						<td>{{task.PercentComplete}}</td>
						<td>{{task.Created | date: &#39;dd MMM yyyy&#39;}}</td>
						<td>{{task.Modified | date: &#39;dd MMM yyyy&#39;}}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
