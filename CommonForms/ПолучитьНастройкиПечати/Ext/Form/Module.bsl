﻿
&НаКлиенте
Процедура ПередатьПараметры(Команда)
	СтруктураПараметров = Новый Структура;
	СтруктураПараметров.Вставить("КоличествоЭкземпляровПечати",?(КоличествоЭкземпляровПечати=0,1,КоличествоЭкземпляровПечати));
	СтруктураПараметров.Вставить("ПечатьБезПросмотра",ПечатьБезПросмотра);
	СтруктураПараметров.Вставить("ПримечаниеДляПечати",ПримечаниеДляПечати);
	СтруктураПараметров.Вставить("СлужебнаяПечать",СлужебнаяПечать);
	СтруктураПараметров.Вставить("ПечататьЦену",ПечататьЦену);
	
	Закрыть(СтруктураПараметров);
КонецПроцедуры
