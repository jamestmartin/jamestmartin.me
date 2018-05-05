module Templates.Icons where

import Templates.Urls

import HtmlGen.Html
import HtmlGen.Tags

personIconUrl :: String
personIconUrl = iconUrl ++ "person.svg"

personIcon :: String -> Html
personIcon alt = img alt personIconUrl

authorIcon :: Html
authorIcon = personIcon "Author"

clockIconUrl :: String
clockIconUrl = iconUrl ++ "clock.svg"

clockIcon :: String -> Html
clockIcon alt = img alt clockIconUrl

updatedIcon :: Html
updatedIcon = clockIcon "Updated"

ccbysaIconUrl :: String
ccbysaIconUrl = resUrl ++ "cc-by-sa-small.png"

ccbysaIcon :: Html
ccbysaIcon = img "This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License" ccbysaIconUrl %% ("style", "border-width:0")

license :: Html
license =
  divTag `withClass` "license"
  %> (href ccbysaUrl ccbysaIcon
      %% ("rel", "license"))

faviconUrl :: String
faviconUrl = baseUrl ++ "favicon.png"

faviconMime :: String
faviconMime = "image/png"

faviconLink :: Html
faviconLink = favicon faviconUrl faviconMime
