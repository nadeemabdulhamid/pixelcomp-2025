;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gif-red-fill) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

#|
CSC 101 - Pixel Art Competition
Nadeem Abdul Hamid
Fall 2024
|#

(require 2htdp/image)
(require "save-gif.rkt")

;; generate-frame : Nat -> Image
(define (generate-frame n)
  (place-image/align
   (rectangle 16 (remainder n 17) "solid" "red")
   0 0
   "left" "top"
   (rectangle 16 16 "solid" "white")))

;; generate-large-frame : Nat -> Image
(define (generate-large-frame n)
  (scale-bitmap 10 (generate-frame n)))

;; make a list of 17 frames, animate with 15/100 second delay
;; between each one
(save-gif (build-list 17 generate-large-frame) "example2.gif" 15)

