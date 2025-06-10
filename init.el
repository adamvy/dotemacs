(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-1password-vault "Personal")
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(compilation-scroll-output 'first-error)
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6" "9b4d0c9f8e8afe73ceb1f1efda39c2fb9914b7f6b8274f34c46aecdac22ced17" "14fde0324d34ca153b45c6f862cd65e4b58190385c44a6ae98ead6b107be29fd" "6a27405fa8bd76f6383be80a76fbc1c0f2194b915c407e92f4eb1619ce0085e1" "a9c8566eabd5d5b84d9ca13cd49bfb53d6dc5a18e8642dfe2a0f54e5e6a62511" "c9bc12faeadf400bd85c286069dff1d3bb3b537be00fff8b5873fb8dbaf4c3eb" "4ab2a0a1b8884a257b0840035cd3ec9cb8efd4fece856131bc62aa1924e96327" "853a614b56bd778cd5a94e7add9d4ceef06203923b4e1192186eb69a6829bc6a" "0f691b0fef27fdeffb52131f21914b6819044659c785109060dbfb72d6b38246" "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "6ac2faf17d4d37b6f4bc08203b70e82f4b3b5ce76f102fb4802b3f6c74460743" "1d1f4f5b0f792f0bb1b8f944b8ed93b3b20bbebc4ba072c2b7daff82da23ae86" "039112154ee5166278a7b65790c665fe17fd21c84356b7ad4b90c29ffe0ad606" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" default))
 '(display-line-numbers t)
 '(epg-pinentry-mode 'loopback)
 '(global-undo-tree-mode t)
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-selected-packages
   '(ellama aider rg verb restclient typescript-mode go-mode neotree kotlin-mode tree-sitter-langs swift-mode gptel auth-source-1password spacemacs-theme olivetti nord-theme undo-tree visual-fill visual-fill-column base16-theme magit eglot-java eglot dape helm-project helm-lsp helm lsp-java dap-mode llm projectile project))
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(xref-search-program 'ripgrep))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro"))))
 '(variable-pitch ((t (:family "Georgia")))))

(package-install-selected-packages)
(package-activate-all)

(require 'auth-source-1password)
(auth-source-1password-enable)

(require 'gptel)
(setq gptel-model 'grok-3-latest
      gptel-backend (gptel-make-xai "xAI" :key #'gptel-api-key-from-auth-source))

(global-set-key (kbd "C-c C-l") 'gptel-menu)


(global-tree-sitter-mode)

(setq compilation-error-regexp-alist
      (append compilation-error-regexp-alist
              '(("ERROR: \\([^:]+\\):\\([0-9]+\\)" 1 2))))

