;; easypg
(require 'epa-file)
(epa-file-enable)
;; Using symmetric encryption always
;; Ĭ��ʹ�öԳƼ��ܣ�����ÿ�α���ʱ������buffer��ѡ����ܷ�ʽ
(setq epa-file-encrypt-to nil)
;; ����ÿ�α����ʱ��Ҫ��������
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
;; auto-save
(setq epa-file-inhibit-auto-save nil)

