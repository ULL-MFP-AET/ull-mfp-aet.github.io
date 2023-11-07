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

### Salida a 2023/11/02:

Salida de la ejecución del script:

```
aet-apuntes git:(main) ✗ ./students-classrooms.sh | cat -n 
     1  ull-mfp-aet-2324-alu0100774252 https://classroom.github.com/classrooms/149101820-ull-mfp-aet-2324-alu0100774252
     2  ull-mfp-aet-2324-alu0100615975 https://classroom.github.com/classrooms/149101458-ull-mfp-aet-2324-alu0100615975
     3  ull-mfp-aet-2324-alu0100762341 https://classroom.github.com/classrooms/149099772-ull-mfp-aet-2324-alu0100762341
```

Problema: Obviamente no estoy viendo  las aulas que han creado debido a que no soy TA en ellas.

### Salida a 2023/11/06:

```
aet-apuntes git:(main) gh classroom list --per-page 400 | grep -i aet-2324- | awk '{ print $2,$3}' | cat -n
     1  ull-mfp-aet-2324-alu0100774252 https://classroom.github.com/classrooms/149101820-ull-mfp-aet-2324-alu0100774252
     2  ull-mfp-aet-2324-alu0100615975 https://classroom.github.com/classrooms/149101458-ull-mfp-aet-2324-alu0100615975
     3  ull-mfp-aet-2324-alu0100762341 https://classroom.github.com/classrooms/149099772-ull-mfp-aet-2324-alu0100762341
     4  ULL-MFP-AET-2324-alu0100699968 https://classroom.github.com/classrooms/149103359-ull-mfp-aet-2324-alu0100699968
     5  ull-mfp-aet-2324-alu0101039183 https://classroom.github.com/classrooms/149103963-ull-mfp-aet-2324-alu0101039183
     6  ull-mfp-aet-2324-alu0100596113 https://classroom.github.com/classrooms/149103989-ull-mfp-aet-2324-alu0100596113
     7  ull-mfp-aet-2324-alu0100821048 https://classroom.github.com/classrooms/149104092-ull-mfp-aet-2324-alu0100821048
     8  ull-mfp-aet-2324-alu0100099904 https://classroom.github.com/classrooms/149103967-ull-mfp-aet-2324-alu0100099904
     9  ull-mfp-aet-2324-alu0100312201 https://classroom.github.com/classrooms/149710216-ull-mfp-aet-2324-alu0100312201
    10  ull-mfp-aet-2324-alu0100833485 https://classroom.github.com/classrooms/149103862-ull-mfp-aet-2324-alu0100833485
    11  ull-mfp-aet-2324-alu0101052274 https://classroom.github.com/classrooms/149102133-ull-mfp-aet-2324-alu0101052274
    12  ull-mfp-aet-2324-alu0100950625 https://classroom.github.com/classrooms/149526649-ull-mfp-aet-2324-alu0100950625
    13  ull-mfp-aet-2324-alu0100825145 https://classroom.github.com/classrooms/149103949-ull-mfp-aet-2324-alu0100825145
    14  ULL-MFP-AET-2324-alu0100815207 https://classroom.github.com/classrooms/149107114-ull-mfp-aet-2324-alu0100815207
    15  ull-mfp-aet-2324-alu0100904604 https://classroom.github.com/classrooms/149103950-ull-mfp-aet-2324-alu0100904604
    16  ull-mfp-aet-2324-alu0100332025 https://classroom.github.com/classrooms/149104093-ull-mfp-aet-2324-alu0100332025
```

Faltan

- miguel-belda-ribera-alu0101681092
- paola-gonzalez-colli-alu0100773231
- sergio-gutierrez-rojas-alu0100224023

## Solución

Las organizaciones se administran en github.com, no en classroom.github.com.
Además de invita a los profesores ayudantes como owners a tu organización de GitHub debes:

La siguiente figura muestra la sección `TAs and admins` de la página de un classroom:

![/assets/images/github-classroom-tas-and-admins.png)]({{site.baseurl}}/assets/images/github-classroom-tas-and-admins.png)

1. Visita la página de tu classroom y haz click en el botón `TAs and admin`.
1. Envia la URL de invitación al GitHub Classroom al TA. 
2. Una vez que el TA inicie sesión en GitHub Classroom usando el enlace de invitación, se agregará automáticamente a tu aula como administrador. 

Para pasarle la URL al TA  

1. Añade la URL de tu GH Classroom en el documento Google docs compartido creado por el profesor 
2. Encontrarás un enlace a dicho documento en la tarea 
<a href= "https://campusdoctoradoyposgrado2324.ull.es/mod/assign/view.php?id=14547&forceview=1" target="_blank">Creando Perfiles, Organizaciones, Aulas y Asignaciones</a> del Campus. Es el enlace con título **Documento Google docs compartido para rellenar la URL de tu GitHUb Classroom**.
   
