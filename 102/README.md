---
title: "Binding developer-oriented commands to keystrokes in Emacs"
description: "some cider stuff"
published: "2023-11-24"
image: "images/image-post-102.png"
draft: false
---

# Binding developer-oriented commands to keystrokes in Emacs

Simply, you can have

```elisp
(defmacro lw/define-user-eval (fn-name command)
  `(defun ,fn-name ()
    (interactive)
    (cider-eval-file "/path-to/dev/src/user.clj")
    (cider-interactive-eval
      (format (concat "(" ,command ")")
              (cider-last-sexp)))))

(lw/define-user-eval lw/eval-go "go")
(define-key cider-mode-map (kbd "C-c g") 'lw/eval-go)

(lw/define-user-eval lw/eval-halt "halt")
(define-key cider-mode-map (kbd "C-c h") 'lw/eval-halt)
```

In which, 
```elisp
(cider-eval-file "/path-to/dev/src/user.clj")
```

Can be swapped for:

```elisp
(cider-eval-file (format (concat (getenv "CLJ_PLAYGROUND") "dev/src/user.clj")))
```

Using environmental variables, like with `.bashrc`. Thus, being agnostic and flexible.
