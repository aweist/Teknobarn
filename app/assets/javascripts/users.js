$(function(){
  $(document).on('change','#shirt_size', function() {
    $('#confirm-btn').prop('disabled', false);
    $('#confirm-btn').prop('value', 'Confirm');
  });

  $("#csv").autoGrow();
});
