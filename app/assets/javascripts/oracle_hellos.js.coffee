# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  $header=$(".header")
  $head=$("<thead></thead>")
  $tabl=$("<table></table>")
  $('table thead tr th').each ->       
    $("<th></th>").text($(this).text()).width($(this).width()).appendTo($head)
      
  $tabl.append($head).appendTo(".header")
      
  $(window).scroll `function(){
		 var offset = $(".table").offset();
     $header.offset({top: offset.top, left: offset.left})}` 
		