
$(function(){
$('.sports').on('click', function(e){
  e.preventDefault()
  //json below
  // $('.all_sports').toggle()
  // $('.all_sports').html("")
  var allSports = $('.all_sports')

  if (allSports.children().length > 0 && allSports.css('display') == 'none') {
    allSports.show()
  } else if (allSports.children().length > 0 && allSports.css('display') == 'block') {
    allSports.hide()
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
      json.forEach(sport => {
      $('.all_sports').append("<li>" + sport.name + "</li>")

      })
    })

  }
  
  })
})
    
    
  // $.get(this.href)
  //   .done(function(json){
  //     json.forEach(function(sport){
  //       $('.all_sports').append("<li>" + sport.name + "</li>")
  //     })
  //   })
  