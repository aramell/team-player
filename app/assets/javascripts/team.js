

$(function(){
    $('.teams').click(function(e){
      e.preventDefault();
      // $.get("/teams")
      //   .done(function(data){
      //     $('.all_teams').html(data)
      //   })
      //   .fail(function(data){
      //     console.log(data)
      //   })
      $.get(this.href)
        .done(function(json){
          json.forEach(function(team){
            
            $('.all_teams').append("<li>" + team.name + "</li>")
            
          })
        })
  })
  $('.sports').click(function(e){
      e.preventDefault()
      // $.get("/sports")
      //   .done(function(data){
      //     $('.all_sports').html(data)
      //   })
      //   .fail(function(data){
      //     console.log(data)
      //   })
      //json below
      $.get(this.href)
        .done(function(json){
          json.forEach(function(sport){
            $('.all_sports').append("<li>" + sport.name + "</li>")
          })
        })

  })
  $('.games').click(function(e){
    e.preventDefault()
    // $.get("/games")
    //   .done(function(data){
    //     $('.user_games').html(data)
    //   })
    //   .fail(function(data){
    //     console.log(data)
    //   })
    //json below
    $.ajax({
      type: 'get',
      url: this.href,
    })
      .done(function(json){
        alert('test')
      })
      .fail(function(json){
        alert('failed')
      })
  })
  $('.team').click(function(e){
    e.preventDefault()
    $.get(this.href)
    .done(function(json){
      
      $('.team-show').html(json)

    })
  })
})
