 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
		
		<style type="text/css">
		.footer{
		width:100%;
		}
	.cuadro_intro_hover{
        padding: 0px;
		position: relative;
		overflow: hidden;
		height: 200px;
	}
	.cuadro_intro_hover:hover .caption{
		opacity: 1;
		transform: translateY(-150px);
		-webkit-transform:translateY(-150px);
		-moz-transform:translateY(-150px);
		-ms-transform:translateY(-150px);
		-o-transform:translateY(-150px);
	}
	.cuadro_intro_hover img{
		z-index: 4;
	}
	.cuadro_intro_hover .caption{
		position: absolute;
		top:150px;
		-webkit-transition:all 0.3s ease-in-out;
		-moz-transition:all 0.3s ease-in-out;
		-o-transition:all 0.3s ease-in-out;
		-ms-transition:all 0.3s ease-in-out;
		transition:all 0.3s ease-in-out;
		width: 100%;
	}
	.cuadro_intro_hover .blur{
		background-color: #00547E;
		opacity:0.7;
		height: 300px;
		z-index: 5;
		position: absolute;
		width: 100%;
	}
	.cuadro_intro_hover .caption-text{
		z-index: 10;
		color: #fff;
		position: absolute;
		height: 300px;
		text-align: center;
		top:-20px;
		width: 100%;
	}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<hr>	
		<div class="col-lg-3">
			<div class="cuadro_intro_hover " style="background-color:#cccccc;">
				<p style="text-align:center; margin-top:20px;">
					<img src="http://placehold.it/500x330" class="img-responsive" alt="">
				</p>
				<div class="caption">
					<div class="blur">
					</div>
					<div class="caption-text">
						<h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">THIS IS H3</h3>
						<p>Loren ipsum dolor si amet ipsum dolor si amet ipsum dolor...</p>
						<a class=" btn btn-default" href="#"><span class="glyphicon glyphicon-plus"> INFO</span></a>
					</div>
				</div>
			</div>	
		</div>
	    <div class="col-lg-3">
	    	<div class="cuadro_intro_hover " style="background-color:#cccccc;">
				<p style="text-align:center; margin-top:20px;">
					<img src="http://placehold.it/500x330" class="img-responsive" alt="">
				</p>
				<div class="caption">
					<div class="blur"></div>
					<div class="caption-text">
						<h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">THIS IS H3</h3>
						<p>Loren ipsum dolor si amet ipsum dolor si amet ipsum dolor...</p>
						<a class=" btn btn-default" href="#"><span class="glyphicon glyphicon-plus"> INFO</span></a>
					</div>
				</div>
			</div>
					
		    </div>
	        <div class="col-lg-3">
	        	<div class="cuadro_intro_hover " style="background-color:#cccccc;">
					<p style="text-align:center; margin-top:20px;">
						<img src="http://placehold.it/500x330" class="img-responsive" alt="">
					</p>
					<div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
							<h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">THIS IS H3</h3>
							<p>Loren ipsum dolor si amet ipsum dolor si amet ipsum dolor...</p>
							<a class=" btn btn-default" href="#"><span class="glyphicon glyphicon-plus"> INFO</span></a>
						</div>
					</div>
				</div>	
		     </div>
	        
	        <div class="col-lg-3">
	        	<div class="cuadro_intro_hover " style="background-color:#cccccc;">
					<p style="text-align:center; margin-top:20px;">
						<img src="http://placehold.it/500x330" class="img-responsive" alt="">
					</p>
					<div class="caption">
						<div class="blur"></div>
						<div class="caption-text">
							<h3 style="border-top:2px solid white; border-bottom:2px solid white; padding:10px;">THIS IS H3</h3>
							<p>Loren ipsum dolor si amet ipsum dolor si amet ipsum dolor...</p>
							<a class=" btn btn-default" href="#"><span class="glyphicon glyphicon-plus"> INFO</span></a>
						</div>
					</div>
				</div>	
		    </div>
		<hr/>
		<p>©Person.com  | <a href="">реклама</a> | <a href=""> реклама</a></p>
	</body>
</html> 