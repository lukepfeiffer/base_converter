$(document).ready( function(){
  $('#bases').on('submit', '.convert_form', function(event){
    event.preventDefault();
    var form = $(this)

    $.ajax({
      type: "get",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $("#conversion").replaceWith(response);
      }
    })
  });

  $('#bases').on('submit', '.convert_form_decimal', function(event){
    event.preventDefault();
    var form = $(this)

    $.ajax({
      type: "get",
      url: form.attr("action"),
      data: form.serialize(),
      success: function(response){
        $("#conversion-dec").replaceWith(response);
      }
    })
  });
});
