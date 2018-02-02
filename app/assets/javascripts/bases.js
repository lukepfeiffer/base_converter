$(document).ready( function(){
  $('#bases').on('submit', '.convert_form', function(event){
    event.preventDefault();
    var form = $(this)

    $.ajax({
      type: "get",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
      }
    })
  });
});
