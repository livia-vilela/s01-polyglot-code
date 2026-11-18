(defstruct garota-magica
  nome
  escuridao 
  bruxas)   

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((mami (make-garota-magica :nome "Mami" :escuridao 30 :bruxas 12))
         (homura (make-garota-magica :nome "Homura" :escuridao 45 :bruxas 8))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 60 :bruxas 3))
         (grupo (list mami homura sayaka))
         (madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 0))
         (grupo-novo (cons madoka grupo))
         (sayaka-limpa (purifica sayaka 25)))

    (format t "--- Grupo original ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Uma nova garota faz o contrato ---~%")
    (format t "Escuridao do grupo original: ~a~%" (escuridao-total grupo))
    (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))

    (format t "--- Purificando a Sayaka ---~%")
    (format t "Escuridao da original: ~a~%" (garota-magica-escuridao sayaka))
    (format t "Escuridao da nova: ~a~%" (garota-magica-escuridao sayaka-limpa))))

(main)