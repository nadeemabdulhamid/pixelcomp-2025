#lang racket

#|
CSC 101 - Pixel Art Competition
Nadeem Abdul Hamid
Fall 2024
|#

(require pict/convert
         mrlib/gif
         pict
         (only-in 2htdp/image image->color-list color-list->bitmap
                  image-width image-height))

(define (image->bitmap img/s)
  (if (list? img/s)
      (map (λ(i) (image->bitmap i)) img/s)
      (pict->bitmap (pict-convert img/s))))

(define (save-gif img/s name [delay 50])
  (if (list? img/s)
      (write-animated-gif (image->bitmap img/s) delay name)
      (write-gif (image->bitmap img/s) name)))

(define (scale-bitmap mult img)
  (define cs (image->color-list img))  ; [listof color]

  (define by-rows ; [listof [listof color]]
    (for/list ([r (in-range (image-height img))])
      (take (drop cs (* (image-width img) r)) (image-width img))))

  (define exp-rows
    (for/list ([cs/r by-rows])
      (append-map (λ(c) (build-list mult (λ(i) c))) cs/r)))

  (define dup-rows
    (append-map (λ(r) (build-list mult (λ(i) r))) exp-rows))
#|
e.g.
16 - width
r = 5 = row 0  --- drop 0
r = 17 = row 1 -- drop 16

|#
  (color-list->bitmap
   (apply append dup-rows)
   (* mult (image-width img))
   (* mult (image-height img))))



(provide save-gif
         scale-bitmap)