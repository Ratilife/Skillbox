﻿
&НаСервере
Процедура ВыполнитьНаСервере()
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
    ОбработкаОбъект.ЗаполнитьГрафик(ВыборПериода.ДатаНачала, ВыборПериода.ДатаОкончания, ВыходныеДни);
КонецПроцедуры

&НаКлиенте
Процедура Заполнить(Команда)
	ВыполнитьНаСервере();
	Сообщить("Обработка завершена!");
КонецПроцедуры
