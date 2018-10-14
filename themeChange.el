(defun insert-current-time () 
    "Insert the current time" 
    (interactive "*") 
    (insert (current-time-string)))

(global-set-key "\C-xt" 'insert-current-time)
