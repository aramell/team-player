//


// view all games needs work
$(function(){
        $('.games').on('click', function(e){
          e.preventDefault()
          
          $.ajax({
            type: 'get',
            url: '/games',
            dataType: 'json',
            success: function(json){
              alert('test')
            }
          })
          
           
            .fail(function(json){
              alert('failed')
            })
        })
      })