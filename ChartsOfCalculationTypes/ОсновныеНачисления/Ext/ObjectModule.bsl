﻿//вкладка «Вытесняющие» и включился «механизм вытеснения по периоду действия«.

//Примечание: в «Вытесняющие» можно добавить виды расчета принадлежащие только данному плану видов расчета.

 //вкладка «Ведущие» — на ней указываются виды расчета при изменении которых должен пересчитываться текущий вид расчёта. 
 //Здесь можно указать и виды расчёта из других планов видов расчёта. Например, вид расчета «Оклад» является ведущим для вида расчёта «Премия» 
 //т.е. при изменении оклада у нас должна пересчитаться и премия т.к. премия начисляется в зависимости от оклада. В данном случае вид расчёта «Оклад» принадлежит ПВР
 //«Основные начисления» использующем период действия, а вид расчета «Премия» принадлежит ПВР «Дополнительные начисления» не использующем период действия
 
  // «Графики» со структурой по-умолчанию. В справочнике «Графики» будем хранить режимы работы сотрудников(пятидневка, шестидневка и.т.д.).
  
  
  //Производственный календарь(рабочие и выходные дни). Для этих целей используем непериодический независимый регистр сведений.
  //Создадим непериодический независимый регистр сведений «Графики работы» с 2 измерениями «Дата» и «График» и ресурсом «Количество часов»
  //Благодаря регистру сведений «Графики работы» мы сможем начислять заработную плату от оклада пропорционально количеству отработанных дней.
  