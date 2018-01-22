#lang racket
;; /robots.txt specifies how web crawlers should access your website
;; see www.robotstxt.org

; Generate a robots.txt field
(define (robots-field name (body '()))
  (define robots-field-base (string-append name ":"))
  (if (null? body) robots-field-base
      (string-append robots-field-base " " body)))

; Generate a user agent line
(define (robots-ua (name "*"))
  (robots-field "User-agent" name))

; Generate a bunch of Disallow lines from a list of urls
(define (robots-disallow list)
  (if (empty? list) (robots-field "Disallow")
      (string-append*
       (map list (lambda (url)
                   (robots-field "Disallow" url))))))

; Map into and unwrap an optional value: if x present, f x, else d
(define (when-present d f x)
  (if (null? x) d
      (apply f x)))

; Forbid specific urls to a specific bot by user agent
(define (robots-forbidbot bot disallows)
  (string-append
   (robots-ua bot)
   (robots-disallow disallows)))

; Blocks format: (cons (list of global blocks) (list of (cons bot-ua (list of urls))))
(define (robots-config (blocks '())
                       #:crawl-delay (crawl-delay 10) ; How frequently a bot should access your site-- poorly specified
                       #:host (host '())              ; The canonical domain for your website
                       #:sitemap (sitemap '()))       ; Your sitemap.xml
  (define (field-when-present name value)
    (when-present "" ((curry robots-field) name) value))
  (define block-lists
    (when-present ""
     (match-lambda
       ([cons global rest]
        (string-append
         ; First we have the global disallow rules
         (robots-disallow global)
         (string-append*
          ; then a list of the disallow rules for individual bots
          (map (match-lambda
                 ([cons bot urls]
                  (robots-forbidbot bot urls))) rest)))))
     blocks))
  (string-append
   (robots-ua)
   block-lists
   (robots-field "Crawl-delay" (number->string crawl-delay))
   (field-when-present "Sitemap" sitemap)
   (field-when-present "Host" host)))
  