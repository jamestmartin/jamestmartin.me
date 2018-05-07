module Templates
  ( module Templates
  , module Templates.Urls
  , module Templates.Icons
  ) where

import Templates.Urls
import Templates.Icons

import HtmlGen

basePage :: String -> String -> Html -> Html
basePage pageTitle authorName content =
  html %% xmlns %% langEn
    %> (headTag
       %> utf8
       %> author authorName
       %> allowRobots
       %> stylesheet stylesheetCommonUrl
       %> faviconLink
       %> (title %>> pageTitle)
       %> viewport
       %> (newTag "script" %% ("async", "async") %% ("src", resUrl ++ "common.js"))
       )
    %> content

navSection :: Html
navSection =
  nav
  %> (spanTag `withId` "navbrand" %> ((href baseUrl $ text "Lijero") %% ("class", "navbrand")))
  %> unorderedList
         [ href baseUrl $ text "Home"
         , href projectsUrl $ text "Projects"
         , href aboutUrl $ text "About"
         ]

footerSection :: String -> String -> Html
footerSection authorName dateModified =
  footer
  %> (divTag `withClass` "metadata"
     %> (spanTag
         %> authorIcon
         %>> ' ' : authorName ++ " "
        )
     %> (spanTag
        %> updatedIcon
        %>> ' ' : dateModified ++ " "
        )
     %> license
     )

simplePage :: String -> String -> String -> Html -> Html
simplePage titleName authorName dateModified content =
  basePage titleName authorName $
    body %> navSection
         %> content
         %> footerSection authorName dateModified

redirectPage :: String -> String -> Html
redirectPage name url =
  html
  %> (headTag
     %> utf8
     %> (meta
         %% ("http-equiv", "refresh")
         %% ("content", "0;url=" ++ url)
        )
     %> (title %>> "Redirecting to " ++ url)
     )
  %> (body
     %> (href url $ p
        %>> ("Click here if you are not being redirected to " ++ name)
        )
     )
