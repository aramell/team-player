
     function Team(attributes){
       this.name = attributes.name;
       this.id = attributes.id;
     }
     $(function(){
     Team.templateSource = $("#team-template").html()

     Team.template = Handlebars.compile(Team.templateSource)
     })
     Team.prototype.renderLi = function(){
      return Team.template(this)
      }
  
     
     $(function(){
        //all teams
          $('.teams').on('click', function(e){
            e.preventDefault();
            $.ajax({
              url: this.href,
              dataType: "json"
                       
            })
              .done(function(json){
                
                json.forEach(function(team){

                  $('.all_teams').append("<li>" + team.name + "</li>")
                   
                })
                .error(function(){
                  alert('that did not work')
                })
              })
        })
        //view all sports
        $('.sports').on('click', function(e){
            e.preventDefault()
            //json below
            $.get(this.href)
              .done(function(json){
                json.forEach(function(sport){
                  $('.all_sports').append("<li>" + sport.name + "</li>")
                })
              })
            
        })
        //view all games needs work
        $('.games').on('click', function(e){
          e.preventDefault()
          
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
        ///
        $('.team').on('click', function(e){
          e.preventDefault()
          // $(this).closest('li').show()
          $.get(this.href)
           .done(function(json){
            
             debugger
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
        // new team 
        $('.new-team').on('click',function(e){
          e.preventDefault()
          
          $('#teamform').toggle()
        })
        $('form.new_team').on('submit', function(e){
          e.preventDefault()
          
          var data = $('#new_team').serialize()
          // debugger
          $.ajax({
            url: this.action,
            method: 'POST',
            data: data,
            success: function(result){
             var team = new Team(result) //json to js object
            var teamLi = team.renderLi()
             debugger
              // $.each(result, function(i, value){
              $('#teamlist').append(teamLi)
              // $('#team_name').val("")
            
              // $('#teams').append(result)
              //  })
            }        

          })
            
        }) 
          
    })
  
      
      // })
      // have json parsed 
      //.on('page:change') - what does this do?