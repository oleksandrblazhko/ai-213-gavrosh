|FR id|TC id|Опис кроків тестового сценарію|Опис очікуваних результатів|
|:-----:|:-----:|:-----|:-----:|
|FR1.1|TC 1.1|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> gender = "female"<br> date_of_birth = "18.07.2003"|Результат:<br>Temperature = Your work place now has excellent Temperature quality. The level of Temperature at the moment meets all norms and safety standards. You can enjoy fresh air and soft warm with safe living conditions. <br> Temperature = 25 degrees <br>result=1|
|FR1.1|TC 1.2|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = ""<br> gender = "female"<br> date_of_birth = "19.05.1999"|result=-1|
|FR1.1|TC 1.3|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> gender = "female 123&"<br> date_of_birth = "19.05.1999"|result=-1|
|FR1.1|TC 1.4|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> gender = "Tooo long input location "<br> date_of_birth = "19.05.1999"|result=-1|
|FR1.1|TC 1.5|Початкові умови: користувач має бути авторизований<br> Кроки сценарію:<br> user = "Sophia"<br> gender = "female"<br> date_of_birth = "19.05.1999..."|result=-1|
