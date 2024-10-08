﻿
&НаКлиенте
Процедура ВыборФайлаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ДиалогВыбораФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	ДиалогВыбораФайла.Фильтр                      = НСтр("ru='CSV файл (*.csv)|*.csv'");
	ДиалогВыбораФайла.Заголовок                   = НСтр("ru='Выберите CSV файл'");
	ДиалогВыбораФайла.ПредварительныйПросмотр     = Ложь;
	ДиалогВыбораФайла.Расширение                  = "csv";
	ДиалогВыбораФайла.ИндексФильтра               = 0;
	ДиалогВыбораФайла.ПолноеИмяФайла              = ПутьКФайлу;
	ДиалогВыбораФайла.ПроверятьСуществованиеФайла = Ложь;
	Если ДиалогВыбораФайла.Выбрать() Тогда
		ПутьКФайлу = ДиалогВыбораФайла.ПолноеИмяФайла;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура Загрузить(Команда)
	ЗагрузитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьНаСервере()
	Док = Новый ТекстовыйДокумент();
	Док.Прочитать(ПутьКФайлу,КодировкаТекста.UTF8);
	Для А=1 По Док.КоличествоСтрок() Цикл	
		Строка = Док.ПолучитьСтроку(А);
		Массив = СтрРазделить(Строка, ";");
		ВидНоменклатуры = Массив[1];
		Наименование = Массив[0];
		НоваяНоменклатура = Справочники.Номенклатура.СоздатьЭлемент();
		НоваяНоменклатура.Наименование = Наименование;
		Если Массив.Количество()> 2 Тогда 
			Группа = Массив[2];
			ПоискГруппа =  Справочники.Номенклатура.НайтиПоНаименованию(Группа);
			Если ПоискГруппа.Пустая() Тогда 
				ГруппаНовый = Справочники.Номенклатура.СоздатьГруппу();
				ГруппаНовый.Наименование = Группа;
				ГруппаНовый.Записать(); 	
				НоваяНоменклатура.Родитель =   ГруппаНовый.Ссылка;
			Иначе
				НоваяНоменклатура.Родитель = ПоискГруппа;
			КонецЕсли;
		КонецЕсли;
		Если ВидНоменклатуры = "Товар" Тогда
			НоваяНоменклатура.ВидНоменклатуры = Справочники.ВибыНоменклатура.Товар;
		Иначе
			НоваяНоменклатура.ВидНоменклатуры = Справочники.ВибыНоменклатура.Услуга;
		КонецЕсли;
		НоваяНоменклатура.Записать(); 
	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьДваНаСервере()
	ЗагрузкиИзВнешнихИсточниковСервер.ЗагрузитьДанныеНаСервере(Справочники.Контрагенты,ПутьКФайлу);
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьДва(Команда)
	ЗагрузитьДваНаСервере();
КонецПроцедуры
