$(function (){  
	$("#edit_messages a").live("click", function(){
		$("#edit_messages").html("loading ...");
		$.getScript(this.href);
	  	return false;
	});

});  
