<?php
$slug = $_GET["slug"];

$servername = "localhost";
$username = "local";
$password = "";

$article_query = "SELECT * FROM articles WHERE slug = ?";
//$keyword_query = "SELECT * FROM keywords WHERE id = ?";

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta author="<?php echo $article['author'] ?>" />
    <meta name="description" content="<?php echo $article['description'] ?>" />
    <meta name="keywords" content="<?php echo implode(',', $keywords ?>" />
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
      <ul>
	<?php foreach ($navbar as $navitem) { ?>
	<li><a href="<?php echo $navitem['url'] ?>"><?php echo $navitem['name'] ?></a></li>
      </ul>
    </nav>
    <article>
      <header>
	<h1>
