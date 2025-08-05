;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gif-stripes) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

#|
CSC 101 - Pixel Art Competition
Nadeem Abdul Hamid
Fall 2024
|#

(require 2htdp/image)
(require "save-gif.rkt")

;; color-for : Nat -> Color
;; produces black every third number

(check-expect (color-for 1) "white")
(check-expect (color-for 2) "black")
(check-expect (color-for 3) "white")
(check-expect (color-for 4) "white")
(check-expect (color-for 5) "black")
(check-expect (color-for 42) "white")
(check-expect (color-for 44) "black")

(define (color-for i)
  (if (= (remainder i 3) 2)
                    "black"
                    "white"))

;; a list of 256 colors for the 16x16 bitmap:
;;   `(w w B w w B w w B w w B ...)
(define pixels
  (build-list 256 color-for))

;; use `color-list->bitmap` (from the 2htdp/image library) to turn the list of
;; colors into a 16x16 bitmap image
(define img (color-list->bitmap pixels 16 16))

;; use `scale-bitmap` to properly scale it 10x
(define img10x (scale-bitmap 10 img))

;; use `save-image` to save as PNG format (could also use `save-gif`)
(save-image img10x "example1.png")

