/**
 * 
 */

 
function startdiscussion() {
	$('#startdiscussion').hide();
	
	
    var display = $('#popup').css('display');
    if (display === "none") {
        $('#popup').show();
        $('#overlay').fadeIn();
    }
    else {
        $('#popup').hide();
        $('#overlay').fadeOut();
    }
}

function closequery() {
	var result = confirm("Are you sure you want to close?");
	if(result) {			
		//location.reload();
		$('#startdiscussion').show();
		$('#popup').hide();
	    $('#overlay').fadeOut();
	}	
}

$(document).ready(function () {
    $("#post").click(function () {

        var category = $('#category');
        if (category.val() === '-1') {
            alert("Please select Category");
            $('#category').focus();

            return false;
        }
        else return;
    });
});

function postquery() {
	alert("Here");	
}

function backreply() {
	window.location.href = 'discussioncorner';
}
