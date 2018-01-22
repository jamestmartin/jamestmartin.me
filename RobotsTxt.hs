module RobotsTxt ( defaultRobotsTxt
                 , generateRobotsTxt
                 , forbidUrl
                 , forbidBotUrls
                 , withCrawlDelay
                 , withCanonicalDomain
                 , withSitemap
                 , usingDefaultSitemap
                 ) where

type Seconds = Int
type DomainName = String
type Url = String
type UserAgent = String

data RobotsTxt = RobotsTxt
  { crawlDelay :: Seconds
  , canonicalDomain :: Maybe DomainName
  , sitemapLocation :: Maybe Url
  , globalDisallows :: [Url]
  , botDisallows :: [(UserAgent, [Url])]
  }

defaultRobotsTxt :: RobotsTxt
defaultRobotsTxt = RobotsTxt
  { crawlDelay = 10
  , canonicalDomain = Nothing
  , sitemapLocation = Nothing
  , globalDisallows = []
  , botDisallows = []
  }

forbidUrl :: Url -> RobotsTxt -> RobotsTxt
forbidUrl url cnf = cnf { globalDisallows = url : globalDisallows cnf }

forbidBotUrls :: (UserAgent, [Url]) -> RobotsTxt -> RobotsTxt
forbidBotUrls forbid cnf = cnf { botDisallows = forbid : botDisallows cnf }

withCrawlDelay :: Seconds -> RobotsTxt -> RobotsTxt
withCrawlDelay time cnf = cnf { crawlDelay = time }

withCanonicalDomain :: String -> RobotsTxt -> RobotsTxt
withCanonicalDomain domain cnf = cnf { canonicalDomain = Just domain }

withSitemap :: String -> RobotsTxt -> RobotsTxt
withSitemap url cnf = cnf { sitemapLocation = Just url }

usingDefaultSitemap :: RobotsTxt -> RobotsTxt
usingDefaultSitemap cnf = cnf { sitemapLocation = fmap (++ "/sitemap.xml") $ canonicalDomain cnf }

robotsTxtField :: String -> String -> String
robotsTxtField name value = name ++ ": " ++ value ++ "\n"

robotsTxtEmptyField :: String -> String
robotsTxtEmptyField name = name ++ ":"

globalUserAgent :: String
globalUserAgent = "*"

userAgentField :: UserAgent -> String
userAgentField = robotsTxtField "User-agent"

crawlDelayField :: Seconds -> String
crawlDelayField = robotsTxtField "Crawl-delay" . show

canonicalDomainField :: DomainName -> String
canonicalDomainField = robotsTxtField "Host"

disallowField :: Url -> String
disallowField = robotsTxtField "Disallow"

generateDisallowList :: [Url] -> String
generateDisallowList [] = robotsTxtEmptyField "Disallow"
generateDisallowList xs = foldl1 (++) $ map disallowField xs

generateBotDisallowList :: (UserAgent, [Url]) -> String
generateBotDisallowList (bot, urls) = userAgentField bot ++ generateDisallowList urls

generateRobotsTxt :: RobotsTxt -> String
generateRobotsTxt config = (userAgentField globalUserAgent)
                        ++ (crawlDelayField $ crawlDelay config)
                        ++ (maybe "" canonicalDomainField $ canonicalDomain config)
                        ++ (generateDisallowList $ globalDisallows config)
                        ++ (foldl1 (++) $ map generateBotDisallowList $ botDisallows config)
