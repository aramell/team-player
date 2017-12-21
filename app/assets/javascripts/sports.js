
$(function(){
$('.sports').on('click', function(e){
  e.preventDefault()
  //json below
  $('.all_sports').toggle()
  $('.all_sports').html("")
  
  $.get(this.href)
    .done(function(json){
      json.forEach(function(sport){
        $('.all_sports').append("<li>" + sport.name + "</li>")
      })
    })
  
    })
  })