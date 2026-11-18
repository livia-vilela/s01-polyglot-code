(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d)
     (bonus-elemental (dominio-elemento d))))


(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not
                     (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos (mapcar
                  (lambda (d)
                    (format nil "~a - ~,1f mora"
                            (dominio-nome d)
                            (recompensa-final d)))
                  possiveis)))
    textos))

(defun main ()
  (let ((dominios (list
                   (make-dominio :nome "Forja Flamejante" :elemento :pyro
                                 :dificuldade 2 :mora 1000)
                   (make-dominio :nome "Lago Cristalino" :elemento :hydro
                                 :dificuldade 3 :mora 1500)
                   (make-dominio :nome "Pico Gelado" :elemento :cryo
                                 :dificuldade 4 :mora 2000)
                   (make-dominio :nome "Torre do Trovao" :elemento :electro
                                 :dificuldade 5 :mora 3000)
                   (make-dominio :nome "Vale dos Ventos" :elemento :anemo
                                 :dificuldade 1 :mora 800))))

    (format t "--- Rota para dificuldade maxima 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "--- Total de mora da lista inteira ---~%")
    (format t "Total: ~,1f mora~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (first dominios))))
      (setf (dominio-mora copia) 5000)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (first dominios))))))

(main)