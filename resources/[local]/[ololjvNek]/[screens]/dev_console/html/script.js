$(function (){

	function clickPlayer(identifier){

	}

	$("#container").hide();
	$("#console").hide();
	window.addEventListener('message', function(event) {
		if(event.data.type == 'open'){
			$("#container").show();
		} else if (event.data.type == 'close'){
			$("#container").hide();
			$("#console").hide();
		}else if (event.data.type == 'response'){
			if(event.data.status == 'passed'){
				$("#container").hide();
				$("#console").show();
				$("#players").hide();
			}else if (event.data.status == 'players'){
				const players = event.data.players
				for (const player of players) {
					document.getElementById("players").innerHTML = document.getElementById("players").innerHTML+"<button id=\"" + player.identifier + "\" class=\"playerlist\" onclick=\"clickPlayer(" + player.identifier + ");\">" + player.name + "</button><br>"
				}
				$("#console").show();
				$("#players").show();
				$("#playermanager").hide();
			}
		}
	});

	document.onkeyup = function(data) {
		if(data.which == 27){
			$.post("http://dev_console/exit", JSON.stringify({}));
		}
	}

	$("#playermanager").click(function(){
		$.post("http://dev_console/getplayers", JSON.stringify({}));
	});

	$("#submit").click(function(){
		$.post("http://dev_console/submit", JSON.stringify({
			username: $("#username").val(),
			password: $("#password").val()
		}))
	});
});