weatherApp
Un pequeño ejemplo de lo que podria ser una app para muestreo del clima en diferentes regiones

Es importante considerar :

Aunque no era totalmente necesario.. se llevo a cabo el uso de CollectionView para la UI, 
esto tomando en cuenta un posible crecimiento del dataSource o la incorporación futura de 
nuevos elementos para mostrar al usuario…

La mejor opción a la hora de mostrar los datos actuales seria con las coordenadas de 
localización en las que se encuentre el usuario, sin embargo, tomando en cuenta que 
la app se desarrollo desde un simulador y no desde un teléfono real, hubo esa limitante con 
respecto a obtener la localización

Para saber la localización de las regiones se uso una API del sitio web https://datahelpdesk.worldbank.org
en la cual se obtuvo la información geográfica o coordenadas que posteriormente fueron usadas para obtener
el clima en cada región, esto usando la API de https://openweathermap.org
