;;不显示工具栏
(tool-bar-mode 0)

;;不现实菜单栏
(menu-bar-mode 0)

;;不显示滚动条
(scroll-bar-mode 0)

;;显示行号与列号
(global-linum-mode 1)
(column-number-mode 1)

;;关闭启动动画
(setq inhibit-startup-message 1)

;;设置初始工作目录
(setq default-directory "~/Code")

;;设置问答提示为 y-or-n,而不是yes-or-no
(fset 'yes-or-no-p 'y-or-n-p)

;;不生成备份文件
(setq make-backup-files nil)

;;添加扩展安装源
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (s highlight-parentheses spacemacs-theme spacegray-theme solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun insert-current-time () 
    "Insert the current time" 
    (interactive "*") 
    (insert (current-time-string)))
(global-set-key "\C-xt" 'insert-current-time)

;;设置主题
(load-theme 'moe-dark t)

;; 启用时间显示设置，在minibuffer上面的那个杠上 
(display-time-mode t) 

;; 24小时制
(setq display-time-24hr-format t)


;; f11全屏显示
(global-set-key [f11] 'my-fullscreen) 
(defun my-fullscreen () 
(interactive) 
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_FULLSCREEN" 0)) 
)

;; f12最大化
(global-set-key [f12] 'my-maximized) 
(defun my-maximized () 
(interactive) 
(x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)) (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)


;; ==========================================================================
;; 加载自己装的插件们
(add-to-list 'load-path "~/.emacs.d/plugins")

;; --------------------------------------------------------------------------
;;Auto complete
;;
;;==配置auto-complete。内容较多单独放一个目录。==============
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
;;cl-lib.el在v24中才出现，v23是没有的，要单独下载。
(require 'auto-complete)
(require 'auto-complete-config)


;; 开启全局设定(包含哪些模式在ac-modes里查看)
;;(global-auto-complete-mode t)
;;添加web-mode模式，在该模式下会自动开启自动完成
;;http://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup
(add-to-list 'ac-modes 'web-mode)

;;使用自带字典
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/dict")
(ac-config-default)


;; --------------------------------------------------------------------------
;; yasnippet
;;
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; --------------------------------------------------------------------------
;; auto-complete-clang
;;
(require 'auto-complete-clang)


;; --------------------------------------------------------------------------
;; 配置补全
;;
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1/x86_64-pc-linux-gnu
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1/backward
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/include
 /usr/local/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/8.2.1/include-fixed
 /usr/include
"
)))  
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
(add-hook 'css-mode-hook 'ac-css-mode-setup)  
(add-hook 'auto-complete-mode-hook 'ac-common-setup)  
(global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  
(ac-config-default)



;; --------------------------------------------------------------------------
;;括号匹配高亮
;;
(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;;             C  mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ ")")
    (?\[ ?  _ "]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)
