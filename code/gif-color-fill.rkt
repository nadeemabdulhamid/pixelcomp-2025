;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gif-color-fill) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

#|
CSC 101 - Pixel Art Competition
Nadeem Abdul Hamid
Fall 2024

(Technically, this one violates the 60 frame constraint...)
|#

(require 2htdp/image)
(require "save-gif.rkt")

(define band-colors
  (list "red"
        "pink"
        "purple"
        "indigo"
        "dark blue"
        "blue"
        "light blue"
        "cyan"
        "teal"
        "green"
        "light green"
        "lime"
        "yellow"
        "goldenrod"
        "orange"
        "dark orange"))

;; generate-frame : Nat -> Image
;; each frame is one additional colored pixel

(define (generate-frame n)  ; n = [0 ... 256]
  (local [
          (define (color-for i)
            (if (<= n i)
                "white"
                (list-ref band-colors (remainder
                                       (+ (remainder i 16) (quotient i 16))
                                       16))))
          ]
  (color-list->bitmap (build-list 256 color-for) 16 16)))

(define frames (build-list 257 generate-frame))

(define frames10x (map (lambda (img) (scale-bitmap 10 img)) frames))

(save-gif frames10x "example3.gif" 3)


