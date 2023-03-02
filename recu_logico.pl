% programa(nombre, rating)

programa(intrusos, 10).
programa(infama, 11).
programa(animalesSueltos, 8).
programa(elMonologo, 5).

% conduce(programa, conductor)

conduce(intrusos, rial).
conduce(intrusos, ventura).
conduce(infama, delMoro).
conduce(animalesSueltos, fantino).
conduce(animalesSueltos, neumann).
conduce(animalesSueltos, cocoSily).
conduce(elMonologo, cocoSily).


% primicia(protagonista, interes, programa)

primicia(rial, 20, intrusos).
primicia(fantino, 40, intrusos).
primicia(floppyTesouro, 100, animalesSueltos).
primicia(zairaNara, 20, animalesSueltos).


% ranking(primicia)

ranking(Primicia,Rank):-
    programa(Programa,Rating),
    primicia(Primicia,Interes,Programa),
    Rank is Rating + (Interes / 2).


% noTienePrimicia(programa)

noTienePrimicia(Programa):-
    programa(Programa,_),
    not(primicia(_,_,Programa)).


% conduceMasDeUnPorgrama(conductor)

conduceMasDeUnPrograma(Conductor):-
    conduce(Programa,Conductor),
    conduce(Programa2,Conductor),
    Programa \= Programa2.


% todasSusPrimiciasAjenas(programa)

primiciasAjenas(Programa):-
    programa(Programa,_),
    primicia(_,_,Programa),
    forall((primicia(Primicia,_,Programa),(conduce(Programa,Conductor))),Primicia \= Conductor).

