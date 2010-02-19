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
		$.getScript(this.href);
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
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
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
		return false;
	});

	$("#remove_tags").live("submit", function(){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
		return false;
	});
 
	// post new comment through ajax
 
	$("#new_comment").live("submit", function(){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
	  	return false;
	});
 
	// destroy comment through ajax
 
	$(".destroy_comment").live("click", function(){
		$.getScript(this.href);
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
		return false;
	});
 
	// remove_frienship through ajax
 
	$(".friendship_links_top a").live("click", function(){
		$.getScript(this.href);
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
		return false;
	});
	
	$(".friendship_links_bottom a").live("click", function(){
		$.getScript(this.href);
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
		return false;
	});
	
	//ajax searching
	
	$('#search_button').hide();
	$('#clear_tb_datepicker').removeClass('hidden').addClass('visible');
	
	$('#user_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('.users_list').html('');
		$('.clear').remove();
		$('#users').removeClass('loading_background_invisible');
		$('#users').addClass('loading_search_background_visible');
	});
	
	$('#goup_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('.groups_list').html('');
		$('#groups').removeClass('loading_background_invisible');
		$('#groups').addClass('loading_search_background_visible');
	});
	
	$('#post_search').keyup(function(e){
		$.post($(this).attr("action"), $(this).serialize(), null, 'script');
		$('.clear').html('');
		$('#posts').removeClass('loading_background_invisible');
		$('#posts').addClass('loading_search_background_visible');
	});
	
	
	$('#clear_tb_datepicker').click(function(){
		$.post($('#post_search').attr("action"), $('#post_search').serialize(), null, 'script')
		$('.tb_datepicker').val("");
		$('.tb').val("");;
		$('.clear').html('');
		$('#posts').removeClass('loading_background_invisible');
		$('#posts').addClass('loading_search_background_visible');
		return false;
	});
	
	$('.tb_datepicker').live("change", function(e){
		setTimeout(function() { 
			$.post($('#post_search').attr("action"), $('#post_search').serialize(), null, 'script');
			$('.clear').html('');
			$('#posts').removeClass('loading_background_invisible');
			$('#posts').addClass('loading_search_background_visible');
		}, 500);
		return false;
	});
	
	$('.with_category').change(function(e){
		$.post($('#with_category_form').attr("action"), $('.with_category').serialize(), null, 'script');
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
	});
	
 
});