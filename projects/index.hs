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
  %> (h1 %>> "Projects")
  %> (h2 %>> "Programming")
  %> (p
      %>> "All of my active programming projects may be found on "
      %> (href githubUserUrl $ text "my Github page")
      %>> ". My most notable projects include my work-in-progress programming language "
      %> (href (githubQiplProjectUrl "qipl-asm") $ text "Qipl")
      %>> " and my contributions to "
      %> (href (githubUrl ++ "HazenRobotics/ftc_app") $ text "Hazen Robotics")
      %>> ". I also have a planned bootable Qipl-based operating system, named "
      %> (href (githubQiplProjectUrl "quos-kernel") $ text "Quos")
      %>> "."
     )
  %> (p
     %>> "In addition, we have the static site generator I wrote for this website, "
     %> (href (githubProjectUrl "html-generator") $ text "html-generator")
     %>> ", and of course "
     %> (href (githubProjectUrl "jtmar.me") $ text "the source code for this website itself")
     %>> "."
     )
  %> (h2 %>> "Music")
  %> (p
     %>> "Writing music is one of my other hobbies. "
     %>> "However, I have not yet released anything. "
     )
