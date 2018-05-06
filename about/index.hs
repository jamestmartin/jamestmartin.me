module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-05-05"

sitemap :: Sitemap
sitemap = baseSitemap aboutUrl
  `withLastMod` lastModified
  `withPriority` "0.8"
  `withChangeFreq` "weekly"

page :: Html
page = simplePage "About Lijero" "Lijero" lastModified $
  article
  %> (h1 %>> "About")
  %> (p
      %>> "I am a programmer, musician, and hiker. I seek beauty, elegance, and cleanliness in everything I do."
      %>> "I write Agda, Haskell, and Java. I enjoy making programming languages and constructed human languages."
      %>> "This page is, like the rest of the site, obviously incomplete."
     )
