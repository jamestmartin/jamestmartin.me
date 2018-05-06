module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-05-06"

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
      %>> "I am a programmer, musician, and hiker. I seek beauty, elegance, and cleanliness in everything I do. "
      %>> "I write Agda, Haskell, and Java. I enjoy making programming languages and constructed human languages. "
      %>> "This page is, like the rest of the site, obviously incomplete."
     )
  %> (h2 %>> "Accounts")
  %> (p %>> "This is intended to be the exhaustive and canonical list of my online accounts. Anything not listed here is not me.")
  %> (href "https://github.com/lijerom/" githubMark)
  %> (href "https://www.linkedin.com/in/jtmarlijero/" linkedinLogo)
  %> (href "https://www.reddit.com/user/lijero" redditLogo)
  %> (href "https://www.youtube.com/channel/UCdLV1echQeS2BZxF7uSmubw" youtubeLogo)
  %> (href "https://en.wikipedia.org/wiki/User:Lijero" wikipediaLogo)
  %> (href "https://webchat.freenode.net/?channels=%23lijero" freenodeLogo)
  %> (href "https://stackexchange.com/users/10815798/james-martin" $ img "James Martin's Stack Exchange profile" "https://stackexchange.com/users/flair/10815798.png" %% accountIconClass)
  %> (h2 %>> "Contact")
  %> (p %>> "You may email me at jtmar@[this website] for professional contact or lijero@[this website]. I may also be found on Freenode as `lijero`.")
