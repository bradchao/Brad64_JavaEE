window.onload = function (){
	console.log("onload");
	let start = document.getElementById('start');
	let mesgDiv = document.getElementById('mesgDiv');
	let mesg = document.getElementById('mesg');
	let send = document.getElementById('send');
	let log = document.getElementById('log');
	
	let webSocket;
	
	start.addEventListener("click", function(){
		connect();
	});
	
	send.addEventListener("click", function(){
		console.log("send...");
		var message = {
			message : mesg.value
		};
		webSocket.send(JSON.stringify(message));
	});
	
	start.style.display = "block";
	mesgDiv.style.display = "none";
	
	function connect(){
		console.log("connecting...");
		webSocket = new WebSocket("ws://10.0.104.190:8080/MyWeb2/myserver");
		webSocket.onerror = function(event){
			console.log("error");
		};
		webSocket.onopen = function(event){
			console.log("open");
			start.style.display = "none";
			mesgDiv.style.display = "block";
		};
		
		webSocket.onclose = function(event){
			console.log("close");
			start.style.display = "block";
			mesgDiv.style.display = "none";
		};
		
		webSocket.onmessage = function(event){
			// event.data
			var obj = JSON.parse(event.data);
			log.innerHTML += obj.message + "<br />";
		};
		
	}
	
	
}