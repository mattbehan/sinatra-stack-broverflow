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


$("#register").click(function() {
var name = $("#name").val();
var email = $("#email").val();
var password = $("#password").val();
var cpassword = $("#cpassword").val();
if (name == '' || email == '' || password == '' || cpassword == '') {
alert("Please fill all fields...!!!!!!");
} else if ((password.length) < 8) {
alert("Password should atleast 8 character in length...!!!!!!");
} else if (!(password).match(cpassword)) {
alert("Your passwords don't match. Try again?");
} else {
$.post("register.php", {
name1: name,
email1: email,
password1: password
}, function(data) {
if (data == 'You have Successfully Registered.....') {
$("form")[0].reset();
}
alert(data);
});
}
});
});
