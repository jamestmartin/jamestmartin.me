<?php
$slug = $_GET["slug"];

$servername = "localhost";
$username = "local";
$password = "";
$dbname = "articles";
$conn = new mysqli($servername, $username, $password);

if (!function_exists('mysqli_init') && !extension_loaded('mysqli')) {
    echo 'We don\'t have mysqli!!!';
} else {
    echo 'Phew we have it!';
}

$article_query = "SELECT title, author, description, keywords, updated FROM articles WHERE slug = '?'";
$keyword_query = "SELECT keyword FROM keywords WHERE id = ?";

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

if (!($stmt = $conn->prepare($article_query))) {
    echo "Prepare failed: (" . $mysqli->errno . ") " . $mysqli->error;
}

$stmt->bind_param("s", $slug);
$stmt->execute();
$article = $stmt->get_result()->fetch_assoc();

$stmt = $conn->prepare($keyword_query);
$stmt->bind_param("i", $article['keywords']);
$stmt->execute();
$keywords = $stmt->get_result()->fetch_assoc();

$conn->close();

$article_content_file_location = "/var/www/html/articles/" + $slug;
$article_content_file = fopen($article_content_file_location, "r") or die ("404 File not found!");
$article_content = fread($article_content_file, filesize($article_content_file_location));
fclose($article_content_file);
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta author="<?php echo $article['author'] ?>" />
    <meta name="description" content="<?php $article['description'] ?>" />
    <meta name="keywords" content="<?php implode(',', $keywords) ?>" />
    <meta name="robots" content="index,follow" />
    <title><?php echo $article['title'] ?> - Lijero</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="/favicon.png" rel="icon" type="image/png" />
    <link href="/res/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var _paq = _paq || [];
_paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
_paq.push(["setCookieDomain", "*.lijero.co"]);
_paq.push(["setDomains", ["*.lijero.co"]]);
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
(function() {
  var u="//p.lijero.co/";
  _paq.push(['setTrackerUrl', u+'foo']);
  _paq.push(['setSiteId', '1']);
  var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
  g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'foo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
  </head>
  <body>
    <nav>
      <div id="navbrand">Lijero</div>
      <ul><?php foreach ($navbar as $navitem) { ?>
	    <li><a href="<?php $navitem['url'] ?>"><?php $navitem['name'] ?></a></li>
      <?php } ?></ul>
    </nav>
    <article>
      <header>
        <h1><?php $article['title'] ?></h1>
      </header>
	  <?php $article_content ?>
    </article>
    <footer>
      <div class="metadata">
        <span><img alt="Author" src="//lijero.co/res/icon/person.svg" /> <?php $article['author'] ?></span>
        <span><img alt="Updated" src="//lijero.co/res/icon/clock.svg" /> <?php $article['updated'] ?></span>
        <div class="license">
          <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">
            <img alt="This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License" style="border-width:0" src="/res/cc-by-sa-small.png" />
          </a>
        </div>
      </div>
    </footer>
  </body>
</html>