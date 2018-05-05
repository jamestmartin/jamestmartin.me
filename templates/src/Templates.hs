module Templates where

import Templates.Urls
import Templates.Icons

import HtmlGen.Html
import HtmlGen.Tags

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
       )
    %> content

navSection :: Html
navSection =
  nav
  %> (spanTag `withId` "navbrand" %>> "Lijero")
  %> unorderedList
         [ href baseUrl $ text "Home"
         , href qiplUrl $ text "Qipl"
         , href aboutUrl $ text "About"
         ]

footerSection :: String -> String -> Html
footerSection authorName dateModified =
  footer
  %> (divTag `withClass` "metadata"
     %> (spanTag
         %> authorIcon
         %>> ' ' : authorName
        )
     %> (spanTag
        %> updatedIcon
        %>> ' ' : dateModified
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
