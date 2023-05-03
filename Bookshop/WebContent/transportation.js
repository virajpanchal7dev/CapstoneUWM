/**
 * 
 */

function pendingReq(){
	
        const response = confirm("Approve the request and generate ticket?");

        if (response) {
			
            alert("Ticket generated");
            location.reload();
        } else {
            
        }
		
}  

function downloadTicket(id){  
 	
	$.ajax({
		url : 'ticketOpsDownload',
		type : 'POST',
		data: {id : id},
		enctype: 'multipart/form-data',
		success : function(responseText) {
			//Convert the Byte Data to BLOB object.
                    var blob = new Blob([responseText], { type: "application/octetstream" });
 
                    //Check the Browser type and download the File.
                    var isIE = false || !!document.documentMode;
                    if (isIE) {
                        window.navigator.msSaveBlob(blob, fileName);
                    } else {
                        var url = window.URL || window.webkitURL;
                        link = url.createObjectURL(blob);
                        var a = $("<a />");
                        a.attr("download", "Deep.pdf");
                        a.attr("href", link);
                        $("body").append(a);
                        a[0].click();
                        $("body").remove(a);
                    }
		},
		error: function (e) {
	        $("#result").text(e.responseText);
	        alert("Error");
	    },
	    complete: function () {
	        // Handle the complete event
	        alert("Complete");
	      }
	});
} 


function upload(std_id, ticketfile, i) {
	
	
	var form = $('#ticketOperation')[0];
	var data = new FormData(form);
	var std_id = std_id;
	var ticketfile = ticketfile[i];
	//var ticketfile = $('#ticketfile');	
	
	$.ajax({
		url : 'ticketOps',
		type : 'POST',
		data: ticketfile,
		processData: false,
		cache: false,
		dataType:'json',
		contentType: false,
		enctype: 'multipart/form-data',
		success : function(responseText) {
			alert(responseText);
		},
		error: function (e) {
	        $("#result").text(e.responseText);
	        alert("Error");
	    },
	    complete: function () {
	        // Handle the complete event
	        alert("Complete");
	      }
	});

}
