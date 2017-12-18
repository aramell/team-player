
// $(document).on('turbolinks:load', function(){
      $(function(){
          $('.teams').on('click', function(e){
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
        $('.sports').on('click', function(e){
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
        $('.games').on('click', function(e){
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
        $('.team').on('click', function(e){
          e.preventDefault()
          $(this).closest('li').toggle()
          $.get(this.href)
           .done(function(json){
            
             
             $('#showteam').append(json)
            //  if (json.games === true) json.games.ForEach(function(game){
            //    $div.append("<li>" + game.name + "</li>")
            //  })
            //  json.sports.forEach(function(sport){
            //  $div.append("<li>" + sport.name + "</li" )
            // })
            // $('.team-show').fadeToggle(sports)
          
          })
        })
        $('.new-team').on('click',function(e){
          e.preventDefault()
          
          $('#teamform').toggle()
        })
        $('.new_team').on('submit', function(e){
          e.preventDefault()
          
          var data = $('#new_team').serialize()
          // debugger
          $.ajax({
            url: this.action,
            method: 'POST',
            data: data,
            success: function(result){
             
              // $.each(result, function(i, value){
              $('#teams').append(result)
            
              
              // $('#teams').append(result)
              //  })
            }        

          })
            
        })
          
    })
  // })
  
      
      // })
      // have json parsed 
      //.on('page:change') - what does this do?