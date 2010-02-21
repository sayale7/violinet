$(document).ready(function() { 
	$('.pagination a').live("click", function () {  
    	$.setFragment({ page: $.queryString(this.href).page });
		$('#loading_background').removeClass('loading_background_invisible');
		$('#loading_background').addClass('loading_background_visible');
	  	return false;
	});

	$.fragmentChange(true);  
	$(document).bind("fragmentChange.page", function(){
		$.getScript($.queryString(document.location.href, { "page" : $.fragment().page }));
	});
	
	if($.fragment().page){
		$(document).trigger("fragmentChange.page");
	}
});  
