module SitemapXml
  ( ChangeFreq
  , mkPriority
  , defaultPriority
  , defaultUrlData
  , withPriority
  , withLastMod
  , withChangeFreq
  , generateSitemapXml
  ) where

import Text.Printf (printf)

type Sitemap = [UrlData]

data ChangeFreq = CFNever
                | CFYearly
                | CFMonthly
                | CFWeekly
                | CFDaily
                | CFHourly
                | CFAlways

instance Show ChangeFreq where
  show CFNever = "never"
  show CFYearly = "yearly"
  show CFMonthly = "monthly"
  show CFWeekly = "weekly"
  show CFDaily = "daily"
  show CFHourly = "hourly"
  show CFAlways = "always"

data Priority = Priority Int

instance Show Priority where
  -- There is probably a better way to do this
  show (Priority x) = printf "%.1f" (fromIntegral x / 10 :: Float)

mkPriority :: Int -> Priority
mkPriority x | x >= 0 && x <= 10 = Priority x

defaultPriority :: Priority
defaultPriority = mkPriority 5

data UrlData = UrlData
  { url :: String
  , lastMod :: Maybe String
  , changeFreq :: Maybe ChangeFreq
  , priority :: Priority
  }

defaultUrlData :: String -> UrlData
defaultUrlData url = UrlData { url = url, lastMod = Nothing, changeFreq = Nothing, priority = defaultPriority }

withPriority :: Int -> UrlData -> UrlData
withPriority x dat = dat { priority = mkPriority x }

withLastMod :: String -> UrlData -> UrlData
withLastMod x dat = dat { lastMod = Just x }

withChangeFreq :: ChangeFreq -> UrlData -> UrlData
withChangeFreq x dat = dat { changeFreq = Just x }

-- I know there are Xml generation libraries, but it's not worth their inclusion
-- over such a trivial application at this point
data Xml = Tag String [(String, String)] [Xml] | Data String

renderAttribute :: (String, String) -> String
renderAttribute (name, value) = name ++ "=\"" ++ value ++ "\""

xmlComment :: String
xmlComment = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

renderXml :: Xml -> String
renderXml (Data x) = x
renderXml (Tag name attrs body) = openTag
                               ++ renderedBody
                               ++ closeTag
  where openTag = "<" ++ name ++ " " ++ attributes ++ ">"
        attributes = unwords $ map renderAttribute attrs
        renderedBody = foldl1 (++) $ map renderXml body
        closeTag = "</" ++ name ++ ">"

tagNoAttrs :: String -> [Xml] -> Xml
tagNoAttrs name body = Tag name [] body

tagOneBody :: String -> Xml -> Xml
tagOneBody name body = tagNoAttrs name [body]

maybeList :: Maybe a -> [a]
maybeList Nothing = []
maybeList (Just x) = [x]

urlDataToXml :: UrlData -> Xml
urlDataToXml dat = tagNoAttrs "url" $ locTag ++ priorityTag ++ lastModTag ++ changeFreqTag
  where locTag = [tagOneBody "loc" $ Data $ url dat]
        priorityTag = [tagOneBody "priority" $ Data $ show $ priority dat]
        lastModTag = maybeList $ fmap (tagOneBody "lastmod" . Data) $ lastMod dat
        changeFreqTag = maybeList $ fmap (tagOneBody "changefreq" . Data . show) $ changeFreq dat

sitemapToXml :: Sitemap -> Xml
sitemapToXml = Tag "urlset" [("xmlns", "http://www.sitemaps.org/schemas/sitemap/0.9")] . map urlDataToXml

generateSitemapXml :: Sitemap -> String
generateSitemapXml sitemap = xmlComment ++ (renderXml $ sitemapToXml sitemap)
