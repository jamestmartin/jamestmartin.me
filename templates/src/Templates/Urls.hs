module Templates.Urls where

baseUrl :: String
baseUrl = "https://jtmar.me"

resUrl :: String
resUrl = baseUrl ++ "/res"

iconUrl :: String
iconUrl = resUrl ++ "/icon"

ccbysaUrl :: String
ccbysaUrl = "http://creativecommons.org/licenses/by-sa/4.0/"

stylesheetCommonUrl :: String
stylesheetCommonUrl = resUrl ++ "/common.css"

projectsUrl :: String
projectsUrl = baseUrl ++ "/projects"

aboutUrl :: String
aboutUrl = baseUrl ++ "/about"

githubUrl :: String
githubUrl = "https://github.com"

githubUserUrl :: String
githubUserUrl = githubUrl ++ "/jammar"

githubProjectUrl :: String -> String
githubProjectUrl name = githubUserUrl ++ "/" ++ name

githubQiplUrl :: String
githubQiplUrl = githubUrl ++ "/" ++ "qipl"

githubQiplProjectUrl :: String -> String
githubQiplProjectUrl name = githubQiplUrl ++ "/" ++ name

resumeUrl :: String
resumeUrl = baseUrl ++ "/resume.pdf"

qiplUrl :: String
qiplUrl = "https://qipl.org"

redditUserUrl :: String
redditUserUrl = "https://reddit.com/user/lijero"

youtubeUserUrl :: String
youtubeUserUrl = "https://www.youtube.com/channel/UC_nCB91N-0zNbFiMoMu6-3w"

wikipediaUserUrl :: String
wikipediaUserUrl = "https://en.wikipedia.org/wiki/User:Lijero"

stackexchangeUserUrl :: String
stackexchangeUserUrl = "https://stackexchange.com/users/10815798/james-martin"

stackexchangeFlairUrl :: String
stackexchangeFlairUrl = "https://stackexchange.com/users/flair/10815798.png"
