(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-1password-vault "Personal")
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(compilation-scroll-output 'first-error)
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("77f281064ea1c8b14938866e21c4e51e4168e05db98863bd7430f1352cab294a" "9af2b1c0728d278281d87dc91ead7f5d9f2287b1ed66ec8941e97ab7a6ab73c0" "a1abf0a3e85adcf8da321d3c7f98f85a120cd50ff5dcfe812a647662f04ad0b2" "a7efec9d0154871a84e1adeabe16ef00ea022fd7f5ac61a1fbc2ff179e88ac75" "6d4363fcb9d3767dc4cd56fcc4845c9a1bda39efacfdb05ba3ee7b1df5b99d3e" "099541a1d6b5225d5dac71f2451198604284785adc618637a6d8ebd130a3e2d8" "23e53a71827abd4c6fd60ae230f22a8799839de56e6780b0a2e5a27e76130c0c" "01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6" "9b4d0c9f8e8afe73ceb1f1efda39c2fb9914b7f6b8274f34c46aecdac22ced17" "14fde0324d34ca153b45c6f862cd65e4b58190385c44a6ae98ead6b107be29fd" "6a27405fa8bd76f6383be80a76fbc1c0f2194b915c407e92f4eb1619ce0085e1" "a9c8566eabd5d5b84d9ca13cd49bfb53d6dc5a18e8642dfe2a0f54e5e6a62511" "c9bc12faeadf400bd85c286069dff1d3bb3b537be00fff8b5873fb8dbaf4c3eb" "4ab2a0a1b8884a257b0840035cd3ec9cb8efd4fece856131bc62aa1924e96327" "853a614b56bd778cd5a94e7add9d4ceef06203923b4e1192186eb69a6829bc6a" "0f691b0fef27fdeffb52131f21914b6819044659c785109060dbfb72d6b38246" "53a4efdca4c9fb870c3f92e4cfca0fbb638bb29b168a26a363298f9b1d9b9bcf" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "bbb13492a15c3258f29c21d251da1e62f1abb8bbd492386a673dcfab474186af" "98b4ef49c451350c28a8c20c35c4d2def5d0b8e5abbc962da498c423598a1cdd" "6ac2faf17d4d37b6f4bc08203b70e82f4b3b5ce76f102fb4802b3f6c74460743" "1d1f4f5b0f792f0bb1b8f944b8ed93b3b20bbebc4ba072c2b7daff82da23ae86" "039112154ee5166278a7b65790c665fe17fd21c84356b7ad4b90c29ffe0ad606" "f700bc979515153bef7a52ca46a62c0aa519950cc06d539df4f3d38828944a2c" default))
 '(display-line-numbers t)
 '(epg-pinentry-mode 'loopback)
 '(global-undo-tree-mode t)
 '(gptel-directives
   '((default . "You are a large language model living in Emacs and a helpful assistant. Respond concisely.")
     (programming . "You are a large language model and a careful programmer. Provide code and only code as output without any additional text, prompt or note.")
     (writing . "You are a large language model and a writing assistant. Respond concisely.")
     (chat . "You are a large language model and a conversation partner. Respond concisely.")
     (aiprogrammer . "You are a careful programmer living inside emacs. The user is providing you code with tasks left to do marked in comments with AI:  Find and complete the tasks.  First ouline your thinking and for each task explain what you want to do, and then for provide the code changes your are looking for as patch.  A tool will come later and apply your patch.  Be sure to clean up any ai comments that your have completed.  If you require any clarifying questions or information from the user, just ask and they will reply.")))
 '(ido-everywhere t)
 '(ido-mode 'both nil (ido))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
 '(package-selected-packages
   '(modus-themes git-link ellama aider rg verb restclient typescript-mode go-mode neotree kotlin-mode tree-sitter-langs swift-mode gptel auth-source-1password spacemacs-theme olivetti nord-theme undo-tree visual-fill visual-fill-column base16-theme magit eglot-java eglot dape helm-project helm-lsp helm lsp-java dap-mode llm projectile project))
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
;;(setq gptel-model 'grok-3-latest
;;      gptel-backend (gptel-make-xai "xAI" :key #'gptel-api-key-from-auth-source))

(gptel-make-gemini "gemini" :key #'gptel-api-key-from-auth-source)
(gptel-make-xai "grok" :key #'gptel-api-key-from-auth-source
                :models '((grok-4-latest
                           :description "Grok 4"
                           :capabilities '(tool-use json reasoning)
                           :context-window 256000
                           :input-cost 3
                           :output-cost 15)
                          (grok-3-latest
                           :description "Grok 3"
                           :capabilities '(tool-use json)
                           :context-window 131072
                           :input-cost 3
                           :output-cost 15)

                          (grok-3-fast-latest
                           :description "Faster Grok 3"
                           :capabilities '(tool-use json)
                           :context-window 131072
                           :input-cost 5
                           :output-cost 25)

                          (grok-3-mini-latest
                           :description "Mini Grok 3"
                           :capabilities '(tool-use json reasoning)
                           :context-window 131072
                           :input-cost 0.3
                           :output-cost 0.5)))

(global-set-key (kbd "C-c C-l") 'gptel-menu)


(global-auto-revert-mode t)
(global-tree-sitter-mode t)

(setq compilation-error-regexp-alist
      (append compilation-error-regexp-alist
              '(("ERROR: \\([^:]+\\):\\([0-9]+\\)" 1 2))))

(gptel-make-tool
 :name "read_buffer"                    ; javascript-style snake_case name
 :function (lambda (buffer)                  ; the function that will run
             (unless (buffer-live-p (get-buffer buffer))
               (error "error: buffer %s is not live." buffer))
             (with-current-buffer  buffer
               (buffer-substring-no-properties (point-min) (point-max))))
 :description "return the contents of an emacs buffer"
 :args (list '(:name "buffer"
               :type string            ; :type value must be a symbol
               :description "the name of the buffer whose contents are to be retrieved"))
 :category "emacs")                     ; An arbitrary label for grouping


;; Tool to list the file tree of a directory
(gptel-make-tool
 :name "list_file_tree"
 :function (lambda (directory)
             (message "list_file_tree %s" directory)
             (unless (file-directory-p directory)
               (error "error: directory %s does not exist." directory))
             (let ((default-directory directory))
               (with-temp-buffer
                 (if (zerop (call-process "git" nil t nil "ls-tree" "-r" "--name-only" "HEAD"))
                     (let ((files (split-string (buffer-string) "\n" t)))
                       (mapcar (lambda (file) (expand-file-name file directory))
                               (cl-remove-if-not (lambda (f) (string-suffix-p ".go" f)) files)))
                   (error "error: failed to run git ls-tree or not in a git repository")))))
 :description "return a list of all files in a specified repository/project using git ls-tree"
 :args (list '(:name "directory"
               :type string
               :description "the directory path to list the file tree from"))
 :category "codebase")

;; Tool to read the contents of a specific file
(gptel-make-tool
 :name "read_file"
 :function (lambda (filepath)
             (unless (file-exists-p filepath)
               (error "error: file %s does not exist." filepath))
             (with-temp-buffer
               (insert-file-contents filepath)
               (buffer-substring-no-properties (point-min) (point-max))))
 :description "return the contents of a specific file"
 :args (list '(:name "filepath"
               :type string
               :description "the full path to the file to read"))
 :category "codebase")

;; Tool to search the codebase using ripgrep (rg)
(gptel-make-tool
 :name "search_codebase"
 :function (lambda (query directory)
             (message "search_codebase %s %s" query directory)
             (unless (file-directory-p directory)
               (error "error: directory %s does not exist." directory))
             (unless (executable-find "rg")
               (error "error: ripgrep (rg) is not installed."))
             (let ((default-directory directory))
               (shell-command-to-string
                (format "rg -n -C10 %s"
                        (shell-quote-argument query)))))
 :description "search the codebase for a query string using ripgrep, includes 10 lines of context around the match. output includes line numbers"
 :args (list '(:name "query"
               :type string
               :description "the search term to look for in the codebase")
             '(:name "directory"
               :type string
               :description "the directory to search in"))
 :category "codebase")

(defun gptel-add-marked-files ()
  "Add marked files in Dired to gptel context."
  (interactive)
  (let ((files (dired-get-marked-files)))
    (dolist (file files)
      (gptel-add-file file))
    (message "Added %d file(s) to gptel context" (length files))))

(require 'cl-lib)

(defun ai-context-get-file-paths ()
  "Return the list of valid file paths from 'ai.context' in the project root.
If the file does not exist, prompt to create an empty one.
If declined, return the symbol `no-context-file'.
Otherwise, return the list (which may be empty)."
  (cl-block nil
    (let ((proj (project-current)))
      (unless proj
        (user-error "No project found. Please open a project first."))
      (let* ((proj-root (project-root proj))
             (ai-context-file (expand-file-name "ai.context" proj-root)))
        (unless (file-exists-p ai-context-file)
          (message "File '%s' not found in project root '%s'."
                   (file-name-nondirectory ai-context-file) proj-root)
          (ding) ; Make a sound to indicate a non-critical issue
          (when (yes-or-no-p
                 (format "Would you like to create an empty '%s' file in '%s'? "
                         (file-name-nondirectory ai-context-file) proj-root))
            (with-temp-buffer
              (write-file ai-context-file nil t)) ; write-file creates the file
            (message "'%s' created." (file-name-nondirectory ai-context-file)))
          (unless (file-exists-p ai-context-file)
            (cl-return 'no-context-file)))
        ;; File now exists (either originally or created)
        (message "Reading files from '%s'..." (file-name-nondirectory ai-context-file))
        (let ((paths nil))
          (with-temp-buffer
            (insert-file-contents ai-context-file)
            ;; split-string with `t` removes empty strings (e.g., from blank lines)
            (cl-loop for line in (split-string (buffer-string) "\n" t)
                     do
                     ;; Resolve file path relative to project root
                     (let ((file-path (expand-file-name line proj-root)))
                       (if (file-exists-p file-path)
                           (push file-path paths)
                         (message "Skipping non-existent file listed in ai.context: %s" file-path)))))
          (nreverse paths))))))

(defun ai-add-context-files ()
  "Add files listed in 'ai.context' in the project root to gptel-context."
  (interactive)
  (let ((files (ai-context-get-file-paths)))
    (unless (eq files 'no-context-file)
      (let ((added-count 0))
        (dolist (file files)
          (gptel-context-add-file file)
          (setq added-count (1+ added-count)))
        (message "Added %d files from '%s' to gptel-context."
                 added-count "ai.context")))))

(defun ai-copy-context-contents ()
  "Copy the contents of files listed in 'ai.context' (prefixed with pathnames) to the kill-ring."
  (interactive)
  (let ((files (ai-context-get-file-paths)))
    (unless (eq files 'no-context-file)
      (if (null files)
          (message "No files listed in 'ai.context' to copy.")
        (let ((content ""))
          (dolist (file files)
            (with-temp-buffer
              (insert-file-contents file)
              (setq content (concat content "\n\nFile: " file "\n" (buffer-string)))))
          (kill-new content)
          (message "Copied contents of %d files from 'ai.context' to kill-ring." (length files)))))))
