;;;; gentext-tex.el in support of generic-text.el -- generic things that get passed to TeX, LaTeX, html, troff, texinfo etc
;;; Time-stamp: <2006-02-09 12:17:29 jcgs>

;;  This program is free software; you can redistribute it and/or modify it
;;  under the terms of the GNU General Public License as published by the
;;  Free Software Foundation; either version 2 of the License, or (at your
;;  option) any later version.

;;  This program is distributed in the hope that it will be useful, but
;;  WITHOUT ANY WARRANTY; without even the implied warranty of
;;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;  General Public License for more details.

;;  You should have received a copy of the GNU General Public License along
;;  with this program; if not, write to the Free Software Foundation, Inc.,
;;  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

(provide 'gentext-texinfo)
(require 'gentext-models)
(require 'texinfo)

;;; not yet complete

(defmodal generic-text-header-1 (texinfo-mode) (&optional ignore)
  "Insert the string `@chapter' in a Texinfo buffer."
  (interactive)
  (insert "@chapter ")
  (newline))

(defmodal generic-text-header-2 (texinfo-mode) (&optional ignore)
  "Insert the string `@section' in a Texinfo buffer."
  (interactive)
  (insert "@section ")
  (newline))

(defmodal generic-text-header-3 (texinfo-mode) (&optional ignore)
  "Insert the string `@subsection' in a Texinfo buffer."
  (interactive)
  (insert "@subsection ")
  (newline))

(defmodal generic-text-unordered-list (texinfo-mode) (&optional surround)
  "Insert, or wrap, an unordered list."
  (if surround
      (progn
	(goto-char (region-end))
	(insert "@end itemize\n")
	(goto-char (region-beginning))
	(insert "\n@itemize\n"))
    (delete-blank-lines)
    (delete-blank-lines)
    (insert "\n@itemize\n")
    ;; (generic-text-insert-item)
    (save-excursion
      (insert "@end itemize\n")
      (delete-blank-lines)
      (delete-blank-lines)
      (insert "\n"))))

(defmodal generic-text-insert-item (texinfo-mode) (&optional ignore)
  "Insert an item."
  (unless (bolp) (insert "\n"))
  ;; I don't like the built-in one
  ;; (texinfo-insert-@item) (end-of-line 0)
  (insert "@item")
  (just-one-space))

(defmodalalias generic-text-blockquote (texinfo-mode) texinfo-insert-@quotation)
(defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@code)
;; (defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@email)
;; (defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@example)
;; (defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@file)
;; (defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@samp)
(defmodalalias generic-text-definition (texinfo-mode) texinfo-insert-@dfn)
(defmodalalias generic-text-em (texinfo-mode) texinfo-insert-@emph)
(defmodalalias generic-text-end-exclamation (texinfo-mode) end-exclamation)
(defmodalalias generic-text-end-question (texinfo-mode) end-question)
(defmodalalias generic-text-end-sentence (texinfo-mode) end-sentence)
(defmodalalias generic-text-keyboard (texinfo-mode) texinfo-insert-@kbd)
(defmodalalias generic-text-strong (texinfo-mode) texinfo-insert-@strong)
(defmodalalias generic-text-table (texinfo-mode) texinfo-insert-@table)
(defmodalalias generic-text-variable (texinfo-mode) texinfo-insert-@var)
; (defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@uref)
;(defmodalalias generic-text- (texinfo-mode) texinfo-insert-@-with-arg)
;(defmodalalias generic-text- (texinfo-mode) texinfo-insert-@end)
;(defmodalalias generic-text- (texinfo-mode) texinfo-insert-@node)
;(defmodalalias generic-text- (texinfo-mode) texinfo-insert-@noindent)
;(defmodalalias generic-text-code (texinfo-mode) texinfo-insert-@url)

;;; end of generic-text.el
