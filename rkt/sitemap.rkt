#lang racket
(require "xexprs/xexprs.rkt")
; A quick sitemap-xml generator (https://www.sitemaps.org/)
; Sitemaps help web crawlers index your website

; Ugly hack because I'm bad at Racket
(define (when-present name value rest)
  (if (null? value)
      rest
      (cons (cons name value) rest)))

; A sitemap URL entry
; https://www.sitemaps.org/protocol.html
(define (sitemap-url loc #:lastmod (lastmod '()) #:changefreq (changefreq '()) #:priority (priority 0.5))
  `(url (priority ,priority)
        ,@(when-present "lastmod" lastmod
                        (when-present "changefreq" changefreq
                                      '()))))

; Generates a sitemap xml
(define (sitemap urls)
  (string-append
   "<?xml version="1.0" encoding="UTF-8"?>"
   (xexprs
    `(urlset #:xmlns "http://www.sitemaps.org/schemas/sitemap/0.9"
             ,@urls))))