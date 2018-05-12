module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-05-11"

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
      %> (href (githubQiplProjectUrl "qipl-agda") $ text "Qipl")
      %>> " and my contributions to "
      %> (href (githubUrl ++ "HazenRobotics/ftc_app") $ text "Hazen Robotics")
      %>> "."
     )
  %> (h2 %>> "Audiobooks")
  %> (p
     %>> "I am currently working on recording The Grapes of Wrath for my English teacher "
     %>> "due to a lack of quality recordings of it. You may find that series in "
     %> (href (baseUrl ++ "gow/") $ text "its YouTube playlist")
     %>> "."
     )
