<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard(A).aspx.cs" Inherits="School.WebForm1" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.2.1/pure-min.css">
        <link rel="stylesheet" href="http://weloveiconfonts.com/api/?family=fontawesome">
        <link rel="stylesheet" href="css/main.css">
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
     
    </head>
    <body>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
 


        <header>

          <nav class="pure-menu pure-menu-open pure-menu-horizontal pure-menu-blackbg">
                <a href="#" class="pure-menu-heading pure-menu-selected">ADMIN</a>
                
            </nav>
        </header>
        <section class="dashboard pure-g-r clearfix">
            <div class="pure-u-1 photo-box">
            <a href="http://www.flickr.com/photos/95572727@N00/4070581709/">
                 <img src="images/Capture.jpg"
                 alt="Photo of a Bamboo forest in Kyoto."/>
                     </a>
                     <aside class="photo-box-caption">
               DASHBOARD
                 </aside>
            </div>
            <div class="pure-u-1-3 photo-box2">
            
            <a href="http://www.flickr.com/photos/95572727@N00/4070581709/">
                 <img src="images/Capture1.jpg"
                 alt="Photo of a Bamboo forest in Kyoto."/>
                     </a>
                     <aside class="photo-box2-caption">
               Branch
                 </aside>
            </div>
            <div class="pure-u-1-3 photo-box2">
           <a href="http://www.flickr.com/photos/95572727@N00/4070581709/">
                 <img src="images/Capture3.jpg"
                 alt="Photo of a Bamboo forest in Kyoto."/>
                     </a>
                     <aside class="photo-box-caption">
               Class
                 </aside>
            </div>
           
            <div class="pure-u-1-3 photo-box2">
           <a href="http://www.flickr.com/photos/95572727@N00/4070581709/">
                 <img src="images/Capture2.jpg"
                 alt="Photo of a Bamboo forest in Kyoto."/>
                     </a>
                     <aside class="photo-box-caption">
               Teachers
                 </aside>
            </div>
        </section>
        <section class="dashboard pure-g-r clearfix">
            <div class="pure-u-2-3 dashboard-piece dashboard-piece-graybg dashboard-piece-events">
            <nav class="pure-menu pure-menu-bluebg">
            <a href="#">Students</a>
                <div class="dashboard-content">
                    <p class="dashboard-metric">
                        <h2><i class="fontawesome-calendar"></i></h2>
                    </p>
                       <div class="light bar-horizontal">
                                <div class="bar-horizontal-bar" style="width:80%">80%</div>
                            </div>
                       
                   
                       
                </div>
                </nav>
            </div>
            <div class="pure-u-1-3 dashboard-piece dashboard-piece-purplebg ">
             <nav class="pure-menu pure-menu-bluebg">
             <a href="#">Tickets</a>
                <div class="dashboard-content">
                    <p class="dashboard-metric">
                        <h2><i class="fontawesome-umbrella"></i></h2>
                         </p>
                            <div class="light bar-horizontal">
                                <div class="bar-horizontal-bar" style="width:80%">80%</div>
                            </div>
                       
                   
                </div>
                 </nav>
            </div>
        </section>
        <footer>
            &copy; 2013 Envato
        </footer>
        

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>            window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
            (function (d, t) {
                var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
                g.src = '//www.google-analytics.com/ga.js';
                s.parentNode.insertBefore(g, s)
            } (document, 'script'));
        </script>
          
    </body>
</html>
