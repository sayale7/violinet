$(document).ready(function(){
	// public/javascripts/application.js
	jQuery.ajaxSetup({ 
	  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
	})
	
	$(".plain_old_checkboxes").remove();
	$(".new_click_boxes").removeClass("new_click_boxes");
	$(".clickable_items_to_add").live("click", function(){
		var value = $(this).attr("id");
		$(this).removeClass("clickable_items_to_add").addClass("clickable_items_selected_to_add");
		$(this).append("<input type='hidden' name='tags[]' value='" + value + "'/>"); //value=' " +  $this.attr("id") + "'
	});
	$(".clickable_items_selected_to_add").live("click", function(){
		$(this).removeClass("clickable_items_selected_to_add").addClass("clickable_items_to_add");
		$(this).children().remove();
	});
	$(".clickable_items_to_remove").live("click", function(){
		var value = $(this).attr("id");
		$(this).removeClass("clickable_items_to_remove").addClass("clickable_items_selected_to_remove");
		$(this).append("<input type='hidden' name='tags[]' value='" + value + "'/>"); //value=' " +  $this.attr("id") + "'
	});
	$(".clickable_items_selected_to_remove").live("click", function(){
		$(this).removeClass("clickable_items_selected_to_remove").addClass("clickable_items_to_remove");
		$(this).children().remove();
	});
	
	$("#edit_messages a").live("click", function(){
		$("#edit_messages").html("loading ...");
		$.getScript(this.href);
	  	return false;
	});
	

	$(".add_tags").live("submit", function(){
		$("#not_tags_of_post").html("loading ...");
		$("#tags_of_post").html("");
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});
	
	$(".remove_tags").live("submit", function(){
		$("#not_tags_of_post").html("loading ...");
		$("#tags_of_post").html("");
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});
	
	
	$("#new_profile_entry").live("submit", function(){
		alert("jo");
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});

	
});