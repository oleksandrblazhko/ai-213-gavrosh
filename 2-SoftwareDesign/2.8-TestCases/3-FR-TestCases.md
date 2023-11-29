|FR id|TC id|Опис кроків тестового сценарію|Опис очікуваних результатів|
|:-----:|:-----:|:-----|:-----:|
|FR1.1|TC 1.1|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> work_place= "office"<br> email = "Sonia1997@gmail.com"|Результат:<br>Temperature = Your work place now has excellent Temperature quality. The level of Temperature at the moment meets all norms and safety standards. You can enjoy fresh air and soft warm with safe living conditions. <br> Temperature = 25 degrees <br>result=1|
|FR1.1|TC 1.2|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = ""<br> work_place = "office"<br> email = "Sonia1997@gmail.com"|result=-1|
|FR1.1|TC 1.3|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> work_place = "office 123&"<br> email = "Sonia1997@gmail.com"|result=-1|
|FR1.1|TC 1.4|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> work_place = "Tooo long input work_place "<br> email = "Sonia1997@gmail.com"|result=-1|
|FR1.1|TC 1.5|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> work_place = "office"<br> email = "Sonia1997@gmail.com.............."|result=-1|
