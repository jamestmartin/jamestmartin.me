module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-09-19"

sitemap :: Sitemap
sitemap = baseSitemap projectsUrl
  `withLastMod` lastModified
  `withPriority` "0.8"
  `withChangeFreq` "weekly"

page :: Html
page = simplePage "James's Projects" "James" lastModified $
  article
  %> (h1 %% ("id", "projects") %>> "Projects")
  %> (h2 %% ("id", "programming") %>> "Programming")
  %> (h3 %>> "QIPL")
  %> (p
     %>> "QIPL Is a Programming Language, among other things. "
     %>> "It is intended to be the embodiment of my programming philosophy: "
     %>> "simple sucks less. "
     %>> "More information can be found on "
     %> (href qiplUrl $ text "its website") %>> ". "
     )
  %> (h3 %>> "Hazen Robotics")
  %> (p
     %>> "I am a programmer for the Hazen Robotics team. "
     %>> "All of our code can be found "
     %> (href (githubUrl ++ "HazenRobotics/") $ text "our GitHub organization") %>> ". "
     )
  %> (h3 %>> "html-generator")
  %> (p
     %>> "This website was written using a static site generator I wrote myself. "
     %>> "It's got a really, really long way to go, but you can watch it develop "
     %> (href (githubProjectUrl "html-generator") $ text "on GitHub") %>> ". "
     )
  %> (p
     %>> "There's also the source code for both "
     %> (href (githubProjectUrl "jtmar.me") $ text "jtmar.me")
     %>> " and "
     %> (href (githubQiplProjectUrl "qipl.org") $ text "qipl.org")
     %>> "."
     )
  %> (h3 %>> "Other Projects")
  %> (p
     %>> "I used to have a whole bunch of other cool projects and games "
     %>> "lying around, but they've all been lost in the Great Purge, "
     %>> "which I generally regard as one of the worst mistakes I've ever made. "
     )
  %> (h2 %>> "Music")
  %> (p
     %>> "Writing music is one of my other hobbies, but I have not yet released anything. "
     )
