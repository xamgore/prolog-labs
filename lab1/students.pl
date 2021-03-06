% Задание 8.

%student(name, algebra, geometry, history).
студент('Бобров',  5, 3, 2).
студент('Вяткин',  5, 5, 5).
студент('Кротов',  2, 3, 3).
студент('Соснин',  4, 4, 4).
студент('Вавилов', 4, 2, 1).


отличник(Имя)  :- студент(Имя, 5, 5, 5).
двоечник(Имя)  :- студент(Имя, А, Г, Х), (А = 2; Г = 2; Х = 2).
математик(Имя) :- студент(Имя, А, Г, _), (А = 4; А = 5), (Г = 4; Г = 5).

алгебра(Имя, Оценка)   :- студент(Имя, Оценка, _, _).
геометрия(Имя, Оценка) :- студент(Имя, _, Оценка, _).
история(Имя, Оценка)   :- студент(Имя, _, _, Оценка).


% 1. Является ли Вяткин отличником?
отличник('Вяткин').
%> true.

% 2. Определить всех отличников.
отличник(Имя), format('~s ', [Имя]), fail.
%> Вяткин

% 3. Является ли Соснин математиком?
математик('Соснин').
%> true.

% 4. Определить всех неуспевающих по истории.
forall( (история(Имя, Оценка), Оценка =< 2),
        format('~s ', [Имя, Оценка]) ).
%> Бобров Вавилов
