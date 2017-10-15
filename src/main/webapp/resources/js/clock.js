$(document).ready(function() {

var monthNames = [ "Січня", "Лютого", "Березня", "Квітня", "Травня", "Червня",
	"Липня", "Серпня", "Вересня", "Жовтня", "Листопада", "Грудня" ];
var dayNames= ["Понеділок","Вівторок","Середа","Четвер","Пятниц'я","Субота","Неділя"]


var newDate = new Date();

newDate.setDate(newDate.getDate());


setInterval( function() {

	var seconds = new Date().getSeconds();	
	$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
	},1000);
	
setInterval( function() {
	
	var minutes = new Date().getMinutes();	
	$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
    },1000);
	
setInterval( function() {
	
	var hours = new Date().getHours();	
	$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);
	

$('#Date').html(dayNames[newDate.getDay()] + "  " + newDate.getDate() + '  ' + monthNames[newDate.getMonth()] + '  ' + newDate.getFullYear()+ 'р.');


}); 