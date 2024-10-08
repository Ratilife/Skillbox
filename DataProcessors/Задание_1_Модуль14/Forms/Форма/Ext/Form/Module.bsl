﻿
&НаСервере
Процедура СоздатьДокументНаСервере()
	// Этап 2. Преобразование основного реквизита формы в прикладной объект
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	// Этап 3. Вызов процедуры модуля объекта
	ОбработкаОбъект.СоздатьДокументРеализацияТоваров(Склад,ВидЦены,СразуПроводитьДокумент);
	// Этап 4. Обратное преобразование прикладного объекта в реквизит формы
	//ЗначениеВРеквизитФормы(ОбработкаОбъект, "Объект");
КонецПроцедуры

&НаКлиенте
Процедура СоздатьДокумент(Команда)
	// Этап 1. Вызов серверной процедуры
	СоздатьДокументНаСервере();
КонецПроцедуры
