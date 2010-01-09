$(function (){  
	$("#edit_messages a").live("click", function(){
		$("#edit_messages").html("loading ...");
		$.getScript(this.href);
	  	return false;
	});
	
	// public/javascripts/application.js
	jQuery.ajaxSetup({ 
	  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
	})
	
	$(".add_tags").submit(function(){
		$("#not_tags_of_post").html("loading ...");
		$("#tags_of_post").html("loading ...");
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});

});  
