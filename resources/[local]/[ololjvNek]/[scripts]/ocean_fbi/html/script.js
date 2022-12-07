$(function (){

	function clickPlayer(identifier){

	}

	$("#dokument").hide();
	window.addEventListener('message', function(event) {
		if(event.data.type == 'open'){
			console.log("opening")
			$("#dokument").show();
			var iframe = $('<iframe width="80%" height="80%" id="frameDispatch" src="'+event.data.document+'"/>').appendTo('body');
			iframe.load(function(){
				iframe.contents().find('#docs-chrome').hide();
				iframe.contents().find('#docs-additional-bars').hide();
			});
		}else if(event.data.type == 'close'){
			$('#frameDispatch').remove();
			$("#dokument").hide();
		}
	});

	document.onkeyup = function(data) {
		if(data.which == 27){
			$.post("http://ocean_fbi/exit", JSON.stringify({}));
		}
	}
});