;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gif-run-wait) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

#|
CSC 101 - Pixel Art Competition
Nadeem Abdul Hamid
Fall 2024
|#

(require 2htdp/image)
(require "save-gif.rkt")

(define frames
  (list (overlay (crop 0 0 16 16 (bitmap icons/b-wait.png))
                 (rectangle 16 16 "solid" "light red"))
        (overlay (crop 0 0 16 16 (bitmap icons/b-run.png))
                 (rectangle 16 16 "solid" "light green"))))

(define frames10x (map (lambda (img) (scale-bitmap 10 img)) frames))

(save-gif frames10x "example4.gif" 33)

