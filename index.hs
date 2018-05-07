module Page where

import Templates

import HtmlGen

lastModified :: String
lastModified = "2018-05-06"

sitemap :: Sitemap
sitemap = baseSitemap "https://lijero.co/"
  `withLastMod` lastModified
  `withPriority` "1.0"
  `withChangeFreq` "weekly"

page :: Html
page = simplePage "Lijero" "Lijero" lastModified $
  article
  %> (h1 %>> "Home")
  %> (p
      %>> "Sorry! This site is currently under construction. "
      %>> "However, you'll find that some of the other pages are more complete."
     )
