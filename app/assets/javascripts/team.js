
     function Team(attributes){
       this.name = attributes.name;
       this.id = attributes.id;
       this.game_id = attributes.game_id;
       
     }
     $(function(){
     Team.templateSource = $("#team-template").html()

     Team.template = Handlebars.compile(Team.templateSource)
     })
     Team.prototype.renderLi = function(){
      return Team.template(this)
      }
  
     
     $(function(){
        //all teams bottom
          $('.teams').on('click', function(e){
            e.preventDefault();
            $.ajax({
              url: this.href,
              dataType: "json"
                       
            })
              .done(function(json){
                
                json.forEach(function(team){
                  
                  // $('.all_teams').append("<li>" + team.name  + "</li>" )
                  var team = new Team(team) //json to js object
                  var teamLi = team.renderLi()
                   
                    // $.each(result, function(i, value){
                    $('.all_teams').append(teamLi)
                })
              })
        })
        $('.team').on('click', function(e){
          e.preventDefault()
          $('#teamshow').toggle()
          $.get(this.href)
           .done(function(json){
             
            
             debugger
             $('#teamshow').append(json)

             debugger
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
             
              // $.each(result, function(i, value){
              $('#teamlist').append(teamLi)
              $('#team_name').val("")
            
              // $('#teams').append(result)
              //  })
            }        

          })
            
        }) 
          
    })
  
      
      // })
      // have json parsed 
      //.on('page:change') - what does this do?