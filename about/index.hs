module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-09-19"

sitemap :: Sitemap
sitemap = baseSitemap aboutUrl
  `withLastMod` lastModified
  `withPriority` "0.8"
  `withChangeFreq` "monthly"

page :: Html
page = simplePage "About James" "James" lastModified $
  article
  %> (h1 %>> "About")
  %> (h2 %>> "Hello,")
  %> (p
      %>> "I'm James Martin, a student at Hazen High School with an insatiable love of learning, "
      %>> "programmer, musician, and moderator of "
      %> (href "https://reddit.com/r/ProgrammingLanguages/" $ text "/r/ProgrammingLanguages")
      %>> ". "
      %>> "Right now I'm working on my project " %> (href "https://qipl.org" $ text "Qipl") %>> ", "
      %>> "which includes a compiler and bootable development environment. "
      %>> "I'm a moderator of "
      
     )
  %> (p
     %>> "When I'm not busy with my head in some books or deep into writing some proof, "
     %>> "you can find me involved in various school activities. "
     %>> "I'm a member of the Hazen Marching Band, the zero-period jazz band, "
     %>> "Film Club, the weekly D&amp;D meetings. "
     %>> "In addition I write Java for "
     %> (href "https://github.com/HazenRobotics/" $ text "robotics club")
     %>> ". "
     )
  %> (p
     %>> "When the outdoors call you'll find me hiking or skiing. "
     %>> "There isn't anywhere quite like a mountaintop in clear weather, "
     %>> "a crystal-clear alpine lake, "
     %>> "or a challenging slope covered in fresh powder."
     )
  %> (h2 %>> "Accounts" %% ("id", "accounts"))
  %> (p %>> "This is intended to be the exhaustive and canonical list of my online accounts. Anything not listed here is not me, or no longer active.")
  %> (href githubUserUrl githubMark)
  %> (href redditUserUrl redditLogo)
  %> (href youtubeUserUrl youtubeLogo)
  %> (href wikipediaUserUrl wikipediaLogo)
  %> stackexchangeProfile
  %> (h2 %>> "Contact" %% ("id", "contact"))
  %> (p
      %>> "You may email me at " %> italic "james@[this website]" %>> ". "
      %>> "I may also be found on Freenode as " %> italic "jammar" %>> ". "
     )
