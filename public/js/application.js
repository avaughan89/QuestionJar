$(document).ready(function() {
  $("#survey_view").on('submit', function(event){
    event.preventDefault;
    console.log('yo')
    var url = $(this).attr('action')
    var res = $(this).serialize()
    $.ajax({
      type: 'post',
      url: url,
      data: res,
      dataType: 'json'
    }).success(function(data){
      // debugger;
      // console.log(data)
      $("ol").prepend('<li>'+data.res+'</li>')
    });
  });
});


