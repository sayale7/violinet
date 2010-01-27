$(document).ready(function(){
 
 
	//hide normal textarea and textbox in posts
	$('#post_form_area').removeClass('tb_area_extended').addClass('mceEditor');  
	$('#post_form_text').removeClass('tb').addClass('tb_extended'); 
 
	//hide none js div for image gallery
	$("#all_images").removeClass(".wjs_visible").addClass("wjs");
	// $("all_images_slider").removeClass(".wjs").addClass("wjs_visible");
 
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
 
 
 
	$("#add_tags").live("submit", function(){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$("#not_tags_of_post").html("loading ...");
		$("#tags_of_post").html("");
		return false;
	});

	$("#remove_tags").live("submit", function(){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$("#not_tags_of_post").html("loading ...");
		$("#tags_of_post").html("");
		return false;
	});
 
	// post new comment through ajax
 
	$("#new_comment").live("submit", function(){
		$(".loading").html("loading ...");
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
	  	return false;
	});
 
	// destroy comment through ajax
 
	$(".destroy_comment").live("click", function(){
		$(".loading").html("loading ...");
		$.getScript(this.href);
		return false;
	});
 
	// remove_frienship through ajax
 
	$(".friendship_links_top a").live("click", function(){
		$.getScript(this.href);
		$("#friendship_links").html("loading ...");
		return false;
	});
	
	$(".friendship_links_bottom a").live("click", function(){
		$.getScript(this.href);
		$("#friendship_links").html("loading ...");
		return false;
	});
	
	//ajax searching
	
	$('#search_button').hide();
	$('#clear_tb_datepicker').removeClass('hidden').addClass('visible');
	
	$('#user_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$("#users").html("loading ...");
	});
	
	$('#goup_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$("#groups").html("loading ...");
	});
	
	$('#post_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$("#posts").html("loading ...");
	});
	
	
	$('#clear_tb_datepicker').click(function(){
		$('.tb_datepicker').val("");
		$('.tb').val("");
		$.post($('#post_search').attr("action"), $('#post_search').serialize(), null, 'script');
		$("#posts").html("loading ...");
		return false;
	});
	
	$('.tb_datepicker').live("change", function(e){
		setTimeout(function() { 
			$.post($('#post_search').attr("action"), $('#post_search').serialize(), null, 'script');
			$("#posts").html("loading ...");
		}, 500);
		return false;
	});
	
 
});