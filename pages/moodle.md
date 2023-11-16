---
title: Importar un sitio web a Moodle
---

# {{ page.title }}

Es posible alojar un sitio web dentro de Moodle siguiendo estas instrucciones:

1. Asegúrese de que todos los enlaces dentro de sus páginas web sean relativos entre sí, es decir, si tiene una página `index.html` y una página `book.html` en el mismo directorio, como un enlace a la página `book.html` desde la "página de índice", tiene "/book.html". De lo contrario, los enlaces no funcionarán correctamente. 
   - Lea la sección [Comprensión de site.url y site.baseurl](jekyll-baseurl.html) para aprender cómo hacerlo con Jekyll
2. **Construya su site estableciendo su `baseurl`**. Por ejemplo en Jekyll:
    - Use `permalink` en todas las páginas para que los enlaces sean relativos.
    - El comando Jekyll `build` admite una opción `-b` para establecer la `baseurl`. 
    - Utilice como `baseurl` el camino donde se alojará su sitio en Moodle. 
      Por ejemplo, si los ficheros en el sitio Moodle se alojan en  
   
      ```
      https://campusvirtual.ull.es/ocw/pluginfile.php/19489/mod_resource/content/3/_site/
      ``` 
      el comando en Jekyll sería
      ```
      bundle exec jekyll build -b '/ocw/pluginfile.php/19489/mod_resource/content/3/_site'
      ```
3. Comprima el directorio raíz del sitio en un único archivo zip. En una Mac `zip -r _site.zip _site`
4. Vaya al curso de Moodle y haga clic en el botón <button>Activar edición</button>.
5. Elija el bloque de temas donde desea agregar la tarea y haga clic en **Agregar una actividad o recurso**.
6. Seleccione la actividad **Archivo** en el Selector de actividades.
7. Agregue el archivo zip como archivo para este recurso. 
   <!--![Zip file added](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.19.29-PM.png)-->
   - ![subir-un-archivo.png](/assets/images/subir-un-archivo.png)
   - ![seleccion-archivo-zip.png](/assets/images/seleccion-archivo-zip.png)
8. Seleccione el archivo zip en el selector de archivos y aparecerá una ventana emergente.
     - Seleccione **descomprimir**
     <!--![Select "Unzip" to open the compressed website file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.14.18-PM.png)-->
     - ![Select "Unzip" to open the compressed website file](/assets/images/descomprimir_site_zip.png)
     - Aparecerá una carpeta en el selector de archivos.
     - ![/assets/images/una-vez-descomprimido.png](/assets/images/una-vez-descomprimido.png)
9.  Navegue hasta la carpeta y seleccione su página de "índice".
   - Una vez seleccionado, elija la opción "Establecer archivo principal" en la ventana emergente.

     <!-- ![Set the main file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.22.28-PM.png)-->
     ![Set the main file](/assets/images/configurar-archivo-principal.png)

10. En la opción de recurso "Apariencia" hay varias opciones de visualización que le permiten configurar la página web para que se incruste en el sitio, se abra como una ventana emergente, etc.
     ![Set the Display setting to "Embed"](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.15.50-PM.png)

**Nota:** Los archivos individuales se pueden actualizar una vez finalizado este proceso, por lo que no tendrás que volver a cargar el archivo zip completo cada vez que sea necesario realizar un cambio.

## Referencias

* Véase también [Importing a Website into Moodle](https://help.lafayette.edu/importing-a-website-into-moodle/) 