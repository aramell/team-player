

$(function(){
    $('.teams').on('click', function(e){
      e.preventDefault();
      $.get("/teams")
        .done(function(data){
          $('.all_teams').html(data)
        })
        .fail(function(data){
          console.log(data)
        })
  })
  $('.sports').on('click', function(e){
      e.preventDefault()
      $.get("/sports")
        .done(function(data){
          $('.all_sports').html(data)
        })
        .fail(function(data){
          console.log(data)
        })

  })
})
