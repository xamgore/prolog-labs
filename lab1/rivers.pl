% Задание 2.

%река(название, длина, сток, площадь, истоки, впадает).
река(амур,4416,350,1855,'Яблоневый хребет','Татарский пролив').
река(лена,4400,488,2490,'Байкальский хребет','Море Лаптевых').
река(обь,4070,400,2990,'Предгорья Алтая','Карское море').
река(иртыш,4248,323,1643,'Китай','Обь').
река(енисей,3487,600,2580,'Восточный Саян','Карское море').
река(волга,3530,255,1360,'Валдайская возвышенность','Каспийское море').
река(колыма,2129,44,643,'Хребет Черского','Восточносибирское море').
река(урал,2428,54,231,'Южный Урал','Каспийское море').
река(дон,2200,45,504,'Среднерусская возвышенность','Азовское море').
река(кама,1805,130,507,'Верхне-Камская возвышенность','Волга').
река(печора,1809,130,322,'Северный Урал','Баренцево море').
река(ангара,1779,62,1039,'Байкал','Енисей').
река(селенга,1024,14,447,'Монголия','Байкал').
река(кубань,870,11,58,'Кавказ','Азовское море').

% 1. Определить реки, впадающие в Азовское море.
% Ответ: дон кубань
forall( река(Имя, _, _, _, _, 'Азовское море'), format('~q ', [Имя]) ).

% 2. Определить реки, исток которых находится на Валдайской возвышенности?
% Ответ: волга
forall( река(Имя, _, _, _, 'Валдайская возвышенность', _), format('~q ', [Имя]) ).

% 3. Какие реки короче Камы?
% Ответ: ангара 1779, селенга 1024, кубань 870
forall((река('кама', Длина_Камы, _, _, _, _),
        река(Имя,    Длина,      _, _, _, _),
                     Длина < Длина_Камы),
        format('~q ~q\n', [Имя, Длина]) ).

% 4. Какие реки длиннее Иртыша?
% Ответ: амур 4416, лена 4400
forall((река('иртыш', Длина_Иртыша, _, _, _, _),
        река(Имя,     Длина,        _, _, _, _),
                      Длина > Длина_Иртыша),
        format('~q ~q\n', [Имя, Длина]) ).

% 5. Как задать вопрос, определяющий все данные о реке Кама?
река('кама', Длина, Сток, Площадь, Истоки, Впадает).
