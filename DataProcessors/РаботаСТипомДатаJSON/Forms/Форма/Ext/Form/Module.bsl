﻿
&НаСервере
Процедура ВыгрузитьМассивНаСервере()
	ФайлJSON = Новый ЗаписьJSON;
	// В общей форме  не происходит запись константы? 
	//Путь = Константы.ПутьКФайлу.Получить()+"\";
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";
	
	ФайлJSON.ОткрытьФайл(Путь+"TestMassiv.json");
	МассивЧисел = Новый Массив; 
	
	Для Номер = 1 по 10 Цикл
		МассивЧисел.Добавить(Номер);	
	КонецЦикла;	
	
	JSONНастройкиСериализации = Новый НастройкиСериализацииJSON;
	
	ЗаписатьJSON(ФайлJSON,МассивЧисел,JSONНастройкиСериализации);
	Сообщить("Данные вгружены "+Путь+"TestMassiv.json");
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьМассив(Команда)
	ВыгрузитьМассивНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьСтруктуруНаСервере()
	ФайлJSON = Новый ЗаписьJSON;
	//Путь = Константы.ПутьКФайлу.Получить()+"\";
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";

	ФайлJSON.ОткрытьФайл(Путь+"TestStruktura.json");
	// ссылки в JSON не передают,так как программе которой передаются данные о ссылках 1С нечего не знает 
	СтруктыраВыгрузки = Новый Структура();
	СтруктыраВыгрузки.Вставить("Код",Объект.Номенклатура.Код);
	СтруктыраВыгрузки.Вставить("Наименование",Объект.Номенклатура.Наименование);
	СтруктыраВыгрузки.Вставить("ВидНоменклатуры",Объект.Номенклатура.ВидНоменклатуры.ИмяПредопределенныхДанных);
	СтруктыраВыгрузки.Вставить("ТекДата", ТекущаяДата());
	JSONНастройкиСериализации = Новый НастройкиСериализацииJSON;
	JSONНастройкиСериализации.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.УниверсальнаяДата;
	JSONНастройкиСериализации.ФорматСериализацииДаты = ФорматДатыJSON.JavaScript;
	
	
	ЗаписатьJSON(ФайлJSON,СтруктыраВыгрузки,JSONНастройкиСериализации);
	Сообщить("Данные выгружены "+Путь+"TestStruktura.json");

КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьСтруктуру(Команда)
	ВыгрузитьСтруктуруНаСервере();
КонецПроцедуры
