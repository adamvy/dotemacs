(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-1password-vault "Personal")
 '(column-number-mode t)
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
   '("7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "6ac2faf17d4d37b6f4bc08203b70e82f4b3b5ce76f102fb4802b3f6c74460743" "1d1f4f5b0f792f0bb1b8f944b8ed93b3b20bbebc4ba072c2b7daff82da23ae86" "039112154ee5166278a7b65790c665fe17fd21c84356b7ad4b90c29ffe0ad606" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" default))
 '(epg-pinentry-mode 'loopback)
 '(global-undo-tree-mode t)
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(js-indent-level 2)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-selected-packages
   '(neotree kotlin-mode tree-sitter-langs swift-mode gptel auth-source-1password spacemacs-theme olivetti nord-theme undo-tree visual-fill visual-fill-column base16-theme magit eglot-java eglot dape helm-project helm-lsp helm lsp-java dap-mode llm projectile project))
 '(tool-bar-mode nil)
 '(xref-search-program 'ripgrep))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#fbf8ef" :foreground "#655370" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight medium :height 120 :width normal :foundry "nil" :family "Source Code Pro"))))
 '(variable-pitch ((t (:family "Georgia")))))

(package-activate-all)

(require 'eglot)
(let ((jdtls-path "~/.emacs.d/jdtls/bin/jdtls")
      (java-debug-jar (car (file-expand-wildcards "~/.emacs.d/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"))))
  (add-to-list 'eglot-server-programs
               `((java-mode java-ts-mode)
                 . (,jdtls-path
                    :initializationOptions
                    (:bundles [,java-debug-jar])))))

(require 'auth-source-1password)
(auth-source-1password-enable)

(require 'gptel)
(gptel-make-openai "grok"
  :host "api.x.ai"
  :key #'gptel-api-key-from-auth-source
  :endpoint "/v1/chat/completions"
  :stream t
  :models '(grok-2-1212))

(global-tree-sitter-mode)
