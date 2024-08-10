﻿
&НаКлиенте
Процедура Печать(Команда)
	
	Результат = ПечатьДокумента();
	Результат.ОтображатьСетку = Ложь;
	Результат.ОтображатьЗаголовки = Ложь;
	Результат.Показать();

КонецПроцедуры

&НаСервере
Функция ПечатьДокумента()

	ДокументОбъект = РеквизитФормыВЗначение("Объект");

	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
			|СборкаКомпьютера.Дата,
			|СборкаКомпьютера.Номер,
			|СборкаКомпьютера.Мастер,
			|СборкаКомпьютера.Продукция КАК СистемныйБлок,
			|СборкаКомпьютера.Склад
			|ИЗ
			|Документ.СборкаКомпьютера КАК СборкаКомпьютера
			|ГДЕ
			|СборкаКомпьютера.Ссылка = &Ссылка";

	Запрос.УстановитьПараметр("Ссылка", ДокументОбъект.Ссылка);
	Результат = Запрос.Выполнить();
	ШапкаДок = Результат.Выгрузить();
	
	ВнешниеНаборыДанных = Новый Структура;
	ВнешниеНаборыДанных.Вставить("СоставСБ",ДокументОбъект.ПереченьНоменклатуры);
	ВнешниеНаборыДанных.Вставить("ДокументСБ",ШапкаДок);
	
	СхемаКомпоновкиДанных = ДокументОбъект.ПолучитьМакет("ПечатьСборки");
	Настройки = СхемаКомпоновкиДанных.НастройкиПоУмолчанию;

	КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
	МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, Настройки);
      
	ПроцессорКомпоновкиДанных = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновкиДанных.Инициализировать(МакетКомпоновки, ВнешниеНаборыДанных);
	
	ДокументРезультат = Новый ТабличныйДокумент;
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВТабличныйДокумент;
    ПроцессорВывода.УстановитьДокумент(ДокументРезультат);
	
	ПроцессорВывода.Вывести(ПроцессорКомпоновкиДанных);

	//Получение доп макета для шапки и подвала
	Макет = ДокументОбъект.ПолучитьМакет("Подписи");

	//Вывод своего макета
	Область = Макет.ПолучитьОбласть("Ответственный");
	Область.Параметры.Руководитель = Справочники.Сотрудники.НайтиПоКоду("000000003").Наименование;
	ДокументРезультат.Вывести(Область); 
	
	Возврат ДокументРезультат;
	
КонецФункции	

&НаКлиенте
Процедура АнализЦен(Команда)
	
	Результат = АнализЦенДокумента();
	Результат.ОтображатьСетку = Ложь;
	Результат.ОтображатьЗаголовки = Ложь;
	Результат.Показать();

КонецПроцедуры

&НаСервере
Функция АнализЦенДокумента()

	ДокументОбъект = РеквизитФормыВЗначение("Объект");

	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
			|ПриходнаяНакладнаяТовары.Номенклатура КАК Номенклатура,
			|ПриходнаяНакладнаяТовары.Количество Как Поступило,
			|ПриходнаяНакладнаяТовары.Цена КАК ЦенаПриход
			|ИЗ
			|Документ.ПриходнаяНакладная.ПереченьНоменклатуры КАК ПриходнаяНакладнаяТовары
			|ГДЕ
			|Номенклатура в (&СписокНоменклатуры)";
			
	Запрос.УстановитьПараметр("СписокНоменклатуры",ДокументОбъект.ПереченьНоменклатуры.ВыгрузитьКолонку("Номенклатура"));
	Результат = Запрос.Выполнить();
	Поступление = Результат.Выгрузить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
			|СборкаКомпьютераТовары.Номенклатура КАК Номенклатура,
			|СборкаКомпьютераТовары.Количество КАК Собрано,
			|СборкаКомпьютераТовары.Цена КАК ЦенаСборки
			|ИЗ
			|Документ.СборкаКомпьютера.ПереченьНоменклатуры КАК СборкаКомпьютераТовары
			|ГДЕ
			|Номенклатура в (&СписокНоменклатуры)";
			//|Номенклатура.ВидНоменклатуры = &ВидНоменклатуры";
			
	Запрос.УстановитьПараметр("СписокНоменклатуры",ДокументОбъект.ПереченьНоменклатуры.ВыгрузитьКолонку("Номенклатура"));
	//Запрос.УстановитьПараметр("ВидНоменклатуры",Перечисления.ВидыНоменклатуры.Материалы);
	Результат = Запрос.Выполнить();
	Сборка = Результат.Выгрузить();
	
	ВнешниеНаборыДанных = Новый Структура;
	ВнешниеНаборыДанных.Вставить("ЦеныПоступления",Поступление);
	ВнешниеНаборыДанных.Вставить("ЦеныСборки", Сборка);
		
	//СхемаКомпоновкиДанных = ДокументОбъект.ПолучитьМакет("АнализЦенКомплектующих");
	СхемаКомпоновкиДанных = УстановитьСхему();
	//Настройки = СхемаКомпоновкиДанных.НастройкиПоУмолчанию;
	Настройки = УстановитьНастройки(СхемаКомпоновкиДанных);
	
	КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
	ДанныеРасшифровки = Новый ДанныеРасшифровкиКомпоновкиДанных;
	МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, Настройки, ДанныеРасшифровки);
      
	ПроцессорКомпоновкиДанных = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновкиДанных.Инициализировать(МакетКомпоновки, ВнешниеНаборыДанных, ДанныеРасшифровки);
		
	ДокументРезультат = Новый ТабличныйДокумент;
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВТабличныйДокумент;
    ПроцессорВывода.УстановитьДокумент(ДокументРезультат);
	
	ПроцессорВывода.Вывести(ПроцессорКомпоновкиДанных);
	
    Возврат ДокументРезультат;
	
КонецФункции	

&НаСервере
Функция УстановитьНастройки(СхемаКомпоновкиДанных)
	
	Настройки = СхемаКомпоновкиДанных.НастройкиПоУмолчанию;
	
	ГруппировкаНоменклатура = Настройки.Структура.Добавить(Тип("ГруппировкаКомпоновкиДанных"));
	ГруппировкаНоменклатура.Использование = Истина;
	ПолеНоменклатура = ГруппировкаНоменклатура.ПоляГруппировки.Элементы.Добавить(Тип("ПолеГруппировкиКомпоновкиДанных"));
	ПолеНоменклатура.Использование = Истина;
	ПолеНоменклатура.Поле = Новый ПолеКомпоновкиДанных("Номенклатура");
	ВыбранныеПоляДляНоменклатуры = ГруппировкаНоменклатура.Выбор.Элементы.Добавить(Тип("АвтоВыбранноеПолеКомпоновкиДанных"));
	ВыбранныеПоляДляНоменклатуры.Использование = Истина;

	ГруппаВыбранныхПолей = Настройки.Выбор.Элементы.Добавить(Тип("ГруппаВыбранныхПолейКомпоновкиДанных"));
	ГруппаВыбранныхПолей.Использование = Истина;
	ГруппаВыбранныхПолей.Заголовок = "Поступило";
	Поле1 = ГруппаВыбранныхПолей.Элементы.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
	Поле1.Использование = Истина;
	Поле1.Заголовок = "Количество";
	Поле1.Поле = Новый ПолеКомпоновкиДанных("Поступило");
	Поле2 = ГруппаВыбранныхПолей.Элементы.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
	Поле2.Использование = Истина;
	Поле2.Заголовок = "Цена";
	Поле2.Поле = Новый ПолеКомпоновкиДанных("ЦенаПриход");
	
	ГруппаВыбранныхПолей = Настройки.Выбор.Элементы.Добавить(Тип("ГруппаВыбранныхПолейКомпоновкиДанных"));
	ГруппаВыбранныхПолей.Использование = Истина;
	ГруппаВыбранныхПолей.Заголовок = "Собрано";
	Поле1 = ГруппаВыбранныхПолей.Элементы.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
	Поле1.Использование = Истина;
	Поле1.Заголовок = "Количество";
	Поле1.Поле = Новый ПолеКомпоновкиДанных("Собрано");
	Поле2 = ГруппаВыбранныхПолей.Элементы.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
	Поле2.Использование = Истина;
	Поле2.Заголовок = "Цена";
	Поле2.Поле = Новый ПолеКомпоновкиДанных("ЦенаСборки");
	
	ВыбранныеПоля = Настройки.Выбор.Элементы.Добавить(Тип("ВыбранноеПолеКомпоновкиДанных"));
	ВыбранныеПоля.Использование = Истина;
	ВыбранныеПоля.Заголовок = "Выручка";
	ВыбранныеПоля.Поле = Новый ПолеКомпоновкиДанных("Выручка");

	Настройки.ПараметрыВывода.УстановитьЗначениеПараметра("ВертикальноеРасположениеОбщихИтогов",РасположениеИтоговКомпоновкиДанных.Нет);
	Настройки.ПараметрыВывода.УстановитьЗначениеПараметра("Заголовок","Анализ цен комплектующих");
	
	ЭлементОтбора = Настройки.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Номенклатура");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.ВИерархии;
	ЭлементОтбора.ПравоеЗначение = Справочники.Номенклатура.НайтиПоНаименованию("Комплектующие");
	Настройки.ПараметрыВывода.УстановитьЗначениеПараметра("ВыводитьОтбор", ТипВыводаТекстаКомпоновкиДанных.НеВыводить);
	
	Возврат Настройки;
	
КонецФункции	

&НаСервере
Функция УстановитьСхему()
	
	СКД = Новый СхемаКомпоновкиДанных;
	
	ИД = СКД.ИсточникиДанных.Добавить();
	ИД.Имя = "ИсточникДанных";
	ИД.ТипИсточникаДанных = "Local";
	
	НаборДанных = СКД.НаборыДанных.Добавить(Тип("НаборДанныхОбъединениеСхемыКомпоновкиДанных"));
	НаборДанных.Имя = "НаборДанных1";
	Набор1 = НаборДанных.Элементы.Добавить(Тип("НаборДанныхОбъектСхемыКомпоновкиДанных"));
	Набор1.Имя = "ЦеныСборки";
	Набор1.ИмяОбъекта = "ЦеныСборки";
	Набор1.ИсточникДанных = "ИсточникДанных";	
	Набор2 = НаборДанных.Элементы.Добавить(Тип("НаборДанныхОбъектСхемыКомпоновкиДанных"));
	Набор2.Имя = "ЦеныПоступления";
	Набор2.ИмяОбъекта = "ЦеныПоступления";
	Набор2.ИсточникДанных = "ИсточникДанных";
	
	Поле1 = Набор1.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле1.Поле = "Номенклатура";
	Поле1.ПутьКДанным = "Номенклатура";
	Поле1.Заголовок = "Номенклатура";
	Поле2 = Набор1.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле2.Поле = "ЦенаСборки";
	Поле2.ПутьКДанным = "ЦенаСборки";
	Поле2.Заголовок = "Цена";
	Поле3 = Набор1.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле3.Поле = "Собрано";
	Поле3.ПутьКДанным = "Собрано";
	Поле3.Заголовок = "Количество";
	
	Поле1 = Набор2.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле1.Поле = "Номенклатура";
	Поле1.ПутьКДанным = "Номенклатура";
	Поле1.Заголовок = "Номенклатура";
	Поле2 = Набор2.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле2.Поле = "ЦенаПриход";
	Поле2.ПутьКДанным = "ЦенаПриход";
	Поле2.Заголовок = "Цена";
	Поле3 = Набор2.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	Поле3.Поле = "Поступило";
	Поле3.ПутьКДанным = "Поступило";
	Поле3.Заголовок = "Количество";
	
	ВычПоле = СКД.ВычисляемыеПоля.Добавить();
	ВычПоле.ПутьКДанным = "Выручка";
	ВычПоле.Заголовок = "Выручка";
	ВычПоле.Оформление.УстановитьЗначениеПараметра("Формат", "ЧЦ=6; ЧДЦ=0");
	
	ПолеРесурса = СКД.ПоляИтога.Добавить();
	ПолеРесурса.ПутьКДанным = "ЦенаПриход";
	ПолеРесурса.Выражение = "Среднее(ЦенаПриход)";
	ПолеРесурса = СКД.ПоляИтога.Добавить();
	ПолеРесурса.ПутьКДанным = "ЦенаСборки";
	ПолеРесурса.Выражение = "Среднее(ЦенаСборки)";
	ПолеРесурса = СКД.ПоляИтога.Добавить();
	ПолеРесурса.ПутьКДанным = "Поступило";
	ПолеРесурса.Выражение = "Сумма(Поступило)";
	ПолеРесурса = СКД.ПоляИтога.Добавить();
	ПолеРесурса.ПутьКДанным = "Собрано";
	ПолеРесурса.Выражение = "Сумма(Собрано)";
	ПолеРесурса = СКД.ПоляИтога.Добавить();
	ПолеРесурса.ПутьКДанным = "Выручка";
	ПолеРесурса.Выражение = "Сумма(Собрано) * (Среднее(ЦенаСборки) - Среднее(ЦенаПриход))";

	ПолеЦены = НаборДанных.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	ПолеЦены.Поле = "ЦенаСборки";
	ПолеЦены.ПутьКДанным = "ЦенаСборки";
	ПолеЦены.Оформление.УстановитьЗначениеПараметра("Формат", "ЧЦ=6; ЧДЦ=0");
	ПолеЦены = НаборДанных.Поля.Добавить(Тип("ПолеНабораДанныхСхемыКомпоновкиДанных"));
	ПолеЦены.Поле = "ЦенаПриход";
	ПолеЦены.ПутьКДанным = "ЦенаПриход";
	ПолеЦены.Оформление.УстановитьЗначениеПараметра("Формат", "ЧЦ=6; ЧДЦ=0");

	Возврат СКД;
	
КонецФункции	
