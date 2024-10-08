﻿
&НаКлиенте
Процедура Выгрузить(Команда)
	ВыгрузитьСервер(Документ,КаталогЗагрузки);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ЗаписатьЭлементХМЛ(Документ, Значение, ИмяРеквизита, ИмяАтрибута = "Имя")

	ТипХМЛ = XMLТипЗнч(Значение);
	Документ.ЗаписатьНачалоЭлемента(ТипХМЛ.ИмяТипа, ТипХМЛ.URIПространстваИмен);
	Документ.ЗаписатьАтрибут(ИмяАтрибута, ИмяРеквизита);
	Документ.ЗаписатьТекст(XMLСтрока(Значение));
	Документ.ЗаписатьКонецЭлемента();
	
КонецПроцедуры
 

&НаСервереБезКонтекста
Процедура ВыгрузитьСервер(Ссылка,КаталогЗагрузки)

	ДокументХМЛ = Новый ЗаписьXML;
	ДокументХМЛ.ОткрытьФайл(КаталогЗагрузки+"\doc.xml");
	ДокументХМЛ.ЗаписатьОбъявлениеXML();
	ДокументХМЛ.ЗаписатьНачалоЭлемента("Root");
	//Определяем описание типа - возвращаемое значение тип данных XML
	ТипХМЛ = XMLТипЗнч(Ссылка);
	// тип имеет два свойсва имя типа и Имя пространства имен
	// записываем начало элемента
	ДокументХМЛ.ЗаписатьНачалоЭлемента(ТипХМЛ.ИмяТипа, ТипХМЛ.URIПространстваИмен);
	// так как в документе могут присутствовать ссылки на другие документы - установим атрибут Загрузка, 
	//для того, чтобы сказать системе, что данный документ будет создаваться
	ДокументХМЛ.ЗаписатьАтрибут("Загрузка", "1");
	
	ЗаписатьЭлементХМЛ(ДокументХМЛ, Ссылка.Дата, "Дата");
	ЗаписатьЭлементХМЛ(ДокументХМЛ, Ссылка.Номер, "Номер");
	// обходим все реквизиты
	Для каждого Реквизит Из Ссылка.Метаданные().Реквизиты Цикл
		ЗаписатьЭлементХМЛ(ДокументХМЛ, Ссылка[Реквизит.Имя], Реквизит.Имя);
	КонецЦикла; 
	 // табличная часть не серилизуется, необходимо вручную записать начало и конец элемента для каждой табличной части
	Для каждого ТабличнаяЧасть Из Ссылка.Метаданные().ТабличныеЧасти Цикл
		ДокументХМЛ.ЗаписатьНачалоЭлемента("ТабличнаяЧасть");
		ДокументХМЛ.ЗаписатьАтрибут("Имя", ТабличнаяЧасть.Имя);
		// обходим и выгружаем все реквизиты табличной части
		Для каждого Строка Из Ссылка[ТабличнаяЧасть.Имя] Цикл
			ДокументХМЛ.ЗаписатьНачалоЭлемента("СтрокаТабличнойЧасти");
			Для каждого Реквизит Из ТабличнаяЧасть.Реквизиты Цикл
				// для того, чтобы при загрузке можно было понять, что этот атрибут содержит именно реквизит табличной части
				ЗаписатьЭлементХМЛ(ДокументХМЛ, Строка[Реквизит.Имя], Реквизит.Имя, "ИмяТЧ");
			КонецЦикла; 
			ДокументХМЛ.ЗаписатьКонецЭлемента();
		КонецЦикла; 
		
		ДокументХМЛ.ЗаписатьКонецЭлемента();
	КонецЦикла; 
	
	
	ДокументХМЛ.ЗаписатьКонецЭлемента();
	
	ДокументХМЛ.ЗаписатьКонецЭлемента();
	ДокументХМЛ.Закрыть();

КонецПроцедуры // ВыгрузитьСервер()
 &НаКлиенте
Процедура КаталогЗагрузкиНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	Фильтр="Все файлы(*.*)|*.*";	
	ЗаголовокДиалога ="Выберите путь для отображения файлов";
	ТекКаталог = КаталогЗагрузки;
	КаталогЗагрузки=РаботаСФайламиКлиент.ВыборФайловИКаталогов("Каталог",Фильтр,ЗаголовокДиалога);
	
КонецПроцедуры
