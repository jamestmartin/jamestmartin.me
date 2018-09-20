module Page where

import HtmlGen
import Templates

lastModified :: String
lastModified = "2018-09-19"

sitemap :: Sitemap
sitemap = baseSitemap aboutUrl
  `withLastMod` lastModified
  `withPriority` "0.2"
  `withChangeFreq` "monthly"

page :: Html
page = simplePage "Contact James" "James" lastModified $
  article
  %> (h1 %>> "Contact Me")
  %> (h2 %>> "How " %> (newTag "em" %>> "not") %>> " to contact me")
  %> (p
     %>> "Contacting me is very straightforward, "
     %>> "but first I must clarify how not to contact me. "
     %> unorderedList
     [ text "I do not use social media like Facebook or Twitter. "
     , text "I do not use proprietary chats like Discord or Skype. "
     , text "I do not carry a phone, so no calls or texts. "
     , text "I do not accept letters, even hand-written ones."
     ]
     )
  %> (h2 %>> "How to actually contact me")
  %> (h3 %>> "Email")
  %> (p
     %> italic "james@[this website]" %>> ". "
     )
  %> (h3 %>> "IRC")
  %> (p
     %>> "IRC is the only option to chat with me in real-time. "
     %>> "I am exclusively on " %> bold "freenode" %>> ", "
     %>> "under either "
     %> italic "jammar" %>> " or " %> italic "jtmar" %>> ". "
     )
  %> (p
     %> italic "#lijero" %>> " is my hangout chat. "
     %>> "Feel free to invite your friends too, though do be discerning in your choices. "
     )
  %> (h4 %>> "IRC FAQ")
  %> (p
     %> unorderedList
     [ text "How do I send images or media? You can't."
     , text "How do I send emoji? You tell me ;)"
     , text "Why isn't anyone responding? Be patient."
     , text "How do I PM you? /query jammar"
     , text "How do I join your channel? /join #lijero"
     , text "Why am I named `Guest`? Because you didn't pick a unique nickname, try /nick SomeOtherName."
     ]
     )
  %> (h4 %>> "Connecting to Freenode")
  %> (p
      %>> "Make sure you pick a unique nickname when connecting. "
      %>> "If it wasn't unique, you will be renamed to Guest1234. "
      %>> "You can try again using /nick SomeOtherName. "
      %> unorderedList
      [ href "http://webchat.freenode.net/?channels=%23lijero" $ text "link to freenode webchat #lijero"
      , href "ircs://chat.freenode.net/lijero" $ text "a direct ircs link if your browser supports it"
      , href "https://hexchat.github.io/" $ text "a downloadable IRC client, HexChat"
      , text "For connecting via a phone, go download an app. "
      ]
     )
  %> (p
     %>> "If you want to get messages people send when you're offline, "
     %>> "just let me know and I can set you up with my ZNC bouncer. "
     )
  %> (h3 %>> "Reddit")
  %> (p
     %>> "This certainly isn't my preferred method, "
     %>> "but feel free to PM "
     %> (href redditUserUrl $ text "my reddit account") %>> "."
     )
  %> (h3 %>> "Voice chat")
  %> (p
     %>> "If you want to hear my beautiful voice, "
     %>> "just let me know and I can set up Mumble or something. "
     %>> "For now though, you can't voice chat with me. "
     )
