% Eva Aibar Álvarez

% Tarea: Encontrar un número aleatorio entre 1 y 7 utilizando únicamente
% una función que genera números aleatorios entre 1 y 5.

% Antes de continuar, expongo algunas de las consideraciones que he tenido
% en cuenta a la hora de resolver la tarea:
%   1. Todas las distribuciones son uniformes, es decir:
%       a) Cada número debe generarse con equiprobabilidad.
%       b) Dentro del rango los números son enteros, lo que nos impide utilizar una
%          transformación lineal.
%   2. Se puede realizar más de una tirada. En este código lo implementaré
%   con un bucle.

% SOLUCIÓN:

% En principio utilizamos dos tiradas para generar 25 combinaciones.
% Si las combinaciones no pueden repartirse equitativamente entre
% los 7 resultados, utilizaremos nuevas tiradas.
% Dividimos los primeros 21 elementos en 7 grupos de 3. Si los dados sacan
% las combinaciones 52, 53, 54 y 55, como quedan fuera de los grupos no
% serán equiprobables y habrá que hacer otra tirada. La tirada se hace
% automáticamente gracias al bucle.

% Para que sea más visual, represento cada combinación posible en una
% matriz:

dobleTirada = [11 12 13 14 15;
               21 22 23 24 25;
               31 32 33 34 35;
               41 42 43 44 45;
               51 52 53 54 55];

% Bucle que repite tiradas hasta caer en el rango válido:

while true
    tirada1 = randi(5);
    tirada2 = randi(5);
    resultado = dobleTirada(tirada1, tirada2);

    if resultado <= 51

        % La siguiente tarea es pasar el número de celda a un número entre
        % el 1 y el 7.
        % Primero se calcula la posición de la combinación en la matriz. El
        % resultado será un número del 1 al 21.
        posicion = (tirada1 - 1) * 5 + tirada2;

        % Como la matriz la repartimos en 7 grupos de tres, simplemente redondeamos
        % hacia arriba dividiendo entre tres.
        numero_final = ceil(posicion / 3);

    break;
    end
end

fprintf('La celda seleccionada es la número %d y corresponde al número %d\n', posicion, numero_final);