
     function Team(attributes){
       this.name = attributes.name;
       this.id = attributes.id;
       this.user_id = attributes.user_id;
       this.positions = attributes.positions
       this.games = attributes.games;
       this.sport_id = attributes.sport_id;
     }
     function Game(attributes){
       this.date = attributes.date;
       this.time = attributes.time;
       this.team_id = attributes.team_id;
       this.sport_id = attributes.sport_id;
       this.user_id = attributes.user_id;
     }
     /////
     $(function(){
     Team.templateSource = $("#team-template").html()

     Team.template = Handlebars.compile(Team.templateSource)
     })
     /////
     $(function(){
      Team.templateSource = $("#show-template").html()
      Team.template = Handlebars.compile(Team.templateSource)

     })
    //  Handlebars.registerHelper("gameShow", function(game_time, game_date){
    //    return game_time
    //  })
     
     Team.prototype.renderLi = function(){
      return Team.template(this)
      }
      ///
      Team.prototype.show = function(){
        return Team.template(this)
      }
      
     
     $(function(){
        //all teams bottom (idex)
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
        // show team 
        $('.team').on('click', function(e){
          e.preventDefault()
          $('#teamshow').toggle()
          $.get(this.href)
           .done(function(team){
             
             var team = new Team(team)
             var teamShow = team.show() 
             $('#teamshow').html("")       //prevents additional       
             $('#teamshow').append(teamShow)

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