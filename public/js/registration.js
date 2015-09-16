$(document).ready(function() {
  $("form").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);
    // $form.remove($(this).) not correct

    var loginData = $(this).serialize();

    $.ajax({
      type: "POST",
      url: "/login",
      data: loginData,
      error: function(response) {
        form.append("<h4>Required</h4>");
      }
    });
  });
});