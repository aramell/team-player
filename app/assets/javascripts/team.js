
     function Team(attributes){
       this.name = attributes.name;
       this.id = attributes.id;
       this.userID = attributes.user_id;
       this.positions = attributes.positions
       
       this.games = attributes.games;
       this.sports = attributes.sports
       this.sportID = attributes.sport_id;
     }
  
     $(function(){
     Team.templateSource = $("#team-template").html()

     Team.template = Handlebars.compile(Team.templateSource)
     })
     /////
     
  
     
     Team.prototype.renderLi = function(){
       
      return Team.template(this)
      }
   
     
     $(function(){
        //all teams bottom (idex)
          $('.teams').on('click', function(e){
            e.preventDefault();
            const allTeams = $('.all_teams')
              
            if (allTeams.children().length > 0 && allTeams.css('display') == 'none') {
              allTeams.show()
            } else if (allTeams.children().length > 0 && allTeams.css('display') == 'block') {
              allTeams.hide()
            } else {
              
              return fetch(this.href, {
                headers: { 
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                },
                 credentials: 'same-origin'

              })
              .then(res => res.json())
              .then(json => {
                  json.forEach(teamElement => {
                  // $('.all_teams').append("<li>" + team.name  + "</li>" )
                  let team = new Team(teamElement) //json to js object
                  let teamLi = team.renderLi()
                    // $.each(result, function(i, value){
                    allTeams.append(teamLi)
                })
              })        
           }
        })
        // // show team 
        $('.team').on('click', function(e){
          e.preventDefault()
          
          let teamShow = $('#teamshow')
          const team = this
          
          if (teamShow.css('display') == 'block' ){
            teamShow.slideToggle()
            
          } else if ($(e.target).is('.container-fluid')){
            teamShow.slideToggle()
          } else {
                teamShow.slideToggle()
                
                $.get(this.href)
                 .done(function(team){
                   let newTeam = new Team(team)        
                    
                   document.getElementById('teamshow').innerHTML = `<h2> ${newTeam.name} </h2>
                  <p><strong> Sports this team plays:</strong></p>
                    ${newTeam.sports.map((sport) => {
                         return `<li>${sport.name}</li>`
                     }).join('')
                    }</br>
                  <p><strong> Games: </strong></p>
                    ${newTeam.games.map((game) =>{
                      return `<li>Game Date:${game.game_date}</li>
                              Game Time: ${game.game_time}
                              </br>
                            `
                    }).join('')
                  }
                  <a href="/teams/${newTeam.id}/games/new">Create Game for this Team</a><br>
                  <a href="/teams/${newTeam.id}/edit">Edit this team</a><br>
                  <a href="/teams/${newTeam.id}" rel="nofollow" data-method="delete">Delete Team</a><br>
                  `               
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
          
          var form = $('#new_team').serializeArray()
          
          return fetch(this.action, {
            method: 'post',
            credentials: 'same-origin',
             body: new FormData(document.getElementById('new_team'))
          })
          .then(res => res.json())
          .then(json => {
            var newTeam = new Team(json) //json to js object
            var teamLi = newTeam.renderLi()
             
              $('#teamlist').append(teamLi)
              $('#team_name').val("")
              $('#teams').append(newTeam)

          })
      })
          
        
      
    })
    