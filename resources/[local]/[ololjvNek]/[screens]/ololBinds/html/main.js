function Clear(){
	$("#pl1").empty()
	$("#pl2").empty()
	$("#pl3").empty()
	$("#pl4").empty()
	$("#pl5").empty()
}

$(function(){
	window.addEventListener('message', (event) => {

		if (event.data.action == "updateSlot"){
			if (event.data.name == null) {
				$('#img'+event.data.slot).empty();
				return;
			}
			$('#img' + event.data.slot).html('<img width="52" src="img/'+event.data.name+'.png">');
		}

		if (event.data.action == "delimg1"){
			$("#img1").empty();
		}

		if (event.data.action == "delimg2"){
			$("#img2").empty();
		}

		if (event.data.action == "delimg3"){
			$("#img3").empty();
		}

		if (event.data.action == "delimg4"){
			$("#img4").empty();
		}

		if (event.data.action == "delimg5"){
			$("#img5").empty();
		}

		var item = event.data;
		if (item !== undefined && item.type === "open") {
			if (item.display === true) {

				$("#bodybox").fadeIn();
			} else{
				Clear()
				$("#bodybox").fadeOut();
			}
		}

	})
});

