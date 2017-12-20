//


// view all games needs work
$(function(){
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
      })