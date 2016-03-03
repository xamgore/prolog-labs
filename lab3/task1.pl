% группа(курс, группа, подгруппа, список_студентов)
группа(3, 9, 1, [иванов, петрова, стулов, котова, леонтьева,
		 яценко, приходько, стриж, платонова, сурков]).
группа(3, 9, 2, [васин, гончарова, григоренко, есипова, кривенко,
		 белоусов, пак, стебежев, проскурякова, турин]).
группа(3, 8, 1, [черный, житова, смирнова, сидоров, лавренько,
		 минаев, листова, папина, ярко, шубин]).
группа(3, 8, 2, [кросс, гвоздев, дурманенко, ежова, соленая,
		 нетребко, салов, ухов, пронин, целин]).

% Вычисление длины списка
длина([], 0). % длина пустого списка
длина([_ | Список], Длина) :- % длина списка = длина хвоста + 1
	длина(Список, Длина1),
	Длина is Длина1 + 1.

% Элемент входит в список, если
входит(X, [X | _ ]). % он является его головой,
входит(X, [ _ | Список]) :-
	входит(X, Список). % либо входит в хвост списка

% Объединение списков
% объединить(список1, список2, результат)
объединить([], L, L).
объединить([X | L1], L2, [X | L]) :-
	объединить(L1, L2, L).


% Задания

% 5. Написать предикат, формирующий список всех студентов заданной группы.
студенты_группы(Grade, Group, List) :-
    группа(Grade, Group, 1, Left),
    группа(Grade, Group, 2, Right),
    объединить(Left, Right, List).

% 1. Вывести список студентов своей подгруппы.
группа(3, 9, 2, List).

% 2. Вывести список студентов другой подгруппы.
X =\= 2, группа(3, 9, X, List).

% 3. Определить общее число студентов в заданной группе.
студенты_группы(3, 9, List), длина(List, Count).

% 4. Определить номер подгруппы, в которой учится указанный студент.
группа(_, _, Subgroup, List), входит(стебежев, List).

% 6. Написать предикат "возраст" для каждого студента.
возраст(15, [иванов, петрова, стулов, котова, леонтьева,
		 васин, гончарова, григоренко, есипова, кривенко]).
возраст(16, [белоусов, пак, стебежев, проскурякова, турин,
		 черный, житова, смирнова, сидоров, лавренько]).
возраст(17, [иванов, петрова, стулов, котова, леонтьева,
		 нетребко, салов, ухов, пронин, целин]).
возраст(18, [кросс, гвоздев, дурманенко, ежова, соленая,
		 яценко, приходько, стриж, платонова, сурков]).

% Пересечение множеств
inter([], _, []).
inter([H1|T1], L2, [H1|Res]) :- входит(H1, L2), inter(T1, L2, Res).
inter([_|T1],  L2, Res)      :- inter(T1, L2, Res).

% 7. Написать предикат, выводящий всех студентов заданной группы по заданному возрасту.
студенты_группы(Grade, Group, Age, List) :-
    студенты_группы(Grade, Group, Students),
    возраст(Age, People),
    inter(Students, People, List).