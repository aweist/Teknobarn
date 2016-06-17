$(function(){
  $(document).on('change','#shirt_size', function() {
    $('#confirm-btn').prop('disabled', false);
  });

  $("#csv").autoGrow();
});