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
      %>> "Hi! I'm James Martin, a student at Hazen High School with an insatiable love of learning. "
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
  %> (h2 %>> "Hobbies")
  %> (h3 %>> "Programming")
  %> (p
     %>> "Obviously, I'm a programmer. "
     %>> "Aside from the aforementioned programming language and this website, "
     %>> "I've written a Minecraft clone, platformer games, HTTP and IRC servers, "
     %>> "other programming languages, and similar things."
     )
  %> (p
     %>> "I've researched operating systems and CPUs, "
     %>> "though I never got far in implementing either. "
     %>> "I sure learned a lot in the process, though! "
     %>> "I did actually implement a CPU in Minecraft once, "
     %>> "though I don't think that really counts."
     )
  %> (p
     %>> "Once upon a time I also ran a fairly popular Minecraft server, "
     %>> "most gameplay features of which were custom coded. "
     %>> "That said, I was eleven, which was not exactly my prime. "
     )
  %> (h3 %>> "Conlanging")
  %> (p
     %>> "Conlanging is the art of artificial language construction. "
     %>> "It's a lot of fun, because it's at the perfect intersection "
     %>> "of creative and technical. "
     %>> "It's also given me a reasonable linguistics background."
     )
  %> (p
     %>> "There's also Worldbuilding, "
     %>> "immersing yourself in entire new worlds for fun and profit. "
     %>> "Unfortunately I haven't had as much time recently to do this as I'd like."
     )
  %> (h3 %>> "Music")
  %> (p
     %>> "Aside from being a trombonist, I have very broad tastes in music. "
     %>> "I like everything from jazz to glitch funk to rock. "
     %>> "I'm taking AP Music Theory so I can learn to compose my own!"
     )
  %> (h2 %>> "Things I use")
  %> (h3 %>> "Programming Languages")
  %> (h4 %>> "The daily drivers")
  %> unorderedList
  [ spanTag %> bold "Haskell" %>> ", my go-to language."
  , spanTag %> bold "Agda" %>> ", used for writing proof-carrying code."
  , spanTag %> bold "Java" %>> ", used in Hazen Robotics."
  , spanTag %> bold "HTML" %>> " and " %> bold "CSS" %>> ", for this website."
  ]
  %> (h4 %>> "Interesting alternatives")
  %> unorderedList
  [ spanTag %> bold "Racket" %>> ", though usually I prefer Haskell."
  , spanTag %> bold "Rust" %>> ", though I don't write much low-level code."
  , spanTag %> bold "Forth" %>> " and " %> bold "Prolog" %>> ", interesting but impractical."
  , spanTag %> bold "C#" %>> ", though I'm more likely to use Java."
  ]
  %> (h3 %>> "GNU/Linux")
  %> (p
      %>> "I'm a satisfied user of Debian GNU/Linux and a supporter of "
      %> (href "https://www.gnu.org/philosophy/free-sw.html" $ text "free software") %>> ". "
      %>> "I enjoy the simplicity and power of " %> (href "http://xmonad.org/" $ text "xmonad") %>> ". "
      %>> "Emacs is my preferred editor."
     )
  %> (h3 %>> "Let's Encrypt")
  %> (p
      %>> "I believe that it is important to " %> (href "https://www.eff.org/encrypt-the-web" $ text "encrypt the web") %>> ". "
      %>> "This website uses strong encryption provided by " %> (href "https://letsencrypt.org/" $ text "Let's Encrypt") %>> ". "
      %>> "In fact, " %> (href "https://www.ssllabs.com/ssltest/analyze.html?d=lijero.co&amp;latest" $ text "this site has a perfect (A+) score") %>> " on SSL Labs."
     )
  %> (p
     %>> "Relatedly, you can find the entirety of this site's source code " %> (href (githubProjectUrl "lijero.co") $ text "on GitHub") %>> ". "
     %>> "The site's Nginx, DNS, and other configuration can be found in " %> (href (githubProjectUrl "lijero.co-config") $ text "another repository") %>> "."
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
  %> (p %>> "You may email me at " %> italic "jtmar@[this website]" %>> " for professional contact or " %> italic "lijero@[this website]" %>> ". I may also be found on Freenode as " %> italic "lijero" %>> ".")
