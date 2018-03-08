;;; find-file-global-history.el --- Include files opened by other means in file-name-history  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Mikhail Pontus

;; Author: Mikhail Pontus <mpontus@gmail.com>
;; Keywords: files

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; By default file-name-history will only include files opened by
;; `find-file' command.
;;
;; Other means to open a file include custom commands, such as
;; `projectile-find-file', or by following xref.
;;
;; This package provides a global minor mode which ensures that files
;; opened by any means will end up in file-name-history.

;;; Code:

(defun find-file-global-history-hook ()
  "Add current file to `file-name-history'."
  (let ((file-name (buffer-file-name)))
    (unless (equal file-name (car file-name-history))
      (push file-name file-name-history))))

(define-minor-mode find-file-global-history-mode
  "When enabled any opened files will be added to `file-name-history'."
  :global t
  (if find-file-global-history-mode
      (add-hook 'find-file-hook 'find-file-global-history-hook)
    (remove-hook 'find-file-hook 'find-file-global-history-hook)))

(provide 'find-file-global-history)
;;; find-file-global-history.el ends here
