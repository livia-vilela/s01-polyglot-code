(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      (format nil "ATENCAO: Maomao vai testar ~a em si mesma antes!"
              (erva-nome erva))
      (format nil "~a esta liberada para o paciente."
              (erva-nome erva))))

(defun main ()
  (let ((ervas (list
                (make-erva :nome "Erva-Doce" :preco-por-grama 12.5 :toxicidade 9)
                (make-erva :nome "MariaJuana" :preco-por-grama 8.75 :toxicidade 5)
                (make-erva :nome "Camomila" :preco-por-grama 1.2 :toxicidade 1))))
    (format t "--- Estoque da Maomao ---~%")
    (dolist (e ervas)
      (format t "~a~%" (descreve-erva e))
      (format t "~a~%" (aviso e)))
    (format t "--- Preco de uma dose ---~%")
    (format t "Dose de 15g de ~a: R$~,2f~%"
            (erva-nome (second ervas))
            (preco-da-dose (second ervas) 15))))

(main)