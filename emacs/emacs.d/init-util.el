

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn
        (delete-indentation t)
        (if (looking-at " $")
            (delete-char 1)))
    (kill-line arg)))


(defun yank-and-indent ()
  "Yank and then indent the newly formed region according to mode."
  (interactive)
  (yank)
  (call-interactively 'indent-region))


(defun file-name-delemited-to-camel-case (name)
  "convert \"file_name\" to \"FileName\" "
  (progn
    (mapconcat #'capitalize (split-string
                             (file-name-base name) "_") "")))


(defun file-name-base (name)
  "This function is the composition of file-name-sans-extension and file-name-nondirectory"
  (progn
    (file-name-nondirectory (file-name-sans-extension name))))


(provide 'init-util)
