;;; init-calendar.el --- calendar  -*- coding: utf-8-unix -*-

;;; Commentary:

;;; Code:
;; (use-package calfw
;;   :ensure t
;;   :config
;;   (use-package calfw-org
;;     :ensure t)
;;   )


;; ** emacs-calfw
(use-package holidays
  :ensure nil
  :defer t
  :config
  (defvar eh-calendar-holidays nil)
  (setq eh-calendar-holidays
        '(;;公历节日
          (holiday-fixed 1 1 "元旦")
          (holiday-fixed 2 14 "情人节")
          (holiday-fixed 3 8 "妇女节")
          (holiday-fixed 3 14 "白色情人节")
          (holiday-fixed 4 1 "愚人节")
          (holiday-fixed 5 1 "劳动节")
          (holiday-fixed 5 4 "青年节")
          (holiday-float 5 0 2 "母亲节")
          (holiday-fixed 6 1 "儿童节")
          (holiday-float 6 0 3 "父亲节")
          (holiday-fixed 9 10 "教师节")
          (holiday-fixed 10 1 "国庆节")
          (holiday-fixed 12 25 "圣诞节")
          ;; 农历节日
          (holiday-lunar 1 1 "春节" 0)
          (holiday-lunar 1 2 "春节" 0)
          (holiday-lunar 1 3 "春节" 0)
          (holiday-lunar 1 15 "元宵节" 0)
          (holiday-solar-term "清明" "清明节")
          (holiday-solar-term "小寒" "小寒")
          (holiday-solar-term "大寒" "大寒")
          (holiday-solar-term "立春" "立春")
          (holiday-solar-term "雨水" "雨水")
          (holiday-solar-term "惊蛰" "惊蛰")
          (holiday-solar-term "春分" "春分")
          (holiday-solar-term "谷雨" "谷雨")
          (holiday-solar-term "立夏" "立夏")
          (holiday-solar-term "小满" "小满")
          (holiday-solar-term "芒种" "芒种")
          (holiday-solar-term "夏至" "夏至")
          (holiday-solar-term "小暑" "小暑")
          (holiday-solar-term "大暑" "大暑")
          (holiday-solar-term "立秋" "立秋")
          (holiday-solar-term "处暑" "处暑")
          (holiday-solar-term "白露" "白露")
          (holiday-solar-term "秋分" "秋分")
          (holiday-solar-term "寒露" "寒露")
          (holiday-solar-term "霜降" "霜降")
          (holiday-solar-term "立冬" "立冬")
          (holiday-solar-term "小雪" "小雪")
          (holiday-solar-term "大雪" "大雪")
          (holiday-solar-term "冬至" "冬至")
          (holiday-lunar 5 5 "端午节" 0)
          (holiday-lunar 8 15 "中秋节" 0)
          (holiday-lunar 7 7 "七夕情人节" 0)
          (holiday-lunar 12 8 "腊八节" 0)
          (holiday-lunar 9 9 "重阳节" 0)
          (holiday-lunar 12 22 "冬至" 0)))
  (setq calendar-holidays eh-calendar-holidays))

(use-package calendar
  :ensure t
  :defer t
  :config
  (setq calendar-month-name-array
        ["一月" "二月" "三月" "四月" "五月" "六月"
         "七月" "八月" "九月" "十月" "十一月" "十二月"])
  (setq calendar-day-name-array
        ["星期日" "星期一" "星期二" "星期三" "星期四" "星期五" "星期六"])

  ;; 一周第一天，0表示星期天, 1表示星期一
  (setq calendar-week-start-day 0))

(use-package calfw
  :ensure t
  :defer t
  :init
  (autoload 'cfw:open-org-calendar "calfw" nil t)
  :config
  (use-package cal-china-x
    :ensure t
    :defer t)

  (defvar eh-calfw-org-file nil)
  (setq eh-calfw-org-file "~/nutdata/myorg/general/calfw.org")

  ;; 日历表格边框设置
  (setq cfw:fchar-junction ?+
        cfw:fchar-vertical-line ?|
        cfw:fchar-horizontal-line ?-
        cfw:fchar-left-junction ?+
        cfw:fchar-right-junction ?+
        cfw:fchar-top-junction ?+
        cfw:fchar-top-left-corner ?+
        cfw:fchar-top-right-corner ?+)

  (setq cfw:gettext-alist
        '(("Today" . "t:今天")
          ("Month" . "M:一月")
          ("Week" . "W:一周")
          ("Two Weeks" . "T:两周")
          ("Day" . "D:一天")))

  (use-package calfw-org
    :ensure t
    :config
    (defun eh-calendar ()
      (interactive)
      (cfw:open-calendar-buffer
       :view 'two-weeks
       :contents-sources
       (list
        ;; orgmode source
        (cfw:org-create-source "Green")))))

  (use-package org-agenda
    :ensure nil
    ;; :init
    ;; (add-hook 'org-mode-hook #'org-agenda-mode)
    :config
    (unless (member eh-calfw-org-file org-agenda-files)
      (push eh-calfw-org-file org-agenda-files))
    (use-package org-capture
      :ensure nil
      :config
      ;; 为calfw设置一个capture模板并添加到org-capture-templates
      (setq cfw:org-capture-template
            '("c" "calfw2org" entry (file+headline "~/nutdata/myorg/general/calfw.org" "Schedule")
              "* %?\n %(cfw:org-capture-day)\n %a"))
      (setq org-capture-templates
            (append org-capture-templates (list cfw:org-capture-template)))))


  )




(provide 'init-calendar)
;;; init-calendar.el ends here
