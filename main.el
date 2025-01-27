(defvar my/day-theme 'leuven
  "Day theme.")

(defvar my/night-theme 'wombat
  "Night theme.")

(defun my/set-theme-based-on-time ()
  "Sets the theme based on the time of day."
  (let* ((current-hour (string-to-number (format-time-string "%H")))
         (is-daytime (and (>= current-hour 6) (< current-hour 18))))
    (if is-daytime
        (load-theme my/day-theme t)
      (load-theme my/night-theme t))))

(defun my/enable-time-based-theme-switching ()
  "Enables automatic theme switching based on time of day."
  (my/set-theme-based-on-time)
  (run-at-time "00:01" 3600 'my/set-theme-based-on-time))

(add-hook 'emacs-startup-hook 'my/enable-time-based-theme-switching)

