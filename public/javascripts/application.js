$(document).ready(function(){
	
	$(".destroy_comment a").click(function(){
		alert('You are going to visit: ' + this.href);
	});
	
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
	

	
	// toggle comment text area
	
	$("#new_comment").hide();
	$("#new_comment_link").css("visibility","visible");
	$(".close").css("visibility","visible");
	$("#new_comment_link").click(function () { 
		$("#new_comment_link").hide('fast');
		$("#new_comment").show('fast');
	});
	$(".close").click(function () { 
        $("#new_comment").hide('fast');
		$("#new_comment_link").fadeIn('fast');
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
	
	// post new comment through ajax
	
	$("#new_comment").live("submit", function(){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});
	
	// delete comment through ajax
	
	// $(".destroy_comment").live("click", function(){
	// 	$(".destroy_comment").html("loading ...");
	// 	//$.getScript(this.href);
	//   	return false;
	// });

	
});