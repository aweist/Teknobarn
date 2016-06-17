$(function(){
  $('#shirt_size').change(function(event) {
    console.log("enabling");
    $('#confirm-btn').prop('disabled',false);
  });

  $("#csv").autoGrow();
})