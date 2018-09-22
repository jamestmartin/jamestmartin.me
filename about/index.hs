module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-09-22"

sitemap :: Sitemap
sitemap = baseSitemap aboutUrl
  `withLastMod` lastModified
  `withPriority` "0.8"
  `withChangeFreq` "monthly"

page :: Html
page = simplePage "About James" "James" lastModified $
  article
  %> (h1 %>> "About")
  %> (h2 %% ("id", "bio") %>> "Hello,")
  %> (p
      %>> "I'm James T Martin, also known as " %> italic "jtmar" %>> " or " %> italic "jammar" %>> ". "
      %>> "Music is my passion, and programming is my hobby. "
      %>> "I enjoy hiking and skiing. "
      %>> "I value honesty, simplicity, and independence. "
      %>> "I dislike materialism, arrogance, and dogmatic thinking, "
      %>> "and seek to banish these traits from myself. "
      %>> "I have many flaws, but try to make an improvement in myself every day, "
      %>> "so that I might live life to its fullest. "
     )
  %> (p
     %>> "I am a member of my school marching band, jazz band, robotics club, and film club. "
     %>> "I am a moderator of "
     %> (href "https://reddit.com/r/ProgrammingLanguages/" $ text "/r/ProgrammingLanguages") %>> ". "
     %>> "I also work on my various projects, which are listed " %> (href projectsUrl $ text "here") %>> ". "
     )
  %> (h2 %>> "Accounts" %% ("id", "accounts"))
  %> (p %>> "These are the places I am active on the internet.")
  %> (href githubUserUrl githubMark)
  %> (href youtubeUserUrl youtubeLogo)
  %> (href redditUserUrl redditLogo)
--  %> stackexchangeProfile
  %> (p %>> "I am not on any social networking sites. Do not mistake any accounts for mine!")
  %> (h2 %>> "Contact" %% ("id", "contact"))
  %> (h3 %>> "Email" %% ("id", "email"))
  %> (p %> italic "james@[this website]" %>> ". ")
  %> (h3 %>> "IRC" %% ("id", "irc"))
  %> (p
     %>> "I am on freenode as "  %> italic "jammar" %>> ". "
     %>> "If you want to hang out, drop by in " %> italic "#lijero" %>> ". "
     %>> "Just because I am connected does not mean I am online, "
     %>> "so please do not expect an immediate reply. "
     %> unorderedList
      [ href "http://webchat.freenode.net/?channels=%23lijero" $ text "Freenode webchat."
      , href "ircs://chat.freenode.net/lijero" $ text "An IRCS link."
      , href "https://hexchat.github.io/" $ text "HexChat download."
      , text "For connecting via a phone, go download an app. "
      ]
     )
