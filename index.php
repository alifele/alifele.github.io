<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Hello</title>
    <link rel="stylesheet" href="master.css">


    <script type="text/javascript">
      function clicked(){
      var x = getElementById("name").value;
      if (x){
      document.getElementById('by by').innerHTML="welcome" + x;
    }
    else{
      document.getElementById('error').innerHTML = <font color='red'> {required} Name </font>
    }
    }
    </script>


  </head>
  <body>
    <div class="main">

      <div class="row1">
            <p align='center'><img src="img.jpg" alt="header"></p>
      </div>

      <div class="row2">

        <div class="row2col1">
          <ul>
            <li>more info about me</li>
            <li>the status of home</li>
            <li>the database access</li>
            <li>login</li>
          </ul>
        </div>


        <?php include("new.php"); ?>



  </div>

    </div>
  </body>
</html>
