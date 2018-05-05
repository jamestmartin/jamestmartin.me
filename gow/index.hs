module Page where

import Templates

import HtmlGen.Sitemap
import HtmlGen.Html

sitemap :: Sitemap
sitemap = baseSitemap "https://lijero.co/gow/"
  `withChangeFreq` "never"
  `withPriority` "0.0"
  `withLastMod` "2018-05-05"

page :: Html
page = redirectPage "The Grapes of Wrath (Audio) playlist" "https://www.youtube.com/playlist?list=PL0_-F4mPidOAXcnn9bBhaZ8byRyC4FyRyC4FpvC"
