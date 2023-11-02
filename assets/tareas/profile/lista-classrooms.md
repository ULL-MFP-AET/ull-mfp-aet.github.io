## Viendo las aulas de un profesor desde la terminal

```
➜  aet-apuntes git:(main) ✗ cat students-classrooms.sh 
```

```bash
#!/bin/bash
PATTERN="aet-2324-"
if [ -n "$1" ]; then
  PATTERN="$1"
fi
gh classroom list --per-page 400 | grep -i $PATTERN | awk '{print $2, $3}'
```

Salida de la ejecución del script:

```
aet-apuntes git:(main) ✗ ./students-classrooms.sh | cat -n 
     1  ull-mfp-aet-2324-alu0100774252 https://classroom.github.com/classrooms/149101820-ull-mfp-aet-2324-alu0100774252
     2  ull-mfp-aet-2324-alu0100615975 https://classroom.github.com/classrooms/149101458-ull-mfp-aet-2324-alu0100615975
     3  ull-mfp-aet-2324-alu0100762341 https://classroom.github.com/classrooms/149099772-ull-mfp-aet-2324-alu0100762341
```

Problema: Obviamente no estoy viendo  las aulas que han creado debido a que no soy TA en ellas.

## Solución

Las organizaciones se administran en github.com, no en classroom.github.com.
Además de invita a los profesores ayudantes como owners a tu organización de GitHub debes:

1. Enviar la URL de invitación al GitHub Classroom al TA**. 
2. Una vez que el TA inicie sesión en GitHub Classroom usando el enlace de invitación, se agregará automáticamente a tu aula como administrador. 

Para inivtar al TA  añade la URL de tu GH Classroom en el documento Google docs compartido creado por el profesor y que encontrarás en la tarea <a href= "https://campusdoctoradoyposgrado2324.ull.es/mod/assign/view.php?id=14547&forceview=1" target="_blank">Creando Perfiles, Organizaciones, Aulas y Asignaciones</a> del Campus.
   
La figura muestra la sección `TAs and admins` de la página de un classroom:

![/assets/images/github-classroom-tas-and-admins.png)]({{site.baseurl}}/assets/images/github-classroom-tas-and-admins.png)

