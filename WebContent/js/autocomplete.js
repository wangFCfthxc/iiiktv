$(document).ready(function() {
	var opt = $("#searchOptions").val();
	$("#searchOptions").change(function(){
		opt = $("#searchOptions").val();
	});
	$("input#searchText").autocomplete({
    	max:"10",
    	scroll:true,
    	source: function(request, response) {
            $.ajax({
                url:"autoCompleteServlet.controller",
                dataType: "json",
                data: {
                	q:request.term,
                	option:opt
                },
                success: function( data, textStatus, jqXHR) {
                    console.log(data);
                    var items = data;
                    response(items);
                },
                error: function(jqXHR, textStatus, errorThrown){
                     console.log( textStatus);
                }
            });
        }
    });
});