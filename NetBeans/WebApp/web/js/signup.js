/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function sendJSON(){
    
    var obj = { 
        "name":document.getElementById("yourname").value,
        "uname":document.getElementById("username").value,
        "email":document.getElementById("email").value,
        "pass":document.getElementById("password").value,
        "conf_pass":document.getElementById("confirmpass").value,
        "phone":document.getElementById("phonenumber").value,
        "IsDriver":document.getElementById("checkbox").checked
    };
    
    var param = 'json='+JSON.stringify(obj);
    $.ajax({
        type: 'post',
        url: '/SignupServlet',
        dataType: 'JSON',
        data: param, 
        success: function(data) {
        },
        error: function(data) {
            alert('fail');
        }
    });
}