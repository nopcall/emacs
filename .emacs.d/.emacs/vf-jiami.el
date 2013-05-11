;; easypg
(require 'epa-file)
(epa-file-enable)
;; Using symmetric encryption always
;; 默认使用对称加密，避免每次保存时都弹出buffer让选择加密方式
(setq epa-file-encrypt-to nil)
;; 避免每次保存的时候都要输入密码
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; auto-save
(setq epa-file-inhibit-auto-save nil)

