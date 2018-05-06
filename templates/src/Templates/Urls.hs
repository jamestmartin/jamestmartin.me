module Templates.Urls where

baseUrl :: String
baseUrl = "https://lijero.co/"

resUrl :: String
resUrl = baseUrl ++ "res/"

iconUrl :: String
iconUrl = resUrl ++ "icon/"

ccbysaUrl :: String
ccbysaUrl = "http://creativecommons.org/licenses/by-sa/4.0/"

stylesheetCommonUrl :: String
stylesheetCommonUrl = resUrl ++ "common.css"

projectsUrl :: String
projectsUrl = baseUrl ++ "projects/"

aboutUrl :: String
aboutUrl = baseUrl ++ "about/"

githubUrl :: String
githubUrl = "https://github.com/"

githubUserUrl :: String
githubUserUrl = githubUrl ++ "LijeroM/"

githubProjectUrl :: String -> String
githubProjectUrl name = githubUserUrl ++ name ++ "/"

githubQiplUrl :: String
githubQiplUrl = githubUrl ++ "qipl/"

githubQiplProjectUrl :: String -> String
githubQiplProjectUrl name = githubQiplUrl ++ name ++ "/"
