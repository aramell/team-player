
     function Team(attributes){
       this.name = attributes.name;
       this.id = attributes.id;
       this.user_id = attributes.user_id;
       this.positions = attributes.positions
       
       this.games = attributes.games;
       this.sports = attributes.sports
       this.sport_id = attributes.sport_id;
     }
    //  function Game(attributes){
    //    this.game_date = attributes.game_date;
    //    this.game_time = attributes.game_time;
    //    this.team_id = attributes.team_id;
    //    this.sport_id = attributes.sport_id;
    //    this.user_id = attributes.user_id;
    //  }
     /////
     $(function(){
     Team.templateSource = $("#team-template").html()

     Team.template = Handlebars.compile(Team.templateSource)
     })
     /////
     $(function(){
      Team.templateSourceTwo = $("#show-template").html()
      Team.templateTwo = Handlebars.compile(Team.templateSourceTwo)

     })
  
     
     Team.prototype.renderLi = function(){
       
      return Team.template(this)
      }
      ///
      Team.prototype.show = function(){
        
        return Team.templateTwo(this)
      }
      
     
     $(function(){
        //all teams bottom (idex)
          $('.teams').on('click', function(e){
            e.preventDefault();
            var allTeams = $('.all_teams')
              
            if (allTeams.children().length > 0 && allTeams.css('display') == 'none') {
              allTeams.show()
            } else if (allTeams.children().length > 0 && allTeams.css('display') == 'block') {
              allTeams.hide()
            } else {
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
              }
            })

        //       allTeams.children()
        //     debugger
        //     $('.all_teams').html("")
            
        // // show team 
        $('.team').on('click', function(e){
          e.preventDefault()
          
          var teamShow = $('#teamshow')

          if (teamShow.children().length > 0 && teamShow.css('display') == 'none') {
              teamShow.show()
          } else if (teamShow.children().length > 0 && teamShow.css('display') == 'block') {
              teamShow.hide()
          } else {
                teamShow.toggle()
                
                $.get(this.href)
                 .done(function(team){

                   var team = new Team(team)
                   debugger

                  //  var teamShow = team.show() 
                  //  $('#teamshow').html("")       //prevents additional       
                  //  $('#teamshow').append(teamShow)
                
                })
            } 
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


      /*
        TODO APP
        --------

          * Rails Side
            GET /tasks
            GET /tasks/:id
            POST /tasks
            PUT /tasks/:id
            DELETE /tasks/:id

            TASK Model 
              - name

            The only view template will be at the root route /

            <div id="root"></div>

          * JS Side 

            Mount a todo list into the div id="root"

            Recommend template literals

            * checking or unchcecking a todo is optional
      */