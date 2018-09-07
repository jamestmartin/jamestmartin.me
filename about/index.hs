module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-05-13"

sitemap :: Sitemap
sitemap = baseSitemap aboutUrl
  `withLastMod` lastModified
  `withPriority` "0.8"
  `withChangeFreq` "weekly"

page :: Html
page = simplePage "About James" "James" lastModified $
  article
  %> (h1 %>> "About")
  %> (h2 %>> "Hello,")
  %> (p
      %>> "I'm James Martin, a student at Hazen High School with an insatiable love of learning. "
      %>> "Right now I'm working on a " %> (href githubQiplUrl $ text "fully reversible programming language")
      %>> ", and actively studying " %> (href "https://homotopytypetheory.org/" $ text "homotopy type theory") %>> "."
     )
  %> (p
     %>> "When I'm not busy with my head in some books or deep into writing some proof, "
     %>> "you can find me involved in various school activities. "
     %>> "I'm a member of the Hazen Marching Band, and the zero-period jazz band. "
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
  %> (p %>> "This is intended to be the exhaustive and canonical list of my online accounts. Anything not listed here is not me.")
  %> (href "https://github.com/lijerom/" githubMark)
  %> (href "https://www.linkedin.com/in/jtmarlijero/" linkedinLogo)
  %> (href "https://www.reddit.com/user/lijero" redditLogo)
  %> (href "https://www.youtube.com/channel/UCdLV1echQeS2BZxF7uSmubw" youtubeLogo)
  %> (href "https://en.wikipedia.org/wiki/User:Lijero" wikipediaLogo)
  %> (href "https://webchat.freenode.net/?channels=%23lijero" freenodeLogo)
  %> (href "https://stackexchange.com/users/10815798/james-martin" $ img "James Martin's Stack Exchange profile" "https://stackexchange.com/users/flair/10815798.png" %% accountIconClass)
  %> (h2 %>> "Contact" %% ("id", "contact"))
  %> (p
      %>> "You may email me at " %> italic "james@[this website]" %>> ". "
      %>> "I may also be found on Freenode as " %> italic "jtmar" %>> ". "
      %>> "A PDF of my resume may be found " %> href resumeUrl (text "here") %>> "."
     )
