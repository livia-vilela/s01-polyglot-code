(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a | Bioma: ~a | Profundidade: ~am | Perigo: ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Recife raso"
                  :profundidade 15 :perigo :inofensiva)
   (make-criatura :nome "Boomerang" :bioma "Floresta de algas"
                  :profundidade 25 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de kelp"
                  :profundidade 40 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Zona das dunas"
                  :profundidade 150 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Bacia perdida"
                  :profundidade 500 :perigo :leviata)))

(defun main ()
  (format t "--- Catalogo completo ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (format t "--- Criaturas abaixo de 100m ---~%")
  (let ((fundas (abaixo-de 100 *catalogo*)))
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Quantidade: ~a~%" (length fundas))))

(main)
