

(defun file-name-cpp-include-guard (prefix name suffix level)
  "Include guard for cpp header file"
  (let ((guard (concat (file-name-base name) "_" (file-name-extension name)))
        (name (directory-file-name (file-name-directory name))))
    (while (> level 0)
      (setq guard (concat (file-name-nondirectory name) "_" guard))
      (setq name (directory-file-name (file-name-directory name)))
      (setq level (1- level)))
    (upcase (concat prefix guard suffix))))


;; use c++-mode for .h file
(setq auto-mode-alist (cons '("\.h$" . c++-mode) auto-mode-alist))


;; google c style
(add-to-list 'load-path
             "~/.emacs.d/plugins/google")
(require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c-mode-common-hook  '(lambda () (c-toggle-hungry-state 1)))

(c-add-style "Google" google-c-style nil)
(defconst custom-google-c-style
  '("Google" ;;; base style
    (c-basic-offset . 4)
    (c-hanging-semi&comma-criteria
     . (c-semi&comma-no-newlines-before-nonblanks
        c-semi&comma-no-newlines-for-oneline-inliners
        c-semi&comma-inside-parenlist))
    (c-cleanup-list . (
                                        ; brace-else-brace
                                        ; brace-elseif-brace
                       brace-catch-brace
                       empty-defun-braces
                       defun-close-semi
                       list-close-comma
                       scope-operator))
    ;;; indent
    (c-offsets-alist
     . ((access-label . -) ;; other
        ))))

(defun custom-google-set-c-style ()
  (interactive)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent t)
  (c-toggle-auto-hungry-state 1)
  (c-toggle-auto-newline -1)
  (c-add-style "custom-google-style" custom-google-c-style t))

;; open .h as c++-mode
(setq auto-mode-alist (cons '("\.h$" . c++-mode) auto-mode-alist))

(add-hook 'c-mode-common-hook 'custom-google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; jump from .h to .cpp
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key  (kbd "C-c o") 'ff-find-other-file)))


;; markdown mode
(add-hook 'markdown-mode-hook
          (lambda ()
            (when buffer-file-name
              (add-hook 'after-save-hook 'check-parens nil t))))

;; saveplace
(require 'saveplace)
(setq-default save-place t)


;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")


;; auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
(ac-config-default)

;; cscope
(add-to-list 'load-path "/usr/local/Cellar/cscope/15.7a/bin/")
(require 'xcscope)
(setq-default cscope-display-cscope-buffer t)

;; yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; ido-mode
(setq ido-enable-flex-matching t) ;; enable fuzzing matching
(setq ido-everywhere t)

;; (setq ido-use-filename-at-point 'guess)
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

;; show-paren-mode
(show-paren-mode t)

;; auto sync project
(add-to-list 'load-path "~/.emacs.d/plugins/auto-sync/")
(require 'auto-sync)
(auto-sync-after-save-buffer-done)
