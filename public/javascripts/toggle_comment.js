$(document).ready(function() {
	$("#profile_entries_new").hide();
	$("#new_entry_link").css("visibility","visible");
	$(".close").css("visibility","visible");
	$("#new_entry_link").click(function () { 
		$("#new_entry_link").hide('fast');
		setTimeout(function() { 
			$("#profile_entries_new").show('slow');
	    }, 300);
	});
	$(".close").click(function () { 
        $("#profile_entries_new").hide('slow');
		setTimeout(function() { 
			$("#new_entry_link").show('fast');
	    }, 500);
		return false;
	});

});