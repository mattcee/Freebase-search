





 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    
    
    <title>Sports Search</title>
	<style>
		body{
			margin: 0;
			padding: 0;
		}
		
		#container{
			margin: 0;
			padding: 0;
			border: 0;
			width: 600px;
			height: 600px;
			position: relative;
			background-color: #EEEEEE
		}
		
		.basicStyle{
			font-family: Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif;
			position: absolute;
			left: 54%;
			top: -2%;
		}
		#placement2{
			font-family: Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif;
			position: absolute;
			top: 30%;
			left: 7%;
		}
		#leftside{
			position: absolute;
			height:100%;
			width: 20.5%;
			/*border: 1px solid black;*/
			left: 0%;
			background-color: #A0A0A0;
			border-radius: 10px;
		}
		#rightside{
			/*border: 1px solid black;*/
			position: absolute;
			height: 100%;
			width: 79.5%;
			left: 20.5%
		}
		#titlearea{
			/*border: 1px solid black;*/
			background-color: #DEDFA5;
			height: 5%;
			width: 100%;
			border-radius: 10px;
		}
		.result{
			font-family: Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif;
			position: absolute;
			height: 94.5%;
			width: 100%;
			overflow: scroll;
			/*border: 1px solid black;*/
		}
		.result table{
			border: 1px;
		}
		.fontchange{
			font-family: Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif;
		}
		#curtab{
			border: 1px solid black;
		}
		table{
			border: 1px;
		}
	</style>
    
    <!--//add key and stuff inside this js.-->
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
	var viewwidth = window.screen.availWidth;
	var viewheight = window.screen.availHeight;
	var find;
	var keyword;
	var search;
	var queryID;
	var temp1 = "https://www.googleapis.com/freebase/v1/mqlread?query=";
	var temp2;
	var temp3;
	var key = "&key=AIzaSyC4Os92PkWD6x0iRp3cerb_SvOH5lghU0k"
	var searchUrl;
    
	function multiCall(){
		adjustContainer();
		execQuery();
	}
	
	function adjustContainer(){
		if(viewwidth > 0 || viewheight >0){
			viewwidth += 'px';
			viewheight += 'px';
			document.getElementById('container').style.width = viewwidth;
			document.getElementById('container').style.height = viewheight;
		}
	}
	
		//function grabs parameters in URL
     function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	//when page loads/form submitted, this runs
	function execQuery()
	{
		queryID = getQueryID();
			var searchValue = getParameterByName('search')
			var freebaselink = "http://www.freebase.com";
			switch(queryID){
					case 1:
					temp2 = temp1.concat("[{\"id\":null,\"name\":null,\"type\":\"/sports/pro_athlete\",\"/sports/pro_athlete/teams\":[{\"team\":\"REPLACE\"}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
			    		$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });

						break;
					case 2:
					temp2 = temp1.concat("[{\"id\":null,\"name\":\"REPLACE\",\"type\":\"/sports/pro_athlete\"}]");
					
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
			    		$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });
						break;
					case 3:
					temp2 = temp1.concat("[{\"id\":null,\"type\":\"/sports/sports_team_roster\",\"/sports/sports_team_roster/position\":[{\"name\":\"REPLACE\"}],\"/sports/sports_team_roster/player\":[]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sports_team_roster/player";
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";			            
			    		$(".result").append("<tr>"+"<td>" + result[parsethis] + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			    		//$(".result").append('</td><br> ');
		    			
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 4:
					temp2 = temp1.concat("[{\"type\":\"/sports/pro_sports_played\",\"/sports/pro_sports_played/sport\":[{\"name\":\"REPLACE\"}],\"/sports/pro_sports_played/athlete\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
		            	var parsethis = "/sports/pro_sports_played/athlete";
			            $.each(response.result, function(i, result) {
			                $.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								  $(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
			    		
		    			
		        	});
		           $(".result").append("</table>");
		        });						
						break;
					case 5:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/pro_athlete\",\"/sports/pro_athlete/teams\":[{\"team\":{\"id\":null,\"name\":null}}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
						var parseThis = "/sports/pro_athlete/teams";
						var parsetwo = "team";
			            $.each(response.result, function(i, result) {
			                $.each(result[parseThis], function(j, resulttwo)
			                {
			                 var link = freebaselink + resulttwo[parsetwo].id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo[parsetwo].name + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			                    //$(".result").append(" <td>" + resulttwo[parsetwo].name + " " + linkclick);
			    		        //$(".result").append('</td><br> ');
			                });

		    			
		        	});
		            $(".result").append("</table>");
		        });						
						break;
						
					case 6:
					temp2 = temp1.concat("[{\"id\":null,\"name\":null,\"type\":\"/sports/sports_team\",\"/sports/sports_team/location\":\"REPLACE\"}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sports_team/location";
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
						$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			    		//$(".result").append(" <td>" + result.name + " " + linkclick);
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });
						break;
					case 7:
					temp2 = temp1.concat("[{\"id\":null,\"name\":null,\"type\":\"/sports/sports_team\",\"/sports/sports_team/venue\":[{\"/sports/team_venue_relationship/venue\":\"REPLACE\"}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
						$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			    		//$(".result").append(" <td>" + result.name + " " + linkclick);
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });						
						break;
					case 8:
					temp2 =  temp1.concat("[{\"type\":\"/sports/sport\",\"/sports/sport/team_coaches\":\"REPLACE\",\"/sports/sport/teams\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
		            	var parsethis = "/sports/sport/teams";
			            $.each(response.result, function(i, result) {
			            
			            $.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		                    
		    			
		        	});
		           $(".result").append("</table>");
		        });						
						break;
					case 9:
					temp2 = temp1.concat("[{\"id\":null,\"name\":null,\"type\":\"/sports/sports_team\",\"/sports/sports_team/team_mascot\":[{\"name\":\"REPLACE\"}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
			            $.each(response.result, function(i, result) {
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
						$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");			            
			    		//$(".result").append(" <td>" + result.name + " " + linkclick);
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });						
						break;
					case 10:
					temp2 = temp1.concat("[{\"type\":\"/sports/sport\",\"/sports/sport/leagues\":\"REPLACE\",\"/sports/sport/teams\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis= "/sports/sport/teams";
			            $.each(response.result, function(i, result) {
                            $.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 11:
					temp2 = temp1.concat("[{\"type\":\"/sports/sports_team_roster\",\"/sports/sports_team_roster/team\":\"REPLACE\",\"/sports/sports_team_roster/player\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");  
		            	var parsethis = "/sports/sports_team_roster/player";
			            $.each(response.result, function(i, result) {
                            $.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 12:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/sports_team\",\"/sports/sports_team/colors\":[]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sports_team/colors";
			            $.each(response.result, function(i, result) {
			            
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
			            if(result[parsethis] != "")
			            {
								$(".result").append("<tr>"+"<td>" + result[parsethis] + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			                	//$(".result").append(" <td>" + result[parsethis] + " " + linkclick);
			    		        //$(".result").append('</td><br> ');
			            }

		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 13:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/sport\",\"/sports/sport/leagues\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sport/leagues";
			            $.each(response.result, function(i, result) {
			    		$.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		    			
		        	});
		           $(".result").append("</table></tr></center>");
		        });					
						break;
					case 14:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/sport\",\"/sports/sport/related_equipment\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sport/related_equipment";
			            $.each(response.result, function(i, result) {
			    		$.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 15:
					temp2 = temp1.concat("[{\"id\":null,\"name\":\"REPLACE\",\"type\":\"/sports/sports_team\",\"/sports/sports_team/founded\":[]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sports_team/founded";
			           $.each(response.result, function(i, result) {
			            
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
			            if(result[parsethis] != "")
			            {
								$(".result").append("<tr>"+"<td>" + result[parsethis] + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			                	//$(".result").append(" <td>" + result[parsethis] + " " + linkclick);
			    		        //$(".result").append('</td><br> ');
			            }

		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 16:
					temp2 = temp1.concat("[{\"id\":null,\"name\":\"REPLACE\",\"type\":\"/sports/sports_team\",\"/sports/sports_team/abbreviation\":[]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
		            	var parsethis = "/sports/sports_team/abbreviation";
			            $.each(response.result, function(i, result) {
			    		$.each(response.result, function(i, result) {
			            
			            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
			            if(result[parsethis] != "")
			            {
								$(".result").append("<tr>"+"<td>" + result[parsethis] + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
			                	//$(".result").append(" <td>" + result[parsethis] + " " + linkclick);
			    		        //$(".result").append('</td><br> ');
			            }

		    			
		        	});
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
					case 17:
					temp2 = temp1.concat("[{\"id\":null,\"name\":null,\"type\":\"/sports/tournament_event\",\"/sports/tournament_event/sport\":\"REPLACE\"}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
			            $.each(response.result, function(i, result) {
		            var link = freebaselink + result.id;
			            var linkclick = "<a href=" + link + ">Click for more infomation</a>";
						$(".result").append("<tr>"+"<td>" + result.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			    		//$(".result").append(" <td>" + result.name + " " + linkclick);
			    		//$(".result").append('</td><br> ');
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;

					case 18:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/sport\",\"/sports/sport/positions\":[{\"id\":null,\"name\":null}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>"); 
		            	var parsethis = "/sports/sport/positions";
			            $.each(response.result, function(i, result) {
			    		$.each(result[parsethis], function(j, resulttwo){
			                	var link = freebaselink + resulttwo.id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
								$(".result").append("<tr>"+"<td>" + resulttwo.name + "</td>"+ " " + "<td>"+linkclick + "</td>"+"</tr>");
			                    //$(".result").append(" <td>" + resulttwo.name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			                });
		    			
		        	});
		           $(".result").append("</table>");
		        });					
						break;
						
						//need to create check for repeating stadium
					case 19:
					temp2 = temp1.concat("[{\"name\":\"REPLACE\",\"type\":\"/sports/sports_team\",\"/sports/sports_team/venue\":[{\"/sports/team_venue_relationship/venue\":{\"id\":null,\"name\":null}}]}]");
						temp3 = temp2.replace("REPLACE", searchValue);
		            	searchUrl = temp3 + key;
	                	$.getJSON(searchUrl, function(response){
		            	console.log(response);
		            	$(".result").empty();
		            	$(".result").append("<table border = '1'>");
		            	$(".result").append("<tr><th>Results</th> <th>Link</th> </tr>");
		            	var parsethis = "/sports/sports_team/venue";
		            	var parsethis_two = "/sports/team_venue_relationship/venue";
			            $.each(response.result, function(i, result) {
			             $.each(result[parsethis], function(i, result_two)
			             {
			             var link = freebaselink + result_two[parsethis_two].id;
			              var linkclick = "<a href=" + link + ">Click for more infomation</a>";
							$(".result").append("<tr>"+"<td>" + result_two[parsethis_two].name + "</td>"+ " " + "<td>" +linkclick + "</td>" + "</tr>");
                        	 //$(".result").append(" <td>" + result_two[parsethis_two].name + " " + linkclick);
			    	        	//$(".result").append('</td><br> ');
			    	    	});
		    			
		        	    });
		           $(".result").append("</table>");
		        });					
						break;
					default:
						break;
					}	
					

			
		
		
	}
	
	//called when form is submitted
	//parses form info, and passes to URL
	function submitQuery()
	{
		if(document.getElementById("search"))
			{
			queryID = Number(document.getElementById("queryID").selectedIndex) + 1;
			var relocate = location.protocol + '//' + location.host + location.pathname +"?queryID="+queryID+"&search="+document.getElementById("search").value;
			window.location.href= relocate;
			}
	
	
	}
	
	//pulls from URL to find the query ID. returns 0 if not enough conditions or invalid query
	function getQueryID()
	{
		if(Number(getParameterByName('queryID'))>0 && Number(getParameterByName('queryID'))<20)
		{
			return Number(getParameterByName('queryID'));
		}
		
		if(!getParameterByName('find') || !getParameterByName('search'))
		{
			return 0;
		}
		find = String(getParameterByName('find'));
		keyword = String(getParameterByName('keyword'));
		search = String(getParameterByName('search'));
		
		switch (find)
		{
			case 'athletes':
				switch(keyword)
				{
					case 'team':
						return 1;
						break;
					case 'name':
						return 2;
						break;
					case 'position':
						return 3;
						break;
					case 'sport':
						return 4;
						break;
					default:
						return 0;
						break;
				}
				break;
			case 'teams':
				switch(keyword)
				{
					case 'athlete':
						return 5;
						break;
					case 'city':
						return 6;
						break;
					case 'venue':
						return 7;
						break;
					case 'coach':
						return 8;
						break;
					case 'mascot':
						return 9;
						break;
					case 'league':
						return 10;
						break;
					default:
						return 0;
						break;
				}
				break;
			case 'roster':
				return 11;
				break;
			case 'colors':
				return 12;
				break;
			case 'leagues':
				return 13;
				break;
			case 'equipment':
				return 14;
				break;
			case 'founded':
				return 15;
				break;
			case 'abbreviation':
				return 16;
				break;
			case 'tournaments':
				return 17;
				break;
			case 'positions':
				return 18;
				break;
			case 'venues':
				return 19;
				break;
			default:
				return 0;
				break;
		}	
		
	}
    
    
    </script>
    
  </head>
  
  <div id = "container">
  
  <body onLoad="multiCall()">
	<div id = "leftside">
  <select id="queryID" >
    <option value ="1">1. Find all players on a team </option>
    <option value ="2">2. Find all players by name </option>
    <option value ="3">3. Find all players that play a position </option>
    <option value ="4">4. Find all players by sport </option>
    <option value ="5">5. Find all teams that have player named </option>
    <option value ="6">6. Find all teams with city name</option>
    <option value ="7">7. Find all teams with home venue </option>
    <option value ="8">8. Find all teams with coach</option>
    <option value ="9">9. Find all teams with mascot </option>
    <option value ="10">10. Find all teams in league</option>
    <option value ="11">11. Find roster given team</option>
    <option value ="12">12. Find team colors based on team </option>
    <option value ="13">13. Find leagues sport is in </option>
    <option value ="14">14. Find Equipment used by sport </option>
    <option value ="15">15. Find year founded based on team</option>
    <option value ="16">16. Find team abbreviation of team </option>
    <option value ="17">17. Find tournaments for sport </option>
    <option value ="18">18. Find possible positions in sport </option>
    <option value ="19">19. Find venues of team </option>

  </select>
  <div id = "placement2">
   Search Input: <input type="text" name="search" id="search"><br>
  <input type="button" value="submit" onClick="submitQuery()">
    </div>
	</div>
	  <div id = "rightside">
			<h1 class = "basicStyle">Sports</h1>
			<div id = "titlearea"></div>
			<div class = "result"> 
				<!--This is where you display the results-->
			</div>
	  </div>
  </body>
  </div>
  
  <!--<div class = "result">
  </div>-->
</html>
