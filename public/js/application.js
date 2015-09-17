$(function(){
  $(".upvote-button").on("click", function(event){
    event.preventDefault();
    url_id = $(this).attr("id")
    $(this).next().next().css("color", "")
    direction = $(this).attr("value")
    $button = $(this)
    url_start = $button.parent().attr("class")
    score_element = $button.next()
    score = $button.next().text;
    console.log(url_start);
    $.ajax({
      method: "get",
      url: '/'+url_start+'/'+url_id+'/votes/'+direction,
      success: function(response){
        $button.css("color", "red")
        score_element.text(response)
      }
    })
  });

  $(".downvote-button").on("click", function(event){
    event.preventDefault();
    url_id = $(this).attr("id")
    $(this).prev().prev().css("color", "")
    direction = $(this).attr("value")
    $button = $(this)
    url_start = $button.parent().attr("class")
    score_element = $button.prev()
    score = $button.prev().text;
    $.ajax({
      method: "get",
      url: '/'+url_start+'/'+url_id+'/votes/'+direction,
      success: function(response){
        $button.css("color", "red")
        score_element.text(response)
      }
    });
  });


})
