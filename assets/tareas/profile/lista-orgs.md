## Script

```bash
✗ cat students-orgs.sh
#!/bin/bash
PATTERN="aet-2324-"
if [ -n "$1" ]; then
  PATTERN="$1"
fi
ALUORGS=$(gh org list -L 300 | grep -i $PATTERN)

for i in $(echo "$ALUORGS" | awk '{print $1}'); do
  echo "Org: $i"
  gh org-members -j -o $i | jq '.[] | {  name, login, role }'
done
```

## Lista de Orgs de alumnos

```bash
➜  aet-apuntes git:(main) ✗ date                                                            
Thu Nov  2 09:07:39 WET 2023
➜  aet-apuntes git:(main) ✗ ./studentorgs-and-roles.sh                                      
``` 

```bash
Org: ull-mfp-aet-2324-alu0100762341
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Airam González",
  "login": "falcon47",
  "role": "member"
}
{
  "name": "Casiano as ULL alumni",
  "login": "casiano-rodriguez",
  "role": "member"
}
{
  "name": "Daniel Afonso",
  "login": "Daniafonso11",
  "role": "admin"
}
{
  "name": "Alejandro Rguez Font",
  "login": "Alejandrofonte",
  "role": "member"
}
Org: ull-mfp-aet-2324-alu0100829952
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": null,
  "login": "JorgeS95",
  "role": "admin"
}
{
  "name": null,
  "login": "adrianrsac",
  "role": "member"
}
Org: ull-mfp-aet-2324-alu0100615975
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Airam González",
  "login": "falcon47",
  "role": "admin"
}
{
  "name": "carbarfal",
  "login": "alu0100596113",
  "role": "member"
}
Org: ull-mfp-aet-2324-alu0100817065
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": null,
  "login": "JorgeS95",
  "role": "member"
}
{
  "name": null,
  "login": "adrianrsac",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100774252
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Sergio Rodríguez",
  "login": "alu0100699968",
  "role": "member"
}
{
  "name": "Ivan",
  "login": "ivanjtr",
  "role": "member"
}
{
  "name": "Eduardo M",
  "login": "eduardomhd",
  "role": "member"
}
{
  "name": "Alejandro Rguez Font",
  "login": "Alejandrofonte",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0101052274
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Sergio Rodríguez",
  "login": "alu0100699968",
  "role": "member"
}
{
  "name": "Ivan",
  "login": "ivanjtr",
  "role": "member"
}
{
  "name": "Eduardo M",
  "login": "eduardomhd",
  "role": "admin"
}
{
  "name": "Alejandro Rguez Font",
  "login": "Alejandrofonte",
  "role": "member"
}
Org: ULL-MFP-AET-2324-alu0100699968
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Sergio Rodríguez",
  "login": "alu0100699968",
  "role": "admin"
}
{
  "name": "Eduardo M",
  "login": "eduardomhd",
  "role": "member"
}
Org: ull-mfp-aet-2324-alu0100833485
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "David Alonso Trujillo",
  "login": "DAT-995",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100825145
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Javier Castro González",
  "login": "alu0100825145",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100904604
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Ubay Guillermo De León ",
  "login": "Ubaygdl",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0101039183
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Joana",
  "login": "Joanadt98",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100773231
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "member"
}
{
  "name": "Paola",
  "login": "Paolacolli",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100596113
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "carbarfal",
  "login": "alu0100596113",
  "role": "admin"
}
Org: ULL-MFP-AET-2324-alu0101681092
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "MIGUEL",
  "login": "mibeldaribera",
  "role": "admin"
}
Org: ULL-MFP-AET-2324-alu0100224023
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Sergio Gutierrez Rojas",
  "login": "sergio-gr1234",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100821048
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Paula Alcántara Gutiérrez",
  "login": "Paula150395",
  "role": "member"
}
{
  "name": "Cristian ",
  "login": "CristianRA-1989",
  "role": "admin"
}
Org: ull-mfp-aet-2324-alu0100332025
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": null,
  "login": "OscarGarciaArteaga",
  "role": "admin"
}
Org: ULL-MFP-AET-2324-alu0100815207
{
  "name": "Casiano Rodriguez-Leon",
  "login": "crguezl",
  "role": "admin"
}
{
  "name": "Paula Alcántara Gutiérrez",
  "login": "Paula150395",
  "role": "admin"
}
{
  "name": "Cristian ",
  "login": "CristianRA-1989",
  "role": "member"
}
```