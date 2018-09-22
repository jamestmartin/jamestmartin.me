module Templates.Icons where

import Templates.Urls

import HtmlGen.Html
import HtmlGen.Tags

personIconUrl :: String
personIconUrl = iconUrl ++ "/" ++ "person.svg"

personIcon :: String -> Html
personIcon alt = img alt personIconUrl

authorIcon :: Html
authorIcon = personIcon "Author"

clockIconUrl :: String
clockIconUrl = iconUrl ++ "/" ++ "clock.svg"

clockIcon :: String -> Html
clockIcon alt = img alt clockIconUrl

updatedIcon :: Html
updatedIcon = clockIcon "Updated"

ccbysaIconUrl :: String
ccbysaIconUrl = resUrl ++ "/cc-by-sa-small.png"

ccbysaIcon :: Html
ccbysaIcon = img "This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License" ccbysaIconUrl

license :: Html
license =
  divTag `withClass` "license"
  %> (href ccbysaUrl ccbysaIcon
      %% ("rel", "license"))

faviconUrl :: String
faviconUrl = baseUrl ++ "/favicon.png"

faviconMime :: String
faviconMime = "image/png"

faviconLink :: Html
faviconLink = favicon faviconUrl faviconMime

accountIconClass :: (String, String)
accountIconClass = ("class", "accounticon")

githubMarkUrl :: String
githubMarkUrl = iconUrl ++ "/github-mark-100px.png"

githubMark :: Html
githubMark = img "GitHub" githubMarkUrl %% accountIconClass

linkedinLogoUrl :: String
linkedinLogoUrl = iconUrl ++ "/linkedin-logo-100px.png"

linkedinLogo :: Html
linkedinLogo = img "LinkedIn" linkedinLogoUrl %% accountIconClass

redditLogoUrl :: String
redditLogoUrl = iconUrl ++ "/reddit-logo-100px.png"

redditLogo :: Html
redditLogo = img "Reddit" redditLogoUrl %% accountIconClass

wikipediaLogoUrl :: String
wikipediaLogoUrl = iconUrl ++ "/wikipedia-logo-100px.png"

wikipediaLogo :: Html
wikipediaLogo = img "Wikipedia" wikipediaLogoUrl %% accountIconClass

youtubeLogoUrl :: String
youtubeLogoUrl = iconUrl ++ "/youtube-logo-100px.jpeg"

youtubeLogo :: Html
youtubeLogo = img "Youtube" youtubeLogoUrl %% accountIconClass

freenodeLogoUrl :: String
freenodeLogoUrl = iconUrl ++ "/freenode-logo.svg"

freenodeLogo :: Html
freenodeLogo = img "Freenode" freenodeLogoUrl %% accountIconClass

stackexchangeProfile :: Html
stackexchangeProfile = href stackexchangeUserUrl $ img "James Martin's Stack Exchange profile" stackexchangeFlairUrl %% accountIconClass
