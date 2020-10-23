# benford-law-haskell
authors: Kauan Takeda, Waki, Camila 
MC346 - Unicamp 2s2020


To use this functions try something like: 
  - countOccurrence "1 0.2 0.03 04 5002 600.1 700.001 0080.0.01 000.00901"
    - result: [("1",1),("2",1),("3",1),("4",1),("5",1),("6",1),("7",1),("8",1),("9",1)]
    - It means that the program found:
        - 1 number that started with "1", 
        - 1 number that started with "2", 
        - 1 number that started with "3", etc....
  - countOccurrence "Minha vo foi na casa 328 apto 44 no andar 4 para comprar 27 paes custando cada 0.39 centavos, no total custou 10.53, pagou com uma nota de 20 reais e recebeu 9.47 de troco."
    - result: [("1",1),("2",2),("3",2),("4",2),("9",1)]
    - It means that the program found:
        - 1 number that started with "1", 
        - 2 number that started with "2", 
        - 2 number that started with "3",
        - 2 number that started with "4",
        - 1 number that started with "9"
