;; -*- lexical-binding: t; -*-

(setq doom-theme 'doom-city-lights)

(let ((height
          (pcase system-name
              ("rd-udev.resdev.tech" 90)
              ("rd-ws.resdev.tech"   100)
              (_                     100))))
    (set-face-attribute 'default nil :height height)
    (add-to-list 'default-frame-alist `(font . ,(format "DejaVu Sans Mono-%d" (/ height 10)))))
