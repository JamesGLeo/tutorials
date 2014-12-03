console.log('lem lem lem lem...')


function lemurPeak(){
  var lemlem = $("<img class='lemlem' src='/images/LemLem.png'>");
  $('body').append(lemlem);
  lemlem.css( {bottom:'-150%'});
  lemlem.css( {left: Math.random()*75+'%'});
  lemlem.delay(Math.random()*10000).animate({bottom: '-1em'}, 5000);
}


function validatePasswordMatch(){
  $('form#new-user').on('submit', function(e){
    var password = $(this).find("[name='password']").val();
    var passwordVerification = $(this).find("[name='password_verification']").val();
    if (password != passwordVerification){
      e.preventDefault();
      alert("Password Must Be the SAME!!!");
    }
  })
}


// When the document is ready...
$(function(){
  lemurPeak();
  validatePasswordMatch();
})

// window.onload = function(){
//   lemurPeak();
//   validatePasswordMatch();
// };
