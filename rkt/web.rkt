#lang racket/base
(require racket/tcp)
(require racket/string)

; I don't know what the hell is going on but I can't find any useful docs on anything, so... fuck it!
(define (string-empty? str)
  (eq? (string-length str) 0))

(define (string-index str c)
  (define (string-index-p i)
    (if (or (eq? (string-length str) i) (eq? (string-ref str i) c)) i
        (string-index-p (+ i 1))))
  (string-index-p 0))

(define (string-cut str c)
  (define index (string-index str c))
  (values (substring str 0 index) (substring str (+ index 1))))

; Fucking hell
(define (string-split str c)
  (define-values (head tail) (string-cut str c))
  (if (string-empty? tail)
      (list head)
      (cons (head (string-split tail c)))))

(define (parse-request line)
  (string-split line #\ ))

(define (parse-header line)
  (define-values (head tail) (string-cut line #\:))
  (cons (string->symbol head) tail))

(define (read-headers in)
  (define (read-header)
    (define line (read-line in))
    (if (or (eof-object? line) (string-empty? line)) (list)
        (cons (parse-header line) (read-header in))))
  (make-immutable-hash (read-header)))

(define (serve handler #:port (port 8080))
  (define listener (tcp-listen port 4 #t))
  (define (handle in out)
    (define request-line (parse-request (read-line in)))
    (define request-headers (read-headers in))
    (define message-body "") ; Temporary

    (display (handler request-line request-headers message-body) out)
    
    (close-input-port in)
    (close-output-port out))
  (define (loop)
    (define-values (in out) (tcp-accept listener))
    (thread (λ () (handle in out)))
    (loop))
  (loop))

(define status/ok '(200 "OK"))

(define (headers->string headers)
  (define (header->string header)
    (string-append (symbol->string (car header)) ": " (cdr header)))
  (string-join (map header->string (hash->list headers)) "\r\n"))

(define (response (body "") #:status (status status/ok) #:headers (headers '()))
  (string-append
   "HTTP/1.0 " (number->string (car status)) (cadr status) "\r\n"
   (headers->string headers) "\r\n\r\n"
   body))
   
(define (my-handler req headers body)
  (response "<html><body>test</body></html>" #:headers (make-immutable-hash '(Content-Type "text/html; charset=UTF-8"))))

(serve my-handler)