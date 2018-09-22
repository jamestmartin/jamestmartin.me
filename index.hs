module Page where

import Templates

import HtmlGen

lastModified :: String
lastModified = "2018-09-22"

sitemap :: Sitemap
sitemap = baseSitemap (baseUrl ++ "/")
  `withLastMod` lastModified
  `withPriority` "1.0"
  `withChangeFreq` "weekly"

page :: Html
page = simplePage "James Martin" "James" lastModified $
  article
  %> (h1 %>> "Home")
  %> (p
      %>> "I have not yet released any blog posts, "
      %>> "or even finished the page generator to be able to make them. "
      %>> "However, the other pages still are a bit more complete. "
     )
