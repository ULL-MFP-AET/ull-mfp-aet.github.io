## Script

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

## Salida

```
aet-apuntes git:(main) ✗ ./students-classrooms.sh | cat -n 
     1  ull-mfp-aet-2324-alu0100774252 https://classroom.github.com/classrooms/149101820-ull-mfp-aet-2324-alu0100774252
     2  ull-mfp-aet-2324-alu0100615975 https://classroom.github.com/classrooms/149101458-ull-mfp-aet-2324-alu0100615975
     3  ull-mfp-aet-2324-alu0100762341 https://classroom.github.com/classrooms/149099772-ull-mfp-aet-2324-alu0100762341
```